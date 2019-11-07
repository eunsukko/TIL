어떤 문제가 있었는지? (무엇을 고민했는지)
어떻게 해결했는지? (왜 그 방향으로 선택했는지)

내가 했던 방식을 서술할 수 있어야 함 (그래야 최소한 구현을 할 수 있을테니)

### 기억에 남는 부분

1. 무엇에 집중해야 하는지
    - 현재는 특정 기술 or 기능(aop) 보단 좋은 습관을 만들도록 노력이 필요
        - 현재 요구 사항에 충실
            - 리팩토링을 통한 기능 추가 or 완성
    - 예를들어..
        - 예외처리
        - 테스트
        - 간단한 로직
            - 중복제거
            - 예시 (https://github.com/woowacourse/jwp-was/pull/46#discussion_r328444757)
        - 함수 인자는 불변
        - early-exit
2. 예외 처리에 대한 고민 ( https://www.slipp.net/questions/350 )

> 이 부분은 명확히 말씀드리기는 어려워요. 고민하고 계신 것 처럼 이게 정말 실패한 것인지 아니면 동작은 실패했지만 성공적인 동작으로 보아야 하는지와 같은 생각을 해야해요. 이것은 사람마다 다를 것이기 때문에 명확하지는 않습니다.
>
> 저같은 경우 예외를 던지는 경우는 예외 처리에 대한 레이어링이 명확하게 되어있을 때 자주 사용합니다. 이 예외가 처리되지 않고도 내가 설정한 예외처리 레이어링까지 도달했을 때 내가 의도한데로 동작하게 끔 하는 것이죠. 이러한 예로 대부분 웹서버에서 IlligalArgumentException 이 발생했을 때 사용자가 아무런 처리를 하지 않아도 4xx 에러를 내려주지요.) 예외의 편리함 점은 계층을 건너뛰어 처리되기가 좋다는 것이지요. 실제로 unchecked exception 은 정말 많이 사용됩니다.


3. 함수 인자는 불변으로! (https://github.com/woowacourse/jwp-was/pull/46#discussion_r328039531)
    - 인자로 들어오는 참조형 객체에 대해서 어떤 약속을 가져야할까용?
        - 어떤 경우가 있을까?
            - 외부에서 인자로 들어온 객체를 수정할 경우(함수 내에서 영향을 받음)
            - 내부에서 인자로 들어온 객체를 수정할 경우(외부에서 영향을 받음)
    - 팀에서도 약속이 있는 것 같다(서로 코드리뷰를 한다면.. 이 또한 같이 정해갈 수 있는 약속일 듯하다)
        - 지금 생각나는 경우는 상태를 바꾸는 쪽이 새로운 복사본을 만들어서 사용하면 될 것 같다.
            - 서로 메시지를 주고 받지 않는 이상.. 상태를 바꾸는 쪽만 '상태가 바뀜'을 알고 있기 때문
4. early-exit
    - 값을 끝까지 가져가기 보다는 예외되는 상황에서 빨리 반환해주는 기법
    - 예외상황을 빨리 처리해서 신경 쓸 필요가 없도록 하자(신경 쓸 필요가 없음은.. 코드에서는 불필요한 상태, 정보를 들고 있지 않음을 의미 -> 간단한 코드!)
```java
// before
HttpRequestParameter httpRequestParameters = HttpRequestParameter.EMPTY_PARAMETER;
if (1 < splittedUrl.length) {
    httpRequestParameters = HttpRequestParameter.of(splittedUrl[1]);
}
return httpRequestParameters;

// after
if(splittedUrl.length < 1) {
    return HttpRequestParameter.EMPTY_PARAMETER;
}
return HttpRequestParameter.of(splittedUrl[1]);
```

5. 테스트에 대한 고민 (https://github.com/woowacourse/jwp-was/pull/46/files#r328042251)
```
행위가 변경되면, 해당 행위와 연관된 테스트가 영향을 받음!  
(행위의 일부 요소를 떨어트려 테스트 할 필요가 없는 이유 -> 모여있어야 그 부분만 영향을 받기에)

> 우리는 행위를 이루는 설계를 테스트 해야합니다

테스트도 Cohesion 을 생각하면서 짜야하겠구나..
```
    - HttpRequest 부분
        - HttpRequest 는 Reader 로 전달된 request 바이트 덩어리에서 HttpRequest 를 생성
            - 각 getXXX 메소드는 결국 전달된 데이터에서 필요한 정보를 잘 뽑아낸 HttpRequest 에서 해당 정보를 읽는 것
        - 그렇다면 테스트는 무엇에 집중해야하는가?
        - 각 요청 데이터에 대한 검증(현재 코드)
            - 상황, 혹은 문맥에 따른 HttpRequest 생성
            - 요청이 추가된다면?
                - 해당 요청에 대한 테스트 추가
            - getXXX 가 추가된다면?
                - 해당하는 문맥(요청과 연관된)에 대해서 테스트 추가
            - 이렇게 하면 해당 요청에 집중해서 검증하기가 좋구만
                - HttpRequest 가 하는 행위 자체가 '요청 정보로 부터 객체 생성' 이기 때문에
        - 각 getXXX 에 대한 검증
            - (각 getXXX * 각 요청 데이터) 만큼 테스트가 생김
            - 요청이 추가된다면?
                - 모든 getXXX 에 대해서 테스트 추가..
            - getXXX 가 추가된다면?
                - 모든 문맥에 대해서 테스트 추가
> https://www.youtube.com/watch?v=UttzAcbuk5k
> 영상의 구현 테스트, 설계 테스트에 대한 부분을 보시면 도움이 되실거에요.
>                 
> 연사님께서도 우리가 테스트해야하는 경계에 대해서는 구조에 따라 다르고 상황에 따라 다르다라고 합니다. 그렇다면 현재의 코드에서 요구사항을 만족하면서 내부적인 구현이 변하더라도 가장 유연하게 테스트가 유지될 수 있는 선은 어디일지도 생각해보면 좋겠네요!
> 
> 테스트는 항상 어렵습니다! 그렇지만 테스트로인해 우리는 자신감과 안정감을 얻을 수 있어요. 계속하여 더 유연한 테스트가 되도록 고민하고 리펙토링해야할거에요.

6. Optional
    - Optional 은 비싸다
        - 단순히 null 을 얻을 목적이라면 Optional 대신 null 비교를 하자
``` java
// 안 좋음
return Optional.ofNullable(status).orElse(READY);

// 좋음
return status != null ? status : READY;
```
        - 생성자나 메서드 인자로 사용 금지
            - 메서드에서 null 체크 책임을 가지자
``` java
// 안 좋음
public class HRManager {
    public void increaseSalary(Optional<Member> member) {
        member.ifPresent(member -> member.increaseSalary(10));
    }
}
hrManager.increaseSalary(Optinoal.ofNullable(member));

// 좋음
public class HRManager {
    public void increaseSalary(Member member) {
        if (member != null) {
            member.increaseSalary(10);
        }
    }
}
hrManager.increaseSalary(member);
```
    - Optional 깔끔한 코드..!
> 또한 Optional 의 과용 (Optional.ofNullable().orElse()) 는 피하는게 좋아요. 사용함으로서 얻는 이득이 전혀 없습니다. 단순 삼항식 또는 분기문으로 처리 가능한 부분은 가장 쉽게 작성하는게 좋습니다.

``` java
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String userId = req.getParameter("userId");
        String password = req.getParameter("password");

        return userDao.findByUserId(userId)
                .filter(user -> user.matchPassword(password))
                .map(user -> login(req, user))
                .orElseGet(() -> failLogin(req));
    }

    private String login(HttpServletRequest req, User user) {
        HttpSession session = req.getSession();
        session.setAttribute(UserSessionUtils.USER_SESSION_KEY, user);
        return "redirect:/";
    }

    private String failLogin(HttpServletRequest req) {
        req.setAttribute("loginFailed", true);
        return "/user/login.jsp";
    }
```

    - 나름 정리
        - Optional.orElseThrow()
            - 빠른 예외 던지기 (그나마 early-exit 과 비슷함)
        - Optional.orElse(), .orElseGet()
            - 대체할 수 있는 기본값이 존재하는 경우
            - 이후부터는 항상 존재하는 경우
        - filter, map
            - Optional<T> -> Optional<U> -> Optional<V> ...
            - 변화하는 흐름
                - 흐름에서 성공한 경우
                - 흐름에서 실패한 경우
            - map 안에서 여러줄인 로직(private 메서드)을 처리할 수 있음
            - 결국 어떤 결과로 변화하는 흐름
            

참조
- Optional 바르게 쓰기  (https://homoefficio.github.io/2019/10/03/Java-Optional-%EB%B0%94%EB%A5%B4%EA%B2%8C-%EC%93%B0%EA%B8%B0/)
- Optional isPresent() is Bad for You. (https://dzone.com/articles/optional-ispresent-is-bad-for-you)


7. 점진적인 변경
    - RequestHandler 에서 Controller 를 사용하던 부분을 PageProvider 라는 새로운 단위를 사용할 수 있도록 변경
        - PageProvider 와 Page 를 사용하는 코드로 RequestHandler 수정
        - 기존 Controller 를 PageProvider 로 보이도록(adaptor 역할)처리
            - PageTemplateController 가 이 역할을 했음
                - 기존 Controller 는 HttpResponse 에 응답을 써주는 역할까지 담당했음
                    - Page 얻어낸 후 동작은 기존 Controller 들이 동일함
                    - 공통된 부분을 PageTemplateController 에서 처리
8. 세션
    - 구현방식
        - invalidate 부분을 AbstractSession 에서 책임짐
        - 이를 구현하는 Session 들은 attribute 를 저장/조회 만 구현하면 됨 (HashMap을 쓰든, ConcurrentHashMap 을 쓰든 필요에 맞게)
9. 그래서 WAS 란?
    - Content-Type, Accept 관점
        - 그래도 서버가 제공해주는 타입이.. 조금은 제한되는 듯
10. Content-Type 결정 흐름
    - 서버와 클라이언트가 교감? 하는 작업
        - 클라이언트는 처리할 수 있는 타입 정보를 Accept 를 통해 전달
        - 서버는 클라이언트가 처리할 수 있는 타입 중에서 자신이 처리 가능한 높은 우선순위의 타입으로 처리

###  미션을 통해 돌아보는 나

aop 를 적용해보았음. 해보고 싶은 것을 해보는 것은 좋은데.. 킹뽀대님이 보시기엔 현재 미션에 집중하지 못했다고 (혹은 못하게 될 수 있다고) 보신 것 같다.
돌아보면.. 맞는 말이다 ㅠ!! 내가 지금 집중하고 해결해야 하는 부분을 잊지 않는 것
(하고 싶은 것을 위해 하기 싫은 것을 집중해서 빨리 끝내는? 연습이 내게 필요하다)
https://github.com/woowacourse/jwp-was/pull/46#discussion_r328036937

-----------------

step1 피드백(https://github.com/woowacourse/jwp-was/pull/46#issuecomment-534957833)

> 전체에 대한 피드백을 이 공간에 별도로 남깁니다.
>
> 너무 과한 기능을 수행하려고 한 것이 아닌가 걱정이 되네요 :) 현재는 요구사항을 충실히 하며 리팩토링을 기반으로 기능이 완성되어가는 연습을 하는 것이 좋지 않을까요?
>
> 물론 새로운 시도를 하고 더 멋진 기능을 구현하고 싶은 마음은 이해하고 존중합니다! 하지만 기술에 매몰되기 보다는 현재 쌓을 수 있는 좋은 습관을 만들어가도록 더 노력해야할 것으로 보입니다!

------------------

Q. response 와 컨트롤러 부분 관련해서는 설계를 어떻게 해야할지 많이 막막합니다.

A. 앞으로 진행될 과제들에서도 주제에 대한 고민을 많이 하실거에요 :) 그래서 현재는 현재의 요구사항을 수행할 수 있는 가장 단순한 구조를 만들고, HTTP 에 대한 처리를 중점으로 고려를 하셨으면 좋겠어요. 가장 단순한 구조에서 사용자의 편의성은 중요하게 생각될 부분입니다!


### 코드리뷰
page, pageProvider
- 내가 점진적으로 controller 를 삭제한 과정

WebServer
- 역할
    - 특정 포트에 대해서 connection 을 받을 준비를 함
        - tcp 서버는 socket() - bind() - listen() - accept() 과정을 걸쳐서 연결됨
            - bind() 시에 기존 port 가 already in use 가 발생하는 이유는?
                - 그냥 여러 프로그램이 같은 포트를 사용할 수 없어서이려나? (혹은 TIME_WAIT이 남거나?)
        - 이 코드에서는 ServerSocket(port) 가 listen() 상태로 존재
        - 이후 accept() 를 통해서 매 connection 을 얻어냄
    - 하나의 connection 은 (protocol, src addr, src port, dest addr, dest port) 로 구성
        - 이렇게 유일함을 보장
    - 시킬 일(RequestHandler + connection)을 스레드 풀에 등록..!

RequestHandler
- 역할
    - connection 을 통해서 요청을 읽음
    - 읽은 요청에 알맞는 응답을 써주기(보내기)
        - router 를 통해서 특정 요청에 대한 처리 로직(PageProvider)을 알아냄
        - PageProvider 를 통해서 응답에 필요한 결과(contentType + body == Page)를 담은 정보를 얻음
    - 애러 처리
        - 처리 안된 예외 발생시, 애러 페이지로 응답
- DataOutputStreamWrapper
    - 사용이유
        - 테스트도 그렇고.. 특정한 OutputStream 에 의존하지 않도록 하기 위함
        - 사용할 인터페이스만 Wrapper 를 통해 보이도록 처리

HttpRequest
- 역할
    - inputStream 을 통해서 요청을 객체로 표현
        - Method, Path, Parameters, Body....
        - Session
            - 서버랑 클라이언트간에 상태를 유지하기 위한 방법
                - 클라이언트와 최소한의 정보(Session key)를 주고 받음
                - Session key 를 통해서 필요한 상태에 접근 (해당 클라이언트에 관한 상태)
            - 동시적으로 사용될 수 있음 (동일한 키를 가진 요청이 동시적으로 올 경우)
                - invalidate() 가 필요한 이유?
            - 세션도 자원이기에, 특정 시간이 지나면 invalidate 하도록 되어있음
    - HttpRequest 가 요청의 헤더에서 키를 얻어서 그에 맞는 세션을 준비해줌


HttpResponse
- 역할
    - 

SessionManager
- 역할
    - Session 들을 등록하고 삭제하는 역할 (container?)
AbstractSession
- 역할
    - Session 을 만들기 위한 폼
    - invalidate() 를 적용시켜놓음
    - remover 를 통해서 SessionManger 에서 Session 을 삭제 (callback 함수)
        - 먼가 삭제해야한다고 신호를 보낼 수단이 필요했고 현재는 콜백을 사용

### 우테코강의에서 기억에 남는 부분
- Http 웹 서버 구현

- 웹 서버의 역할
    - 특정 포트로 들어오는 연결들에 대한 처리
        - 연결 생성(accept)
        - thread 를 통해 RequestHandler 으로 각 연결 처리
- 현재 WebServer 는 매번 connection 을 생성하고 끊는다
    - keep-alive 
        - 클라이언트(브라우저) 에서 Connection: keep-alive 로 유지되고 있음
    - 원래... 특정 ip 를 사용하는 클라이언트가 서버에 접근하면... 동일한 connection 을 사용하려나?? (GET 을 여러번하더라도?)

- 스레드풀 (https://hamait.tistory.com/937)
    - 동일하고 서로 독립적인 다수의 작업을 할 때 효과적 (서버 어플리케이션의 일들이 이 경우!)
        - 동일하지 않으면 언젠가 금방 끝나는 애들이 오래걸리는 애들로 채워진 풀의 영향을 받음
        - 1.7 의 FORK-JOIN 풀은 분할 수행을 효율적으로..!
    - 내부에 적용하는 큐 사이즈에 따라서 ... 돌아가는 형태가 다르다
        - http://wonwoo.ml/index.php/post/2254/amp

### 존재했던 문제들...
- logback 
    - 로깅 레벨에 따른 다른 처리
        - 특정 경로에 대해서 한개의 레벨만 적용이 가능함
        - 따라서... 여러 appender 를 가지고 있고 각 appender에서 자신이 처리할 레벨을 결정하는 필터를 추가하는 방식으로 해결
[참조: https://stackoverflow.com/questions/10734025/logback-two-appenders-multiple-loggers-different-levelsqq]