### 좋은 코드들을 보면서 생각하는 부분들을 정리해보자

```java
[]byte value = Arrays.copyOf(value,
                    newCapacity(minimumCapacity) << coder);
```
- 매개변수가 여러개 일 때 컴마(,)를 어디에 놓으면 좋을지??

------------------
```java
class CharIterator implements PrimitiveIterator.OfInt {
    int cur = 0;

    public boolean hasNext() {
        return cur < length();
    }

    public int nextInt() {
        if (hasNext()) {
            return charAt(cur++);
        } else {
            throw new NoSuchElementException();
        }
    }
    @Override
    public void forEachRemaining(IntConsumer block) {
        for (; cur < length(); cur++) {
            block.accept(charAt(cur));
        }
    }
}
```
-  내 iterator 짤 때 참고하자
------------------------------