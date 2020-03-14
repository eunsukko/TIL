## 팀프로젝트때 무엇을 하셨나요?

## 본인이 맡았던 기능은 어떤 것들이 있나요?

### 친구 추천

- 왜 이 부분을 시도했는지?
    - 페이크북(페이스북 같은)은 친구의 관계아래 있어야 제 기능이 동작한다고 생각
    - 어떻게 하면 빠르게 친구의 관계를 늘려갈 수 있을까?
        - 추천..!
        - 우리끼리 하는 것이지만 쉽게 친구추가가 된다면?


### 테스트 관련 부분 (utils)

### 유저, 로그인

## 팀프로젝트에서 아쉬웠던 점들은 무엇인가요?



## 코드리뷰

### 1주차
패키지구조
fakebook
    - controller    
    - domain
    - service
        - ArticlesService
        - CommentService
        - LoginService
        - UserService

---------

XXXAssembler 사용

WebMvcConfigurer 구현체
- addInterceptors()
- addArgumentResolvers()

ArgumentResolver 사용
    - `@Component` 로 등록
    - `WebMvcConfig implements WebMvcConfigurer` 를 통해서 등록
        - addArgumentResolvers() 사용
``` java
SessionUserArgumentResolver implements HandlerMethodArgumentResolver;

@GetMapping("/{id}/like")
    public ResponseEntity<ArticleLikeResponse> checkLike(@PathVariable Long id, @SessionUser UserOutline userOutline) {}
```

Service 는 dto 를 통해서 입력 + 결과 반환
``` java
    public UserResponse save(UserSignupRequest userSignupRequest) {
        log.debug("begin");

        User user = userAssembler.toEntity(userSignupRequest);
        User savedUser = userRepository.save(user);
        log.debug("savedUser: {}", savedUser);

        return userAssembler.toResponse(savedUser);
    }
```

테스트 구현
- 서비스 
    - @InjectMocks 사용 (@ExtendWith)
        - 서비스의 로직만 테스트하기 위함
        - 내부 구현을 알게 되는 것 같기도...
    - 통합테스트
        - data.sql 에 필요한 데이터가 저장되어 있음
- 컨트롤러
    - rest-assured 사용 (api 테스트)
        - json 결과에 대한 검증
        - 상태코드
        - port 를 통해서 (ControllerTestHelper 를 상속받기에) Helper 와 동일한 port 에 대해서 테스트 가능
            - signup 등을 사용가능 (데이터 생성은 webTestClient 에 맡기기)
    - webTestClient
        - 편한 사용을 위한 Helper 구현
            - signup
            - login
            - getCookie
```
저희 팀에서… 테스트 코드 관련해서 논쟁?이 있었습니다..
한가지 방식으로는 .sql 로 테스트에서 사용할 데이터를 추가해놓는 방식이고
다른 방식으로는 매번 테스트에서 생성(결과적으로 코드를 통해서 테스트 데이터를 생성) 하는 방식입니다.
(현재.. 게시글, 댓글 관련해서는 첫번째 방식, 유저 관련 경우 두번째 방식으로 구현해놓았습니다.)
2가지 방식중에 화투님께서는 어떻게 생각하시는지
평상시에는 어떻게 생각하시는지가 궁금합니다.
저희가 이야기한 바로는
.sql 방식을 사용할 때는

- 장점
    - 내가 원하는 상황을 미리 생성해놓을 수 있음 (예를 들어서 특정 댓글이 내가 원하는 게시글과 유저와 연관되어 있을때 -> ex. 해당 유저가 작성한 댓글)
    - 미리 데이터가 생성되어 있음 (한번만 생성, 이용)
- 단점
    - 미리 .sql 에서 생성해놓은 것들을 테스트 작성자가 인지하고 있어야 함 (해당 데이터를 언제쓸지 -> ex. 해당 데이터는 삭제 테스트용 데이터, 다른 읽기등이 사용하면 안됨)
    - .sql 에서 사용된 값을 테스트 코드에 복사/붙여넣기로 사용해야함 (.sql 데이터가 변경될 경우 -> ex. 비밀번호 정책 변경)
    매번 테스트에서 생성할 때는
- 장점
    - 다른 테스트와 독립되어 있음 (자신이 사용할 데이터를 생성)
    - 생성된 데이터를 코드로 접근 가능 (테스트 값이 변경되어도 코드에서 변경할 게 없음)
- 단점
    - 매번 생성하는 비용
    - 특정한 조건을 만들기 위해서 해주어야 할게 많음 (코드를 예쁘게 정리하면 될 것도 같지만… 그게 쉽진 않을 것도 같네요 -> ex. 해당 유저가 작성한 댓글이 존재하는 상황을 만들때)
    각자가 장/단점이 존재하고
    프로젝트 규모나 함께하는 사람들이 많을 때에 따라서도 중요한 부분이 달라질 것도 같네요…
    혹시 어떤 상황(팀의 규모, 프로젝트 규모)에 어떤 부분들을 중요하게 생각하시는지 화투님의 생각을 알고 싶습니다..ㅎ
화투(박현식) 5:43 PM
    안녕하세요. 미스터코.
    나중에 답변을 드린다고 해놓고 깜빡하고 연락을 못드렸네요. :disappointed:
    두가지 방식 중 하나의 택일 보다는 둘 다 사용하신다고 보시면 될 것 같아요.
    DB에 저장되는 데이터가 항상 테스트를 위한 데이터만 있는 것이 아니라
    도메인 전반에 걸쳐서 필수적으로 사용되는 메타데이터 성격의 데이터가 있을 수 있는데
    이러한 데이터는 sql로의 초기화가 적합합니다.
    (제가 핀테크에서 일하다보니 여기로 예를 들어드리면 각 카드사, 은행등에 대한 메타 정보, 은행 영업일, 카드사 매입일 등등)
    이러한 데이터는 테스트마다 일일히 추가하기 어렵기 때문에 sql등으로 초기화합니다.
    그 외에 발생하는 테스트 케이스에 대해서는 각 테스트별로 독립 시키는게 적합하다고 봐요. :slightly_smiling_face:
```

