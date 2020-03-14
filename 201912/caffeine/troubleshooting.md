## 삽질 공유하기

### js 관련
- 문제
  - non-binding of 'this'

> This is all about where a function is invoked. (only depends on how the function was called)

``` ts
export default class ShopsPage extends Vue {
  @Prop({default: 'shops'}) name!: string;
  private shops: Shop[] = [];

  mounted () {
    const axios = require('axios').default

    axios
      .get('http://localhost:33333/shops')
      .then(function(response: any) {
        // 여기서 this 는 ShopsPage 의 객체가 아님..!! 따라서 터짐
        this.shops = .... 
      })
  }
}
```
- 해결방안
  - 
- 참조
  - https://www.logicbig.com/tutorials/misc/javascript/arrow-functions.html
  - https://gist.github.com/zcaceres/2a4ac91f9f42ec0ef9cd0d18e4e71262
  - https://stackoverflow.com/questions/20279484/how-to-access-the-correct-this-inside-a-callback
