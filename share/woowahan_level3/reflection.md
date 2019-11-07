## 리플렉션이란

런타임에 특정 클래스의 정보를 알아낼 수 있다?


### 확인해본 가능한 것들
https://github.com/woowacourse/jwp-mvc/blob/25c9521f9552a8fc60c2460c0141f3c8c40575cf/study/src/test/java/reflection/ReflectionTest.java#L1

#### helper
    - 왜 사용했을까?
        - Field 자체가.. reflection 패키지 안에서만 사용가능하도록 되어있음 (퍼블릭 생성자가 없음)
            - 내가 기대하는 Field 를 만들 방법이 존재하지 않음
    - ExpectedField (https://github.com/woowacourse/jwp-mvc/blob/25c9521f9552a8fc60c2460c0141f3c8c40575cf/study/src/test/java/reflection/helper/ExpectedField.java#L1)
        - 빌더를 통한 생성
            - 생성시 많은 정보가 필요했음 (name, modifiers, 리턴 타입, 해당 필드를 선언한 클래스...)


1. getName

```java
assertThat(int.class.getName()).isEqualTo("int");

// inner 클래스인 경우
assertThat(Hello.class.getName()).isEqualTo("reflection.ReflectionTest$Hello");
// 배열인 경우
assertThat(Hello[].class.getName()).isEqualTo("[Lreflection.ReflectionTest$Hello;");
```

2. getModifiers

```java 
private static final class PrivateStaticFinalClass {
}

int privateStaticFinalClassModifiers = PrivateStaticFinalClass.class.getModifiers();
assertThat(Modifier.isPrivate(privateStaticFinalClassModifiers)).isTrue();
assertThat(Modifier.isStatic(privateStaticFinalClassModifiers)).isTrue();
assertThat(Modifier.isFinal(privateStaticFinalClassModifiers)).isTrue();
```

3. getFields
> 부모들의 접근 가능한 필드도 가져온다

```java
public class Question {
    public static final String HELLO = "hello";

    private static final String name = "abc";

    private final long questionId;

    private String writer;

    private String title;

    private String contents;

    private Date createdDate;

    private int countOfComment;

    public int test1;

    int test2;
}

Class<Question> clazz = Question.class;

Map<String, ExpectedField> expectedFields = new HashMap<>() {{
    put("HELLO", ExpectedField.builder()
            .declaringClass(Question.class)
            .type(String.class)
            .modifiers(Modifier.PUBLIC | Modifier.STATIC | Modifier.FINAL)
            .name("HELLO")
            .build());

    put("test1", ExpectedField.builder()
            .declaringClass(Question.class)
            .type(int.class)
            .modifiers(Modifier.PUBLIC)
            .name("test1")
            .build());
}};

// 접근가능한 (public) 필드를 모두 가져옴
// 부모클래스나 부모인터페이스의 있는 필드도 포함
Field[] fields = clazz.getFields();
assertThat(fields.length).isEqualTo(expectedFields.size());
for (Field field : fields) {
    log.debug("field name: {}", field.getName());
    ExpectedField expectedField = expectedFields.get(field.getName());

    expectedField.assertField(field);
}
```

4. Constructor

```java
public class Question {
   // ... 필드 생략
    private Question(String writer) {
        this.writer = writer;
        this.questionId = -1;
    }

    public Question(String writer, String title, String contents) {
        this(0, writer, title, contents, new Date(), 0);
    }

    public Question(long questionId, String writer, String title, String contents, Date createdDate,
                    int countOfComment) {
        this.questionId = questionId;
        this.writer = writer;
        this.title = title;
        this.contents = contents;
        this.createdDate = createdDate;
        this.countOfComment = countOfComment;
    }

    // .... 나머지 
}

List<ExpectedConstructor> expectedConstructors = Arrays.asList(
        ExpectedConstructor.builder()
                .modifiers(Modifier.PUBLIC)
                .parameterTypes(new Class<?>[]{String.class, String.class, String.class})
                .build(),
        ExpectedConstructor.builder()
                .modifiers(Modifier.PUBLIC)
                .parameterTypes(new Class<?>[]{long.class, String.class, String.class, String.class, Date.class, int.class})
                .build(),
        ExpectedConstructor.builder()
                .modifiers(Modifier.PRIVATE)
                .parameterTypes(new Class<?>[]{String.class})
                .build()
);
```

5. Method

> Method 가 declaringClass 를 담고 있음..! (Method.clazz)

```java
public class Simple {
    public String publicString;
    private int privateInt;

    public String toString(){
        return "hello";
    }

    public String withArg(int arg) {
        return "withArg";
    }

    public String withExceptions() throws NullPointerException, IllegalAccessException {
        return "widhExceptions";
    }
}

Map<String, ExpectedMethod> expectedMethods = new HashMap<>() {{
   put("toString", ExpectedMethod.builder()
           .declaringClass(Simple.class)
           .name("toString")
           .modifiers(Modifier.PUBLIC)
           .returnType(String.class)
           .build());
   put("withArg", ExpectedMethod.builder()
           .declaringClass(Simple.class)
           .name("withArg")
           .modifiers(Modifier.PUBLIC)
           .parameterTypes(new Class<?>[]{int.class})
           .returnType(String.class)
           .build());
   put("withExceptions", ExpectedMethod.builder()
           .declaringClass(Simple.class)
           .name("withExceptions")
           .modifiers(Modifier.PUBLIC)
           .exceptionTypes(new Class<?>[]{NullPointerException.class, IllegalAccessException.class})
           .returnType(String.class)
           .build());
}};
```