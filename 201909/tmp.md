### TODO
- http request , response


### 리팩토링 할 것들
1. HttpResponse 내부 부분 분리 (ex. startline / header )
    - Enum 으로 뽑아놓을 애들
        - status code (ex. 200, 404)
2. 파일 컨트롤러 (TemplatesController, StaticController 역할을 통합)
    - 요청받은 경로가 존재하는 파일일 경우 처리
3. 라우팅 관련 부분 class 로 분리
    - 현재는 RequestHandler 에 포함됨



### 미뤄놓은 똥들..
HttpResponse , HttpRequest 테스트 메소드 명 변경
Post에 body 가 없는 경우 어떻게 처리되는게 맞을지?