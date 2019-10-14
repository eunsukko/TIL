
## 1줄 요약


## 3줄 요약


## 자세히

#### 위키 설명
첫글자|약어|개념|상세
--|--|--|--
S|	SRP	| 단일 책임 원칙 (Single responsibility principle) | 한 클래스는 하나의 책임만 가져야 한다.
O|	OCP	| 개방-폐쇄 원칙 (Open/closed principle) | “소프트웨어 요소는 확장에는 열려 있으나 변경에는 닫혀 있어야 한다.”
L|	LSP	| 리스코프 치환 원칙 (Liskov substitution principle) |“프로그램의 객체는 프로그램의 정확성을 깨뜨리지 않으면서 하위 타입의 인스턴스로 바꿀 수 있어야 한다.” 계약에 의한 설계를 참고하라.
I|	ISP	| 인터페이스 분리 원칙 (Interface segregation principle)|“특정 클라이언트를 위한 인터페이스 여러 개가 범용 인터페이스 하나보다 낫다.”
D|	DIP	|의존관계 역전 원칙 (Dependency inversion principle)|프로그래머는 “추상화에 의존해야지, 구체화에 의존하면 안된다.” 의존성 주입은 이 원칙을 따르는 방법 중 하나다.


### 원칙(Principle) 이란?
- 특정 상황에 대한 정답이라기보단
    - 좋은 or 나쁜 코드에 대한 느낌을 좀 더 구체적으로 표현 (그 '느낌' 에 이름을 붙여줬다고 생각하면 될듯)


### SRP (Single Responsibility Principle)
높은 cohesion(응집도) == 변경될 이유가 동일한 애들끼리 잘 모여있는 것

> responsibility == "a reason for change"

- 1개의 책임만 가진다면, 변경할 이유도 1개여야함
    - 여러가지 책임이 있다면?
        - 해당 책임들이 서로 의존함
            - 자기에게 필요없는 것들도 보임 (ex. 모듈)

#### 적용될 경우 좋은점
- 각 패키지, 클래스, 메소드가 변경될 이유가 1가지..!
    - '특정한 이유로 변경할 부분'들이 잘 모여있음 == 그 부분만 고치면 됨 (해당 기능을 구현한 클래스 찾기가 쉬움. 잘 모여있기 때문에)
- 테스트하기 쉬운 코드
    - 메소드로 예를 들면, 그 메소드가 하는 일이 여러가지라면 나올 수 있는 경우의 수가 폭발적으로 증가(복잡한 테스트))

### OCP (Open-Closed Principle)
확장에는 열려있고, 변경에는 닫혀있자
(요구사항이 변경되었을때, 기존의 코드의 수정 없이 새로운 행위가 추가될 수 있어야)

> 어떻게 가능한가요? 답은 추상화..!

존재하는 인터페이스에서는 코드 수정이 있으면 안됨(변경에 닫힘)
새로운 기능을 인터페이스를 구현함으로 만족시키기(확장에 열린)
'The existing interface is closed to modifications and new implementations must, at a minimum, implement that interface.'


### LSP (Liskov Substitution Principle)
S 가 T의 subType 일 경우 (더 구체적인 값), T가 사용된 곳을 S로 대체해도 아무 문제 없어야 함
- 기존에 T 를 생각하고 했던 가정들이 S에 대해서도 아무 문제 없어야 함
    - ex. 직사각형, 정사각형 문제
        - setWidth 는 사실은 2개의 가정이 있음 (모서리에 인접한 두 변을 a, b라 하자. a 가 width 인 경우)
            - a 를 바꿈
            - b 는 바뀌면 안됨
- 그렇기 때문에 S로 형변환하거나 instanceof S 등으로 S 에 대해 특별한 처리를 하면 좋지 않다고 하는 것
    - S 에 대한 특별한 처리가 필요하다는 것이 T를 완전히 대체하지 못한다는 것이기에

### ISP (Interface Segregation Principle)
사용자 입장에서 사용하지 않는 메서드가 있을때 (해당 인터페이스를 쪼개야 할지도 모른다는 향기)
- 해당 인터페이스가 쓸데없이 너무 다양한 역할의 메소드를 가지고 있다는 냄새일지도

> 'the interfaces of the class can be broken up into groups of member functions.'


### DIP (Dependency Inversion Principle)
결국 사용하는 애든, 사용당하는 애든, 추상화(interface)를 의존하고 있어야 함 (사진보면 이해가 그나마 쉬워요..!)
- (https://en.wikipedia.org/wiki/Dependency_inversion_principle)


> 'Nevertheless, the "inversion" concept does not mean that lower-level layers depend on higher-level layers. Both layers should depend on abstractions that draw the behavior needed by higher-level layers.'

#### 참고
- https://sites.google.com/site/unclebobconsultingllc/getting-a-solid-start