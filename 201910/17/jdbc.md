### 무엇일까??

### 중요한 인터페이스 확인하기
- DriverManger
    - 어떻게 특정 Driver 에 대한 요청인지 알아낼 수 있나요?
- Driver
    - 특정 데이터베이스랑 소통?하기 위함(어떤)
- Connection
    - pool 을 사용한다면, 

- Statement
- ResultSet
- SQLException
DriverManager: This class manages a list of database drivers. Matches connection requests from the java application with the proper database driver using communication sub protocol. The first driver that recognizes a certain subprotocol under JDBC will be used to establish a database Connection.

Driver: This interface handles the communications with the database server. You will interact directly with Driver objects very rarely. Instead, you use DriverManager objects, which manages objects of this type. It also abstracts the details associated with working with Driver objects.

Connection: This interface with all methods for contacting a database. The connection object represents communication context, i.e., all communication with database is through connection object only.

Statement: You use objects created from this interface to submit the SQL statements to the database. Some derived interfaces accept parameters in addition to executing stored procedures.

ResultSet: These objects hold data retrieved from a database after you execute an SQL query using Statement objects. It acts as an iterator to allow you to move through its data.

SQLException: This class handles any errors that occur in a database application.


### 생각나는 질문들
- 왜 존재하는 걸까?
    - 무엇을 위해서? 
        - 특정한 데이터베이스에 접근하는 것에 대한 스펙?? (JDBC is a specification that provides a complete set of interfaces that allows for portable access to an underlying database.)
        - 이를 통해서 자바코드에서 특정한 데이터베이스를 잘 접근할 수 있음 
            - 자바 코드가 쓰이는 곳들이라면
                - Java Applications
                - Java Applets
                - Java Servlets
                - Java ServerPages (JSPs)
                - Enterprise JavaBeans (EJBs)
            - 동일한 인터페이스로 각각의 데이터베이스를 접근할 수 있도록(allowing Java programs to contain database-independent code.)
                - 방언들 까지도 구분이 될까?? (ex. preparedStatement 를 특정 db 에서 적용되는 sql 을 사용했을때)
- 특히... Connection
    - pooling 이라는 것이 대체 무엇을 해주는 것일까?
        - 어떤 것을 할당하고 있는걸까?
            - 파일에서 fd 를 가지고 있는 것 같은걸까?
            - 특정 서버와 연결된 상태???
            - 그리고 그 연결된 서버에 무엇인가 주고 받을 수 있는 상태?


### 참고
- https://www.tutorialspoint.com/jdbc/jdbc-introduction.htm