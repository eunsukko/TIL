### nginx!!!! 무엇이냐??!

#### 왜 생겼는지
(생각해보면 nginx 는 C10K 를 해결하기 위한 것도 있는데.. 여기서 Connection 이 나옴 -> 그렇기 때문에 ... Connection 에 대해서도 이야기를 해야 할 것 같다.. Connection 이 어떤 부분에서 문제일지? tip? 즉, 사용시에 어떤 부분들을 주의해주어야할지)

- C10K 문제
    - Throughtput (Requests/second) 보다는 efficient scheduling of connections (즉 특정 수의 Connection 을 어느정도 시간동안에 처리할 수 있는지.. 예를들어 Connection 이 비어지지 않으면.. 다른 요청들이 연결을 시도조차 하지 못하므로)
    - 풀기위해서 필요한 것( This can involve a combination of operating system constraints and web server software limitations)

좀 더 C10K 문제를 잘 파악했으면 해서... (직접 TCP 를 까보신 분.. ㄸ)
https://tech.kakao.com/2016/04/21/closewait-timewait/

- 특정 포트에 대해서 소켓이 하나가 묶여있음(binding) (https://recipes4dev.tistory.com/153)
- 이후 해당 접근에 대해서 새로운 소켓이 할당됨(accept) 
    - TCP 서버역할을 하는 애는 계속 바인딩된 소켓을 통해서 연결을 받고 있고
    - accept() 으로 새로 생성된 소켓을 통해서. 해당 클라이언트와 요청을 주고 받음

> 서버가 할당하는 것은 포트가 아닌 소켓이며 서버의 포트는 최초 bind()시 하나만 사용합니다. 로컬 포트를 할당하는 것은 클라이언트이며, 클라이언트가 connect()시 로컬 포트를 임의로(ephemeral port) 바인딩하면서 서버의 소켓과 연결됩니다.

> Dynamic sites, built using anything from Node.js to PHP, commonly deploy NGINX as a content cache and reverse proxy to reduce load on application servers and make the most effective use of the underlying hardware.


#### 랭킹
https://w3techs.com/technologies/cross/web_server/ranking


#### on the fly
>  you can upgrade the software on the fly, without any dropped connections, downtime, or interruption in service.

- 기존의 연결이 있는 경우 해당 연결이 끝날때까지 옛날 worker 를 동작시킴 (keep-alive 면 close 될 때 까지)
- 그러면서 새로운 worker 도 생성
    - config 설정
    - binary upgrade


#### 리버스 프록시 vs 로드밸런서
> A reverse proxy accepts a request from a client, forwards it to a server that can fulfill it, and returns the server’s response to the client.
A load balancer distributes incoming client requests among a group of servers, in each case returning the response from the selected server to the appropriate client.
(https://www.nginx.com/resources/glossary/reverse-proxy-vs-load-balancer/)

- 로드밸런서
    - 효율성
    - 안정성 (avoid single point failure)

> Most commonly, the servers all host the same content, and the load balancer’s job is to distribute the workload in a way that makes the best use of each server’s capacity, prevents overload on any server, and results in the fastest possible response to the client.

- 리버스 프록시
    - 보안
    - 유연성 (프록시 뒤에서 서버들이 추가되는 제거되든 외부에서는 모름)
        - 확장성 (up/down)
    - 레이턴시 감소(프록시에서 특정 역할을 나눠서 감당함으로써)
        - 압축
        - SSL
        - 캐시


### 설계
(https://www.aosabook.org/en/nginx.html#fig.nginx.arch)

#### 왜 동시성이 중요해졌는가?

'동시에 연결되어 있는 connectin 의 수'
- 옛날에 있던 문제
    - 느린 클라이언트 (라기보단 사실 낮은 네트워크 대역폭?)
        - ex. 100KB 크기의 웹페이지 로딩
            - 서버에서 응답을 생성해서 보내는데는 0.1초라고 해보자
            - 대역폭이 10KB/s 이면 보내는데 10초...
            - 10초 동안 계속 요청이 온다면?? (특정 시점에 서버에서 동시에 들고 있어야 하는 connection 이 많아짐 -> concurrent...!)

- 현재 있는 문제
    - 모바일 환경
    - 연결을 유지하고 요청을 주고 받는 상황(tweet, )
    - 브라우저 사용 방식 변화 (한 페이지에서 여러개의 요청)

- 각 커넥션마다 프로세스 생성?
    - 1개당 1MB 이상
        - 1000개 연결이면 1GB 이상..!

#### 결론적으론?
'Thus, the web server should be able to scale nonlinearly with the growing number of simultaneous connections and requests per second.'

> (CPU, memory, disks), network capacity, application and data storage architecture 에 대해서 적용되어야함

#### 아파치의 상황
> Eventually Apache became a general purpose web server focusing on having many different features, a variety of third-party extensions, and universal applicability to practically any kind of web application development. 

좋은 토대이지만 확장성(scalability) 에서는 문제가 있음 

#### 그래서 nginx 는?
> What resulted is a modular, event-driven, asynchronous, single-threaded, non-blocking architecture which became the foundation of nginx code.

> Overall, the key principle is to be as non-blocking as possible. The only situation where nginx can still block is when there's not enough disk storage performance for a worker process.

> What nginx does is check the state of the network and storage, initialize new connections, add them to the run-loop, and process asynchronously until completion, at which point the connection is deallocated and removed from the run-loop. 

>  if the load pattern is CPU intensive—for instance, handling a lot of TCP/IP, doing SSL, or compression—the number of nginx workers should match the number of CPU cores; if the load is mostly disk I/O bound—for instance, serving different sets of content from storage, or heavy proxying—the number of workers might be one and a half to two times the number of cores.


#### 싱글스레드라서 좋은 점..!
>  There's no resource starvation and the resource controlling mechanisms are isolated within single-threaded worker processes
(https://www.aosabook.org/en/nginx.html)


#### 궁금한 부분
- 마이크로서비스와 리버스 프록시와의 관계??
    - https://dzone.com/articles/why-proxies-are-important-for-microservices
    - https://springbootdev.com/2018/01/24/netflix-zuul-importance-of-reverse-proxy-in-microservices-architecture-spring-cloud-netflix-zuul/

- nginx 가 안전한 이유는 웹서버 역할 같이 주어진 역할만 하기때문?? (cpu intensive 한 일 자체를 할 수 없어서??)


#### 참조
- https://www.nginx.com/blog/nginx-and-nginx-plus-everywhere/
- https://jaxenter.com/nodejs-framework-scalable-architecture-133961.html
- https://stackoverflow.com/questions/16578874/what-specifically-makes-node-js-more-scalable-than-apache 