## 문서들
- 타입스크립트
  - https://www.typescriptlang.org/docs/handbook/basic-types.html
  - 타입관련
    - [ ] https://hyunseob.github.io/2017/12/12/typescript-type-inteference-and-type-assertion/
- 자바스트립트
  - 타입관련
    - [ ] var vs let vs const (https://gist.github.com/LeoHeo/7c2a2a6dbcf80becaaa1e61e90091e5d)
  - 간단한 로직 관련
    - [ ] Array.filter (https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Array/filter)
- Vue
  - 공식 가이드
    - [ ] https://kr.vuejs.org/v2/guide/
  - vue 예시들을 모아놓은 사이트
    - [ ] https://vuejsexamples.com/tag/mobile/
- 화면 구성을 위한
  - [ ] https://www.w3schools.com/bootstrap/bootstrap_media_objects.asp
- vue + 타입스크립트
  - [ ] https://github.com/Microsoft/TypeScript-Vue-Starter
    - 여기서는 무엇을 배울 수 있을까?

- 읽을거리
  - http://jeonghwan-kim.github.io/2018/04/07/vue-router.html
    - 저자(김정한)분이 뷰 관련해서 적어놓으신 것을 한 번 훑어보는 것도 좋을 것 같다.

## directive 종류 + 사용처 예시?? 모아보기

- v-model
  - [ ] v-model 관련 예시 코드들 (https://ashnamuh.com/14)
- v-show

### v-bind

> 정규 속성을 표현식에 바인딩하는 것과 비슷하게, v-bind를 사용하여 부모의 데이터에 props를 동적으로 바인딩 할 수 있습니다. 데이터가 상위에서 업데이트 될 때마다 하위 데이터로도 전달됩니다. (https://kr.vuejs.org/v2/guide/components.html)

```ts
<child v-bind:my-message="parentMsg"></child>
// 위와 동일함, 단축구문
<child :my-message="parentMsg"></child>
```

### v-model

```ts
```

### v-for
- 왜 v-bind:key 가 필요한지 대략적인 설명이 있음 (https://medium.com/@hozacho/%EB%A7%A8%EB%95%85%EC%97%90vuejs-v-for-%EB%A6%AC%EC%8A%A4%ED%8A%B8-%EB%A0%8C%EB%8D%94%EB%A7%81-%EB%B0%98%EB%B3%B5%EB%AC%B8-83501d7a635a)


## 문법 보다가 이해가 안되는 부분

```ts
@Prop() private isEnabled!: () => boolean;

// ? 는 처음에 반드시 있어야하진 않아도 된다는 것 같다.. (타입이 boolean | undefined 로 표시되는 것을 보면?)
@Prop({default: true}) private showHistoryButton?: boolean;
```

