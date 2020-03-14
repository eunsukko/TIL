### Apache MPM (multi-processing module) 


### 특징
- 아파치 웹서버
    - '아파치 웹서버는 다양한 환경의 다양한 플래폼에서 동작할 수 있도록 강력하고 유연하게 설계되었다. 다른 플래폼과 다른 환경은 보통 다른 기능을 요구하며, 어떤 기능을 가장 효율적으로 구현하는 방법이 다를 수 있다. 아파치는 모듈화된 설계로 이런 다양한 환경에 항상 적응해왔다. 그래서 웹마스터는 컴파일시 혹은 실행시 어떤 모듈을 읽어들일지 선택하여 서버에 포함할 기능을 결정할 수 있다.' <sup id="a1">[1](#f1)</sup>
- MPM
    - 'Multi-Processing Modules (MPMs) which are responsible for binding to network ports on the machine, accepting requests, and dispatching children to handle the requests.' <sup id="a1">[1](#f1)</sup>
    - preforke <sup id="a2">[2](#f2), worker <sup id="a3">[3](#f3), event <sup id="a4">[4](#f4) 등이 존재
        - 각각의 특징을 정리해주기
        - 어떤 방식인지도 한 번 전체적으로 정리가 필요
            - 프로세스를 사용할 때 장, 단점
            - 스레드를 사용할 때 장, 단점
            - event-drivent 의 특징, 장 단점
- 그렇다면 왜 모듈화를 하고 있는걸까?
    - 아파치는 여러 다양한 운영체제를 더 깔끔하고 효율적으로 지원할 수 있다. 이 장점은 특화된 MPM을 구현한 다른 운영체제에도 적용된다. (mpm_winnt가 Apache 1.3에서 사용한 POSIX층 대신 자체 네트웍 기능을 사용할 수 있는 등)
    - 각각 필요에 적합한 모듈을 적용 (서버는 특정 사이트의 요구조건에 더 특화될 수 있다. 예를 들어 높은 확장가능성(scalability)이 필요한 사이트는 worker와 같은 쓰레드 MPM을 사용하고, 안정성과 오래된 소프트웨어와의 호환성이 필요한 사이트는 preforking MPM 을 사용할 수 있다. 추가로 다른 사용자아이디로 여러 호스트를 서비스하는 것(perchild)과 같은 특별한 기능도 제공된다.) <sup id="a1">[1](#f1)</sup>

- 내 방식대로 파악??
    - 되게 다양한 환경에... 나에게 맞는 형태로 적용하기 쉬운듯
        - nginx 가 그 중에서 6개 정도만 지원한다고 (그래도 대부분의 경우 필요로하는 기능) 하는 것을 보면... 좀 더 범용적이고, 각 환경에 있어서 바꿔낄 수 있는 구조인 듯 하다


### Apache HTTP Server

https://namu.wiki/w/%EC%95%84%ED%8C%8C%EC%B9%98%20HTTP%20%EC%84%9C%EB%B2%84

### 웹서버와 WAS 의 구성?? 
어떤 식이 가능한지? 개념파악하기 좋았음 (데몬으로 동작하기에 .. 서버라고 지칭하는지도? 이렇게 분리되게 해야지... 각자가 서로의 자원의 영향을 덜? 받을 것 같구먼)
- https://opentutorials.org/course/3647/25083


![Alt text](pictures/?raw=true "Title")



### 참조
> <b id="f1"><sup>1</sup></b> https://httpd.apache.org/docs/2.4/ko/mpm.html [↩](#a1)<br>
> <b id="f2"><sup>2</sup></b> https://httpd.apache.org/docs/2.4/en/mod/prefork.html [↩](#a1)<br>
> <b id="f3"><sup>3</sup></b> https://httpd.apache.org/docs/2.4/en/mod/worker.html [↩](#a1)<br>
> <b id="f4"><sup>4</sup></b> https://httpd.apache.org/docs/2.4/en/mod/event.html [↩](#a1)<br>
> <b id="f5"><sup>5</sup></b> https://namu.wiki/w/%EC%95%84%ED%8C%8C%EC%B9%98%20HTTP%20%EC%84%9C%EB%B2%84 [↩](#a1)<br>