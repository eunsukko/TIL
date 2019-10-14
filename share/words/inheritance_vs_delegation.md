## 상속보다 위임을 하라고 하는데.. 좋은 예가 떠오르지 않던 중에... 책에서 발견했다..!

- 그러나... 아직은 내 언어로 정리가 안되네... ㅠㅠ

### 코드가 돌고 있는 중에 filter() 기능 부분을 바꿔주고 싶다면??


![Alt text](pictures/inheritance_vs_delegation_1.png?raw=true "Title")

![Alt text](pictures/inheritance_vs_delegation_2.png?raw=true "Title")

- 질문들
    - 상속을 할 경우 어떻게 변경해줄 수 있을까?


### 여러 기능들이 다양하게 변할 경우

![Alt text](pictures/inheritance_vs_delegation_3.png?raw=true "Title")

![Alt text](pictures/inheritance_vs_delegation_4.png?raw=true "Title")

- 질문들
    - 상속은 왜 이렇게 복잡한 구조가 될까?
        - 각각의 구현이 (ex. filter(), prepare()) 서로 연결되어 있음
            - 각 조합이 특정한 구현체가 되어버림

### 참조
- Emergent Design (https://play.google.com/store/books/details?id=Q_3i19icWKMC&pcampaignid=books_web_aboutlink)