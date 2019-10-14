
## 1줄 요약


## 3줄 요약
- IP 주소 알아내기 (DNS 서버를 통함)
- TCP/IP 연결
- HTTP 응답/요청 주고받기

## 자세히

### maps.google.com 을 브라우저에 입력하면 어떤 과정이 진행될까요?
- 어떻게 내 브라우저에 해당 페이지가 보이게 될까요??

1. You type maps.google.com into the address bar of your browser.

2. The browser checks the cache for a DNS record to find the corresponding IP address of maps.google.com.
- DNS(Domain Name System): URL에서 IP 를 알아내기 위함
    - URL 은 사람이 알아보기 편하게 하기 위함
    - 컴터는 IP 주소를 통해서 인식
- 4개의 캐시가 있어요 (캐시를 찾아보는 순)
    - 브라우저 캐시
    - OS 캐시
    - 라우터 캐시
    - ISP 캐시



3. If the requested URL is not in the cache, ISP’s DNS server initiates a DNS query to find the IP address of the server that hosts maps.google.com.
- 내가 원하는 IP 정보를 찾을 때 까지 반복해서 DNS 서버들을 돌아다님
    - 내가 속한 ISP의 DNS 서버에서 시작 (DNS recusor 라 불림)
        - DNS recusor 의 IP 주소를 같이 보냄 (IP 정보를 찾았을 때 돌려줄 위치)

![Alt text](pictures/dns.png?raw=true "Title")

---------

![Alt text](pictures/dns_lookup.png?raw=true "Title")

여기까지가 보낼 주소를 알아내는 과정
-----------
4. Browser initiates a TCP connection with the server.
- 알아낸 IP 에 해당하는 서버랑 연결이 필요합니다
- TCP/IP three-way handshake 를 통함
    - 클라이언트가 SYN 패킷을 보냅니다
    - 서버가 받아들일 수 있으면 SYN/ACK 을 보냅니다
    - 클라이언트가 SYN/ACK 패킷을 받으면 ACK 패킷을 보냅니다

5. The browser sends an HTTP request to the web server.
- 브라우저가 서버로 요청을 보냅니다!
    - GET, POST
    - 추가적인 정보 전달 (파라미터 or 바디)
    - 브라우저 관련 정보
        - User-Agent: 어떤 브라우저인지 어느 버전인지
        - Accept: 브라우저가 처리할 수 있는 Content-Type 정보
        - TCP connection 관련 정보:  (ex. Connection: Keep-Alive)
        - 쿠키

6. The server handles the request and sends back a response.
- 웹서버가 도달한 요청을 처리합니다!
    - 해당 요청을 처리할 핸들러에게 요청을 보냅니다
    - 핸들러가 요청을 처리합니다
        - 요청을 파악합니다 (헤더, 쿠기 등 포함)
        - 서버에 수정할 것이 있으면 수정합니다. (ex. db에 데이터 추가)
    - 응답(HTTP response)을 만들어 줍니다 (ex. JSON, XML, HTML 등의 형태로)

7. The server sends out an HTTP response.
- response 는 여러 정보를 가지고 있어요
    - 응답으로 전달할 웹 페이지
    - 상태 코드
    - 압축 정보 (Content-Encoding)
    - 캐시 전략 (Cache-Control)
    - 쿠키 (Set-Cookie)
    - 등등

8. The browser displays the HTML content (for HTML responses which is the most common).
- browser displays the HTML content
    - render the bare bone HTML skeleton
    - check HTML tags
        - send out GET requests for additional elements (ex. images, CSS stylesheets, JavaScript files)
            - 이런 static 파일들은 캐시되기 때문에 다음에 요청할 때는 가져올 필요 없어요..!





#### 출처
- https://medium.com/@maneesha.wijesinghe1/what-happens-when-you-type-an-url-in-the-browser-and-press-enter-bb0aa2449c1a