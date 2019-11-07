어떤 문제가 있었는지? (무엇을 고민했는지)
어떻게 해결했는지? (왜 그 방향으로 선택했는지)

내가 했던 방식을 서술할 수 있어야 함 (그래야 최소한 구현을 할 수 있을테니)

### 기억에 남는 부분

1. AnnotationHandler 조지기
    - 과정이 어떻게 되나요?
2. RequestMethod.ALL 의 의미

https://github.com/woowacourse/jwp-mvc/pull/69#discussion_r336726328

> 위에 적어준 질문에 대한 제 생각은,
아직까지 저도 ALL을 사용하는 컨트롤러는 보지 못했습니다 :slightly_smiling_face:
또한 생각하신 방법으로 구현하는 것도 좋은 방법일 수 있지만, HandlerKey는 url + method 조합의 key 용도로만 사용하는 것이 더 적절할 것 같습니다.
따라서 HandlerKey가 RequestMethod가 없는 경우 ‘모든 타입의 RequestMethod’로 생각해달라는 책임 역시 조금은 어울리지 않는 것 같고요.
다만, HandlerKey에 url, method가 일치하는지 등의 메시지를 받아주는 역할 정도는 될 수 있겠네요!

3. 테스트에 대한 인식
    - 왜 테스트를 로그로 하면 안될까?
        - 무엇을 검증해야 할지 명시적으로 드러나지 않음
        - 다른 테스트도 대충 짜고 싶게 만듬 (주차된 차의 창문이 깨져 있을 때의 경우)
4. 점진적으로 바꿔가기 
    - Controller -> HandlerExecution 으로 바꾼 과정
        - 어댑터를 사용했던 과정을 설명 할 수 있을까? (그림으로라도)
5. 내가 생각하는 mvc 프레임워크란?? (내가 이해할 수 있는 형태? 특징)
    - 사용자 코드에서는 무엇만 제공하면 되는지
        - 현재는 SlippWebApplicationInitializer implements WebApplicationInitializer 를 제공
        - 이곳에 적용하고 싶은 서블릿을 등록 (여기선 HandlerMapping 을 추가한 DispatcherServlet)
        - 또한 @Controller 를 달고 있는 구현체들을 작성해주면 됨
    - 프레임워크에서 하는 일
        - 특정 url + method 를 가지고 내가 등록한 Controller 를 실행
        - Controller 의 결과를 가지고 응답(response)을 생성하고 이를 전송
            - 사용자가 어떤 형태 데이터(Model) 을 어떤 포맷(View)으로 응답할지를 Controller 에 작성
            - 프레임워크는 그 요구에 맞게 처리해주는 역할
    - Model, View, Controller 로 나눈 이유?
        - 요청을 응답(그려줄 데이터)으로 만드는 과정가운데서 역할을 나눔
            - Controller는 Model 과 View 를 연결해준다고 하는구만

> 사용자가 보는 페이지, 데이터처리, 그리고 이 2가지를 중간에서 제어하는 컨트롤, 이 3가지로 구성되는 하나의 애플리케이션을 만들면 각각 맡은바에만 집중을 할 수 있게 됩니다. 

> 서로 분리되어 각자의 역할에 집중할 수 있게끔하여 개발을 하고 그렇게 애플리케이션을 만든다면, 유지보수성, 애플리케이션의 확장성, 그리고 유연성이 증가하고, 중복코딩이라는 문제점 또한 사라지게 되는 것입니다.  그러기 위한 MVC패턴입니다.

