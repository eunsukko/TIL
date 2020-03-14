## 예습 겸... 레디스란 무엇인가?
- 어떤 상황에 사용하면 좋을까?
- 무엇을 위해서 만들어 진걸까?
- 한마디로 표현하라면?
    - 인메모리 kv 서버?

### 참고한 자료들
- https://kingbbode.tistory.com/25
    - spring 에서 레디스를 사용할 때 유용할 듯
```java
@Before
public void init() { 
    //list put 
    listOperations.rightPush("test:task", "자기소개");  
    listOperations.rightPush("test:task", "취미소개"); 
    listOperations.rightPush("test:task", "소망소개"); 
    listOperations.rightPush("test:task", "선임이직"); 
    
    //hash put 
    hashOperations.put("test:user:kingbbode", "name", "권뽀대"); 
    hashOperations.put("test:user:kingbbode", "age", "28"); 
    
    //set
    setOperations.add("test:user:kingbbode:hobby", "개발"); 
    setOperations.add("test:user:kingbbode:hobby", "잠"); 
    setOperations.add("test:user:kingbbode:hobby", "옷 구경"); 
    
    //zset 
    zSetOperations.add("test:user:kingbbode:wish", "배포한 것에 장애없길", 1); 
    zSetOperations.add("test:user:kingbbode:wish", "배포한거 아니여도 장애없길", 2); 
    zSetOperations.add("test:user:kingbbode:wish", "경력직 채용", 3); 
    zSetOperations.add("test:user:kingbbode:wish", "잘자기", 4); 
}

@Test 
public void redisTest1() { 
    String task = listOperations.leftPop("test:task"); 
    StringBuilder stringBuilder = new StringBuilder(); 
    while (task != null) { 
        switch (task) { 
            case "자기소개": 
                Map<String, String> intro = hashOperations.entries("test:user:kingbbode"); stringBuilder.append("\n******자기소개********"); 
                stringBuilder.append("\n이름은 "); 
                stringBuilder.append(intro.get("name")); 
                stringBuilder.append("\n나이는 "); 
                stringBuilder.append(intro.get("age")); 
                break; 
            case "취미소개": 
                Set<String> hobbys = setOperations.members("test:user:kingbbode:hobby"); stringBuilder.append("\n******취미소개******"); 
                stringBuilder.append("취미는"); 
                for (String hobby : hobbys) { 
                    stringBuilder.append("\n"); 
                    stringBuilder.append(hobby); 
                } 
                break; 
            case "소망소개": 
                Set<String> wishes = zSetOperations.range("test:user:kingbbode:wish", 0, 2); stringBuilder.append("\n******소망소개******"); 
                int rank = 1; 
                for (String wish : wishes){ 
                    stringBuilder.append("\n"); 
                    stringBuilder.append(rank); 
                    stringBuilder.append("등 "); 
                    stringBuilder.append(wish); 
                    rank++; 
                } 
                break; 
            case "선임이직": 
                stringBuilder.append("\n!!! 믿었던 선임 이직"); 
                zSetOperations.incrementScore("test:user:kingbbode:wish", "경력직 채용", -1); listOperations.rightPush("test:task", "소망소개"); 
                break; 
            default: 
                stringBuilder.append("nonone"); 
        } 
        task = listOperations.leftPop("test:task"); 
    } 
    System.out.println(stringBuilder.toString()); 
}
```

- https://engkimbs.tistory.com/869
    - 메세지 큐
    - 공유 메모리
    - Remote Dictionary

## 나는 레디스를 가지고 무엇을 시도해 볼 수 있을까?