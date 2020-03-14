### 노드란? 

믿고 보는 velopert - <sup id="a1">[1](#f1)</sup>
https://velopert.com/133

> Node는 웹서버가 아니랍니다. Node 자체로는 아무것도 하지 않습니다 – 아파치 웹서버처럼 HTML 파일 경로를 지정해주고 서버를 열고 그런 설정이 없습니다. 단, HTTP 서버를 직접 작성해야합니다 (일부 라이브러리의 도움을 받으면서). Node.js 는 그저 코드를 실행할 수 있는 하나의 방법에 불과한 그저 JavasScript 런타임일 뿐입니다.

-----



node.js 를 사용하는 회사


### 이벤트 루프란?
대략적인 설명 (https://velopert.com/267)
- 아미 EventEmitter 를 통해서 명시적으로 생성할 수 있는듯 
    - 아마 non-blocking 코드들이 이런식으로 구현되어 있겠지?

- https://nodejs.org/en/docs/guides/event-loop-timers-and-nexttick/
- https://nodejs.org/ru/docs/guides/dont-block-the-event-loop/

> The event loop is what allows Node.js to perform non-blocking I/O operations — despite the fact that JavaScript is single-threaded — by offloading operations to the system kernel whenever possible.

> Since most modern kernels are multi-threaded, they can handle multiple operations executing in the background. When one of these operations completes, the kernel tells Node.js so that the appropriate callback may be added to the poll queue to eventually be executed. We'll explain this in further detail later in this topic.


- 확실하게 이해해야할듯.... (https://meetup.toast.com/posts/89)
> 자바스크립트가 '단일 스레드' 기반의 언어라는 말은 '자바스크립트 엔진이 단일 호출 스택을 사용한다'는 관점에서만 사실이다. 실제 자바스크립트가 구동되는 환경(브라우저, Node.js등)에서는 주로 여러 개의 스레드가 사용되며, 이러한 구동 환경이 단일 호출 스택을 사용하는 자바 스크립트 엔진과 상호 연동하기 위해 사용하는 장치가 바로 '이벤트 루프'인 것이다.

> 이벤트 루프에 대해 좀더 알아보기 전에, 먼저 자바스크립트 언어의 특징을 하나 살펴보자. 자바스크립트의 함수가 실행되는 방식을 보통 "Run to Completion" 이라고 말한다. 이는 하나의 함수가 실행되면 이 함수의 실행이 끝날 때까지는 다른 어떤 작업도 중간에 끼어들지 못한다는 의미이다. 앞서 말했듯이 자바스크립트 엔진은 하나의 호출 스택을 사용하며, 현재 스택에 쌓여있는 모든 함수들이 실행을 마치고 스택에서 제거되기 전까지는 다른 어떠한 함수도 실행될 수 없다. 다음의 예제를 보자.


- 오호 이해하기 좋구먼... 
https://vimeo.com/96425312 (13:40 정도.. setTimer(0) 이지만 현재 콜스택을 끝내기 전까진 실행이 되지 않음. 실행할 기회가 없음)

- 약간은 브라우저의 관점에서 본 것 같기도... (브라우저, 노드 모두 이벤트 루프라는 개념을 사용하는 듯))


### 클러스터
> Node.js does not provide routing logic. It is, therefore important to design an application such that it does not rely too heavily on in-memory data objects for things like sessions and login.

> Because workers are all separate processes, they can be killed or re-spawned depending on a program's needs, without affecting other workers. As long as there are some workers still alive, the server will continue to accept connections. If no workers are alive, existing connections will be dropped and new connections will be refused. Node.js does not automatically manage the number of workers, however. It is the application's responsibility to manage the worker pool based on its own needs.


### 질문?
- 그렇다면 해당 콜스택에서 도중에 벗어나는 일은 전혀 없는건가? (제한시간이라던가 이런게 없나??)

- 노드를 왜 사용하는 걸까? 어떤 것들 때문에... 서버에서 좋은걸까??? (마이크로 서비스에서 좋다는 것이 무슨 의미인지?)
    - https://nodejs.org/api/cluster.html
    - 한 번 EC2 에서 구현해보고 돌려봐도 좋을듯?? ㅎ
    - 설정이 쉬운건지?? (각각이 생각하기 쉬운 단위이고, 그것들을... 여러개 뛰우기 쉬운 cluster 같은 모듈? 이 있어서)

- 왜 노드에서 cpu intensive 한 작업들이 실행되면 문제가 되는 걸까?
    - 일단 콜스택 때문 일 것도 같고
        - 낮은 레이턴시

- libuv 가 해주는 역할은??
    - 공식 문서에서 확인해보자 (https://sjh836.tistory.com/149 에서는 os 단에 애들을 추상화해주는 역할을 한다고 하는구만, 내부적으로 워커스레드풀을 두고 시스템 관련 부분을 대신? 처리하는?)
> Note: To prevent the poll phase from starving the event loop, libuv (the C library that implements the Node.js event loop and all of the asynchronous behaviors of the platform) also has a hard maximum (system dependent) before it stops polling for more events.

#### 어떻게 노드를 잘 쓸 수 있나요? (https://nodejs.org/ru/docs/guides/dont-block-the-event-loop/)

> The fair treatment of clients is thus the responsibility of your application. (This means that you shouldn't do too much work for any client in any single callback or task.)

- 복잡도 생각해보기
    - 최악의 경우를 돌려보고 내가 기다릴수 있는 시간보다 적은 시간인지 확인하기

- 조심해야하는 입력들
    - 정규표현식 (REDOS)
    - synchronous expensive API
        - 암호화
        - 압축
        - 파일 IO
        - DNS 에 요청
        - 프로세스 fork
    - JSON DOS

- worker pool
    - CPU intensive
    - IO intensive (While a Worker with an I/O-intensive task is waiting for its response, it has nothing else to do and can be de-scheduled by the operating system, giving another Worker a chance to submit their request. Thus, I/O-intensive tasks will be making progress even while the associated thread is not running)

> However, if your server relies heavily on complex calculations, you should think about whether Node is really a good fit. Node excels for I/O-bound work, but for expensive computation it might not be the best option.

> This is in keeping with Node's "one thread for many clients" philosophy, the secret to its scalability.

에공 결과적으로는 위의 철학을 지키기 위해서 사용자께서 열심히 생각해야한다
- 오래걸리는 일을 작은 단위로 쪼개기
- 사용하는 모듈 (npm 에서 가져온) 들도 문서든 코드든 검증해야함 (오래걸릴 수도 있응께)

> Whether you use only the Node Worker Pool or maintain separate Worker Pool(s), you should optimize the Task throughput of your Pool(s).

- 결론
    - EventLoop 나 Worker 들이 있음
        - 둘 다 한번에 한가지 일만 진행할 수 있음


#### 알았으면 하는 용어들?
- poll (polling, 자주쓰는 그 폴링임..!)
    - check the status of (a measuring device, part of a computer, or a node in a network), especially as part of a repeated cycle.
- defer
     - put off (an action or event) to a later time; postpone.

#### 무언가.... 알것 같은??
go 나 node.js 를 보다보면... 어찌보면 언어? 혹은 해당 개념에서 os 관련 자원들을 잘 사용해주는 것 같다. (그렇게 .... 사용자가 다루기 어려운 부분들을 해당 언어 혹은 개념에서 잘 지원해주기 때문에.. 사용하는 사람들이 신경쓰지 않고 다룰수 있도록?)
- 노드로 생각을 해보면... 이벤트루프라는 개념이 있는데 이는
    - 계속 돌면서.. 비동기 관련(혹은 타이머 등... 나중에 콜백으로 처리해줘야 하는 로직들) 일들을 처리해주는 .. .무언가 인 듯
    - 그래서 자원을 효율적으로 사용하면서
    - 각각의 단계들이 ... 실수하기 쉬운 부분들(시간 제한등)을 사용자에게 숨겨주는 역할? 
    - 그러면서도 최대한 효율적으로, 효과적으로 구현해놓은


### 특징?
Asynchronous!
- https://nodejs.org/en/docs/guides/blocking-vs-non-blocking/

EventLoop vs Worker

``` java

while (queue.waitForMessage()) {
    queue.processNextMessage();
}

```

`

### 참조
> <b id="f1"><sup>1</sup></b> https://velopert.com/133 [↩](#a1)<br>




- https://tk-one.github.io/2019/02/07/nodejs-event-loop/
- https://sjh836.tistory.com/149
- https://nodejs.org/ru/docs/guides/dont-block-the-event-loop/
- https://nodejs.org/en/docs/guides/blocking-vs-non-blocking/
- 