### 2주차

Entity 연관관계
- 주인
    - 관계있는 둘 중에서 왜래키를 가지는 녀석
    - 주인만 왜래키를 관리(등록, 수정, 삭제) 할 수 있음
    - ex. User, Article

FriendShip
- 친구간의 관계를 표현
- 앞선 id < 이후 id (db 에 한 정보만 저장이 되도록
- id 를 통한 비교 (`@Entity` 가 달린 경우 특히... )
- user 가 삭제되면 같이 삭제됨
    - `@OnDelete(action = OnDeleteAction.CASCADE)`
- `@ManyToOne`
- `@JoinColumn(name = "user_id")`
- User precedentUser, User user
    - 엇.. 어떻게 동작하는지 한 번 hibernate 명령을 보고싶다.
        - FriendShip select
        - User select * 2 (precedentUser, user 각각 한번씩)
    ```
    Hibernate: select friendship0_.id as id1_5_, friendship0_.precedent_user_id as preceden2_5_, friendship0_.user_id as user_id3_5_ from friendship friendship0_ left outer join user user1_ on friendship0_.precedent_user_id=user1_.id left outer join user user2_ on friendship0_.user_id=user2_.id where user1_.id=? and user2_.id=?
Hibernate: select user0_.id as id1_6_0_, user0_.created_date as created_2_6_0_, user0_.modified_date as modified3_6_0_, user0_.birth as birth4_6_0_, user0_.cover_url as cover_ur5_6_0_, user0_.email as email6_6_0_, user0_.encrypted_password as encrypte7_6_0_, user0_.gender as gender8_6_0_, user0_.introduction as introduc9_6_0_, user0_.name as name10_6_0_ from user user0_ where user0_.id=?
Hibernate: select user0_.id as id1_6_0_, user0_.created_date as created_2_6_0_, user0_.modified_date as modified3_6_0_, user0_.birth as birth4_6_0_, user0_.cover_url as cover_ur5_6_0_, user0_.email as email6_6_0_, user0_.encrypted_password as encrypte7_6_0_, user0_.gender as gender8_6_0_, user0_.introduction as introduc9_6_0_, user0_.name as name10_6_0_ from user user0_ where user0_.id=?
09:04:49.047 [INFO ] [Thread-4] [o.s.s.c.ThreadPoolTaskExecutor] [shutdown] - Shutting down ExecutorService 'applicationTaskExecutor'
    ```

- 왜 단방향을 사용했을까? (프로젝트 전반에 있어서도)
- 그냥 `@OneToMany` 사용시 주의할 점 (https://homoefficio.github.io/2019/04/28/JPA-%EC%9D%BC%EB%8C%80%EB%8B%A4-%EB%8B%A8%EB%B0%A9%ED%96%A5-%EB%A7%A4%ED%95%91-%EC%9E%98%EB%AA%BB-%EC%82%AC%EC%9A%A9%ED%95%98%EB%A9%B4-%EB%B2%8C%EC%96%B4%EC%A7%80%EB%8A%94-%EC%9D%BC/)
    - `@JoinColumn` 을 통해서 어떤 애를 가지고 조인을 해야할 지 정보를 해당 엔터티에 제공
- `@ManyToMany` 안 쓴 이유?
    - User 와 따로 관리하고 싶어서
    - 불변식 같은 조건이 있어서

- 양방향 (https://gmlwjd9405.github.io/2019/08/14/bidirectional-association.html)
    - 연관관계의 주인 (1:N 일 경우라 생각해보자)
        - N 인 애들이 주인 (외래키를 가진 애들)
    - 주인인 쪽은...
        - 해당 필드가 채워짐
    - 외래키(두 테이블을 연결짓는)를 관리한다는 것은...
        - 둘 사이의 관계를 끊는것?
        - 그렇게 치면.. 외래키를 가지고 있는쪽이 관리하는게 맞는듯하다

- 엔터티의 id (PK)
    - equals, hashcode 를 id 를 통해서 적용
    - 영속성컨텍스트에 일단 들어가도록 보장 해줘야함


- 설계 관련된 리뷰
    - 서비스가 커질 경우 (https://github.com/woowacourse/miniprojects-2019/pull/15#discussion_r316300046)


- 의존이 많아지는 서비스를 어떻게 분리하면 좋을까?


### 3주차

> Fakebook도 많은 기능이 추가되면서 Legacy의 길을 가고 있네요. 👍
지극히 정상이고, 서비스가 잘 되고 있다는 뜻이기도 하니깐 큰 걱정은 하지 마세요.
크게 두 가지를 조심하면 되겠어요.
>
> 1. 컴포넌트를 생성하기 위해 필요한 컴포넌트의 수가 많아진다면 새로운 컴포넌트를 만들 때가 온 것이다.
> 2. 메서드는 한 가지 일만 해야 한다.


- 친구추천 관련 리뷰
    - 친구 추천에 필요한 정보들이 많아질 경우 어떻게 해야할지 (https://github.com/woowacourse/miniprojects-2019/pull/29#discussion_r319721338)
    - 현재 방문자 수를 처리하는 로직이 휘발성임 (https://github.com/woowacourse/miniprojects-2019/pull/29#discussion_r319721455)
        - 레디스? 여러 머신에서 해당 애플리케이션이 동작해도 방문자 수를 잘 처리하도록
    -
- 구현 로직에 대한 이해
    - 왜 이런 전략을 세웠는지?
    - 정보의 수가 더 커질 경우 어떻게 대처할건지?


### 친구추천

#### 배경
Fakebook 은 친구 기반으로 정보공유를 하기 위한 앱!
- 그런데 친구 추가하기가 넘나 힘들다..
    - 그나마 쿠기가 추가해준 친구 자동 검색이 있어서지...

목적
- 친구추천: 친구였으면 하는 사람 위주로 알려주자
    - 그래야 사용자가 원하는 정보들로 타임라인 등이 구성될테니
    - 일단 친구가 되어야 관련된 행위들을 할 수 있으니 (글쓰기, 댓글, 메신저, 알림 등)

친구를 그러면 어떤 기준으로 추천해줄까요?
- 함께아는 친구 (Facebook 에 영향을 많이 받았다 ㅠㅎ, 싸이월드 촌수도)
- 내 페이지를 방문한 기록 (관심있는 이성친구 페이지에 내가 뜰 수도 있는 이유)

---------

함께아는 친구 구하기
    // A, B 는 서로 친구가 아님
    A와 B 가 존재한다고 하면 'A_친구들 교집합 B_친구들' 가 함께아는 친구!

    O(A_친구들 + B_친구들) 정도의 비용으로 구할 수 있다..!

---------

> (A, B) 가 주어졌을 때 함께하는 친구를 구할 수 있는데... (A, B) 쌍은 어떻게 구하나요??

    Facebook_전체사용자 == N 이라고 하면  
    가능한 (A, B) 쌍의 수 == O(N ^ 2) 이다... ㄷ   

    각 쌍에 대해서 함께하는 친구 정보들을 구하면.. O(N ^ 2) * O(A_친구들 + B_친구들)  

    Facebook_전체사용자 가 1000명만 되도... 쥬륵..   

-----------

> 꼭 모든 사용자에 대해서 (A, B) 쌍을 확인해야 할까요?

    다행히 우리는 함께아는 친구가 1명이라도 있는 관계에 대해서만 알고싶다..!

    (A, B) 가 C 를 함께 알고 있다고 하자  
    그러면 A - C - B 로 표현할 수 있다!  

    함께아는 친구가 1명이라도 있음 == 친구의 친구인 관계  

    즉 A 를 고정한다고 하면..  
    B는 'A의 친구의 친구' 인 애들까지만 확인해주면 된다..!  

    가능한 (A, B) 쌍의 수 == O(N_친구들의수 ^ 2) 이다

    모든 사람들이 'N_친구수' 정도의 친구를 가진다면
    O(N_친구수 ^ 2) * O(A_친구수 + B_친구수) == O(N_친구수 ^ 3)

-----------

> 친구의 친구를 구할 때.. 유용한 정보를 저장해놓으면 좀 더 최적화 할 수 있지 않을까?

    친구 == directFriend  
    친구의 친구 == indirectFriend 라고 하자  

    그러면 특정한 '친구의 친구'를 구하는 과정은  
```
for(나의 친구들) {
    친구A
    for(친구A의 친구들) {

    }
}
```


    그런데 함께아는 친구의 개념을 생각해보자  
    한 번 그려보면 아래와 같은 그림이 그려진다  
```
나 - 친구1 - 친구의 친구  
  \ 친구2 /  
```

    즉.. '친구의 친구'를 구할 때.. 그 도중에 있던 친구1,2 ... 들을 저장해놓으면 '함께 아는 친구'인 것이다..!  

    이 경우 O(N_친구수 ^ 2) 의 복잡도가 될 수 있다. (도중의 친구 정도를 해시맵을 통해서 저장한다고 하면) 

