## 무엇을 정리해 갈까요??
- 궁금한 주제들을 조금씩 구체화 시켜본다
- 나름대로 도전해본 것을 정리해본다
- 정리했던 것에 대한 팩트도 찾아본다

### WAS 

#### HTTP
- Content-Type 결정 과정 [이제부터 타입으로 명시합니다]
    - 내가 보낸 요청에 대한 응답의 타입이 어떻게 결정되는지
        - 클라이언트에서 Accept 셋팅
            - 클라이언트가 원하는 타입들 (우선순위 설정 가능)
            - charSet 포함 가능 (브라우저 마다 우선순위가 다른 것 같다. Accept-CharSet vs Accept)
        - 서버에서 타입 결정
            - 요청받은 자원에 대해서 어떤 타입들을 지원할 수 있는지 (서버에서는 어떻게 이 정보를 다뤄야할까?)
- 파일 전송의 경우 어떤식으로 처리할 수 있을지
    - 파일 업로드 / 다운로드 헤더를 파악해보자
- Content negotiation
    - ex. https://docs.microsoft.com/azure/architecture/patterns/event-sourcing 으로 요청
        - https://docs.microsoft.com/ko-kr/azure/architecture/patterns/event-sourcing 로 이동됨  (301 Moved Permanently)
        - 이런 과정을 어떻게 모니터링 하면 좋을까? (브라우저에서 일일이 보기보단)
            - postman 에서 Accept 를 변경해보니 적용이 된다 (영어의 우선순위를 높이니 영문 페이지로 전달해줌)
                - 그런데 아직은 postman 에서는 그 과정을 보는 방법을 모르겠음(마지막 결과는 확인 가능)
- Content-Encoding
    - 클라이언트
        - Accept-Encoding 설정
    - 서버
        - 실제로 구현해보고 압축정도 파악하기
- cache 

### 테스트
- 행위를 테스트하기



### 이벤트 소싱
- CQRS 를 파악하기 좋은 개념?
- read 와 write 를 분리하는 개념을 구현해보고 싶다. (어떤 것을 정리하는 게 좋을지는 한 번 짜봐야 겠다..)
- 먼가 데이터 주도 개발 책에서 본 transaction 에서 스냅샷 개념이랑도 연관지어서 정리해도 재미있을 듯
