### 어떤 느낌??!


### 그나마 이해하기 쉬운 예시??

``` java
class Origin{ 
	void method1() {
		return new Object();
	}

	void method2() {
		return method1();
	}
}

———————————
class CglibProxy extends Origin {
	@Overrid
	void method1() {
		// 적용할 프록시 구현
	}

	@Override method2() {
		// 적용할 프록시 구현

		// 여기서 method1 을 사용하면 `오버라이드 적용된 method1` 이 불림..!!
	}
}
```