(출처: https://m.blog.naver.com/jhc9639/220967034588)

6. [] 을 비교해야하는 경우
    - Objects.deepEquals 를 사용
        - [] 를 포함한 Map 은 deepEquals 로도 비교 불가
            - Objects.deepEquals 가 재귀적으로 equals 를 사용하는데.. 각 객체의 equals 를 사용
            - Map 은 내부적으로 그냥 equals 로 비교하기 때문
7. Reflection 을 위한 테스트 helper
    - ExpectedMethod
        - 빌더 사용(넘나 많은 파라미터)
        - Reflection 에서 내가 원하는 값을 만들 방법이 없음 (expected 인 값을 만들 수 있어야 그것을 이용해서 비교하는데..)
        - Reflection.XXX 이 표현할 수 있는 정보를 담은 ExpectedXXX 를 만듬
            - 내부에 assert 함수 존재


![Alt text](pictures/.png?raw=true "Title")

-----------------------------
AnnotationHandlerMapping 변천사
```java 
public class AnnotationHandlerMapping implements HandlerMapping {
    private static final Logger log = LoggerFactory.getLogger(AnnotationHandlerMapping.class);

    private final HandlerExecutionFactory handlerExecutionFactory = HandlerExecutionFactory.getInstance();
    private final HandlerKeyFactory handlerKeyFactory = HandlerKeyFactory.getInstance();

    private Object[] basePackages;
    // [TODO] 좀 더 확장성 있게 할 수 있지 않을까?
    private HandlerExecutionHandlerMapping mapping;

    public AnnotationHandlerMapping(Object... basePackages) {
        this.basePackages = basePackages;
    }

    @Override
    public void initialize() {
        log.info("Initialized !");
        Builder mappingBuilder = HandlerExecutionHandlerMapping.builder();
        for (Object basePackage : basePackages) {
            if (!(basePackage instanceof String)) {
                log.error("not supported basePackage: {}", basePackage.getClass());
                return;
            }
            registerHandler((String) basePackage, mappingBuilder);
        }

        mapping = mappingBuilder.build();
        mapping.initialize();
    }

    private void registerHandler(String basePackagePrefix, Builder mappingBuilder) {
        ComponentScanner componentScanner = ComponentScanner.fromBasePackagePrefix(basePackagePrefix);

        Map<Class<?>, Object> controllers = componentScanner.scan(Controller.class);
        for (final Class<?> controllerClass : controllers.keySet()) {
            log.info("controllerClass :{}", controllerClass);

            registerHandlerFromClass(controllerClass, mappingBuilder);
        }
    }

    private void registerHandlerFromClass(Class<?> controllerClass, Builder mappingBuilder) {
        List<Method> methods = Arrays.asList(controllerClass.getDeclaredMethods());

        methods.stream()
                .filter(method -> method.isAnnotationPresent(RequestMapping.class))
                .forEach(method -> registerFromMethod(method, mappingBuilder));
    }

    private void registerFromMethod(Method method, Builder mappingBuilder) {
        try {
            tryRegisterFromMethod(method, mappingBuilder);
        } catch (RuntimeException e) {
            log.error("error: {}", e);
            throw NextstepMvcException.ofException(e);
        }
    }

    private void tryRegisterFromMethod(Method method, Builder mappingBuilder) {
        HandlerExecution execution = handlerExecutionFactory.fromMethod(method);

        handlerKeyFactory.fromMethod(method).stream()
                .forEach(key -> {
                    mappingBuilder.addKeyAndExecution(key, execution);
                });
    }

    @Override
    public Optional<Object> getHandler(HttpServletRequest request) {
        return mapping.getHandler(request);
    }
}
```


```java
public class AnnotationHandlerMapping implements HandlerMapping {
    private static final Logger log = LoggerFactory.getLogger(AnnotationHandlerMapping.class);
    private static final AnnotatedMethodScanner ANNOTATED_METHOD_SCANNER = AnnotatedMethodScanner.getInstance();

    private final HandlerExecutionFactory handlerExecutionFactory = HandlerExecutionFactory.getInstance();
    private final HandlerKeyFactory handlerKeyFactory = HandlerKeyFactory.getInstance();

    private Object[] basePackages;
    // [TODO] 좀 더 확장성 있게 할 수 있지 않을까?
    private HandlerExecutionHandlerMapping mapping;

    public AnnotationHandlerMapping(Object... basePackages) {
        this.basePackages = basePackages;
    }

    @Override
    public void initialize() {
        log.info("Initialized !");
        Builder mappingBuilder = HandlerExecutionHandlerMapping.builder();

        List<Method> handlerMethods = findHandlerMethods();
        registerHandlerMethods(handlerMethods, mappingBuilder);

        mapping = mappingBuilder.build();
        mapping.initialize();
    }

    private List<Method> findHandlerMethods() {
        List<Class<?>> controllerClasses = Arrays.asList(basePackages).stream()
                .map(basePackage -> validateBasePackage(basePackage))
                .map(basePackage -> ComponentScanner.fromBasePackagePrefix(basePackage))
                .map(componentScanner -> componentScanner.scan(Controller.class).keySet())
                .flatMap(keySet -> keySet.stream())
                .collect(Collectors.toList());

        return ANNOTATED_METHOD_SCANNER.scan(controllerClasses, RequestMapping.class);
    }

    private String validateBasePackage(Object basePackage) {
        if (!(basePackage instanceof String)) {
            log.error("not supported basePackage: {}", basePackage.getClass());
            throw NotSupportedBasePackageTypeException.basePackage(basePackage);
        }
        return (String) basePackage;
    }

    private void registerHandlerMethods(List<Method> methods, Builder mappingBuilder) {
        for (Method method : methods) {
            registerFromMethod(method, mappingBuilder);
        }
    }

    private void registerFromMethod(Method method, Builder mappingBuilder) {
        HandlerExecution execution = handlerExecutionFactory.fromMethod(method);
        List<HandlerKey> handlerKeys = handlerKeyFactory.fromMethod(method);

        for (HandlerKey key : handlerKeys) {
            mappingBuilder.addKeyAndExecution(key, execution);
        }
    }

    @Override
    public Optional<Object> getHandler(HttpServletRequest request) {
        return mapping.getHandler(request);
    }
}
```

- AnnotationHandlerMapping 의 역할
    - 각 패키지들에 대해서
    - @Controller 달린 클래스에서
    - @RequestMapping 달린 메소드를 찾아서
    - HandlerKey 를 만들고
        - 팩토리로 분리
    - HandlerExecution 을 만든 후
        - 팩토리로 분리
    - HandlerMapping 에 등록
        - 빌더로 분리

일단.. 흐름의 변화가 있음
- 메소드를 찾는 작업을 미리 할 것인지 (모든 패키지들에서) 아니면 패키지마다 동일한 작업을 반복할 것인지
    - 미리하기 좋은 부분은.. stream 을 사용해서 하나로 합치기가 쉬웠음
    - 그리고 전체적인 흐름도 HandlerMethod 를 등록하는데 집중 할 수 있게 됨


### 우테코강의에서 기억에 남는 부분

- WS vs WAS vs 서블릿 컨테이너
    - A servlet-container supports only the servlet API (including JSP, JSTL).
    - An application server supports the whole JavaEE - EJB, JMS, CDI, JTA, the servlet API (including JSP, JSTL), etc.

- 서블릿이란?
    - 자바 진영에서 동적인 웹 페이지를 구현하기 위한 표준
    - Servlet 표준을 정한 후 interface 제공
    - 각 interface 에 대한 구현체는 Servlet Container(Tomcat, Jetty)가 제공

- 서블릿 컨테이너와 서블릿의 역할
    - 서블릿은 사용자의 요청에 대한 처리와 처리 겨로가에 따른 응답을 담당. 웹 개발자가 실질적인 구현을 담당할 부분
    - 서블릿 컨테이너는 서블릿의 인스턴스를 생성해 URL과 매핑하고, URL 요청에 해당하는 서블릿을 실행

- 점진적인 리팩토링
    - 공존할 수 있는 형태로 만들기

### 코드 리뷰
View 에 render 라는 함수가 존재
- 얻은 model 과, reqeust, response 를 가지고 그리는 부분
    - 클라이언트에서 보내주는 부분은 response 에서 Writer (혹은 OutputStream) 에 써주면 됨

###  미션을 통해 돌아보는 나

써머님이 피드백이 바로 반영되는게 좋았다고 하셨다.  
아직은 내 코드에서 일관성이 부족한 것 같다.  
먼가.. 힌트나 무엇이 좋은지를 알면 구현은 할 수 있는데.. 스스로 적립이 되지 않은?  

-----------------


### 아직 잘 모르겠는 부분

1. 패키지 경로관련 문제 (테스트에서 특정 패키지 명을 입력했을 때... 메인의 경로의 있는 패키지를 참조하는 건지 혹은 테스트에 있는 것을? 둘다 존재한다면?)
현재 테스트 코드에서 new Reflactions("패키지 명") 을 사용하고 있음
- 확인해본 결과
    - main, test 에 examples 이 각각 존재하면 둘을 합친 결과를 리턴
        - QnaControllerInMain, QnaControllerInTest 둘다 리턴됨!
- https://github.com/woowacourse/jwp-mvc/blob/25c9521f9552a8fc60c2460c0141f3c8c40575cf/study/src/test/java/reflection/ReflectionsTest.java#L20

// 점차 여러 모듈이 한 프로젝트에 존재하게 되는데... 그래서 클래스 경로에 관한 이해가 필요해진다...