### @Bean 에 대해서 정리해보자..(https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/context/annotation/Bean.html)


#### Overview
``` java
    @Bean
     public MyBean myBean() {
         // instantiate and configure MyBean obj
         return obj;
     }
```

#### Beans Names
- 디폴트 name 은 `@Bean` 선언시에 사용된 메소드이름
``` java
     @Bean({"b1", "b2"}) // bean available as 'b1' and 'b2', but not 'myBean'
     public MyBean myBean() {
         // instantiate and configure MyBean obj
         return obj;
     }
```

