Optional (in Java) 
## 1줄 요약
존재할 수도 있고 아닐 수도 있어요!

## 3줄 요약
'있거나 없음'을 명시적으로 표현
있을 경우 '변환' 을 통해 비지니스 로직에 집중할 수 있음
명시적으로 표현되어서 '없는 경우'에 대한 예외처리가 강제됨

## 자세히

### 왜 이 개념이 존재하는 것일까? (무엇을 해결하기 위한 걸까?)
null 이라는 존재가 있었다. 문제가 많다.
- 애러의 근원
- 코드를 어지럽힌다 (null 확인 코드 -> 가독성에 영향)
- 널 자체가 아무 의미가 없음
- 자바 철학에 위배 (숨기지 못한 포인터)
- 형식시스템에 구멍을 만듬 (null 이 생성된 곳에서 다른 부분으로 퍼졌을때 어떤 의미로 사용된건지 알 수 없음)

> 이런 문제들을 해결하기 위한 방안이 필요했고 자바는 Optional 이란 개념을 java8 에 도입했다.

크게 두가지 역할을 감당한다고 생각한다.
1. 있거나 없음을 명시적으로 표현
    - Optional 이 존재하는 곳에서는 없을 경우의 처리를 해줘야 함
        - Checked exception 의 역할
            - Optional 을 잘 쓰면 try, catch 보다 더 간결하게 구현가능
2. '변환'을 할 수 있는 메서드를 제공 (map, filter 등)
``` java
class Car {
    String name;
}

// 차도 많고.. 부자구나....
Map<Integer, Car> myCars; // 아직 초기화가 안 되어 있음

// 일단 리턴값도... null 이 될 수 있음
String getCarNameWithoutOptional(int carId) {
    if (Objects.isNull(myCars)) {
        return null;
    }
    Car myCar = myCars.get(carId);
    if (Objects.isNull(myCar)) {
        return null;
    }
    return myCar.getName();
}

Optional<String> getCarNameWithOptional(int carId) {
    return Optional.ofNullable(myCars)
        .map(myCars -> myCars.get(carId))
        .map(car -> car.getName);
}

// 또한 위 함수들을 사용하는 곳에서 생각해보자
1. null 이 리턴되는 경우
    - null 처리 코드가 추가됨 (위의 예처럼, 특정한 결과를 얻기위해서 여러번 '변환' 이 필요한 경우 코드가 더러워 질 가능성(실제 로직과 달라질)이 높음)
    - 혹은 까먹고 로직을 구현 (이 경우, 해당 id 로 이름을 찾지 못하면 NullPointException 이 발생)
2. 특정한 exception 이 던져지는 경우
    - try, catch 가 필요 (특히.. 프로그램에서 처리할 수 있는 경우, 위의 예시라면 해당 id 로 자동차 이름을 얻지 못했을 경우 처리를 계속 하려면)
3. Optional
    - checked exception 의 try, catch 같은 느낌. Optional 을 리턴 받은 곳에서 처리를 해주어야함. (get() 으로 무시하듯 짜더라도. 어쨌듯 '없을 가능성'을 인지하고 구현하는게 강제됨)
    - '변환' 이 쉬움. ('없을 가능성' 을 배제하고 변환을 해나갈 수 있음)
```

### 나는 어떤 경우에 이 개념을 적용했을까?
- 리턴 되는 값이 null 일 수도 있음을 알려주고 싶었을때
    - '미래의 나' 또는 이 코드를 볼 다른 사람이 null 이 될 수 있는 값임을 놓치지 않았으면 할 경우


### 어떤 장, 단점이 존재할까? (내가 느낀)
- 좋았던 부분
    - 명시적으로 알려주기에 스스로도 널을 처리하는 부분을 빼먹기가 어렵다 (나중에 NullPointException 을 만날일이 적었다.)
    - 존재하는 경우에, 변환을 통해서 특정 값을 얻어내야는 부분 로직이 깔끔해졌다. (위의 자동차 예시?)
- 불편했던 부분
    - java8 에서는 아직 지원하지 않는 로직이 있음
        - 특히 해당 값이 없는 경우, 변환이 어렵다.. (현재는 존재하는 값에 대해서 변환이 적용되기에)
        
```java 
// 개인적으로는 어떻게 깔끔하게 할 수 있을지 모르겠다.
// '변환' 을 하고 싶은데... '없는 경우'에 대한 처리는.. java8 Optional 로는 어려운 것 같다.
public Optional<Session> getSession(String id, boolean canBeCreated) {
    if (sessions.containsKey(id)) {
        return Optional.of(sessions.get(id));
    }

    return Optional.ofNullable(canBeCreated ? create() : null);
}

``` 

### 사용시 신경써야 할 부분
- isPresent(), get() 을 쓰지말자...
    - 대체할 방법이 존재 (https://dzone.com/articles/optional-ispresent-is-bad-for-you)

참고
- java8 in action
- 자바 Optional 바르게 쓰기 (https://homoefficio.github.io/2019/10/03/Java-Optional-바르게-쓰기/)
- was 피드백 (https://github.com/woowacourse/jwp-was/pull/89)
