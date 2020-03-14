### spring boot 의 문서를 살펴보자

각각이 왜 이런 전략을 취했는지 나의 생각을 적어보기

#### bootstrap


#### BeanFactory (https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/beans/factory/BeanFactory.html)
- getBean 을 살펴보면 크게 두종류의 입력을 받는다 (key 로 사용되는게 두종류)
    - type (Class<T>)
    - name 

```
<T> T	getBean(Class<T> requiredType)
Return the bean instance that uniquely matches the given object type, if any.

<T> T	getBean(Class<T> requiredType, Object... args)
Return an instance, which may be shared or independent, of the specified bean.

Object	getBean(String name)
Return an instance, which may be shared or independent, of the specified bean.

<T> T	getBean(String name, Class<T> requiredType)
Return an instance, which may be shared or independent, of the specified bean.

Object	getBean(String name, Object... args)
Return an instance, which may be shared or independent, of the specified bean.
```

- 전반적인 과정
    - 일단 두 종류의 타입이 생성됨
        -  an independent instance of a contained object (the Prototype design pattern)
        - 싱글톤 같이 특정 scope (해당 beanFactory 가 보이는) 에서 적용됨

> Normally a BeanFactory will load bean definitions stored in a configuration source (such as an XML document), and use the org.springframework.beans package to configure the beans. However, an implementation could simply return Java objects it creates as necessary directly in Java code. There are no constraints on how the definitions could be stored: LDAP, RDBMS, XML, properties file, etc. Implementations are encouraged to support references amongst beans (Dependency Injection).


#### bean definition (https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/beans/factory/config/BeanDefinition.html)



#### 스프링 확장 포인트

#### 스프링 관련 문서
- https://blog.outsider.ne.kr/753?category=2
- https://blog.outsider.ne.kr/tag/%EC%8A%A4%ED%94%84%EB%A7%81%20%ED%94%84%EB%A0%88%EC%9E%84%EC%9B%8C%ED%81%AC