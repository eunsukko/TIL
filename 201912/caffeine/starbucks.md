### 스타벅스 매장 정보 보기
- https://www.istarbucks.co.kr/store/store_map.do?disp=locale

### 예시로 사용한 매장 정보
- 석촌호수
  - 서울특별시 송파구 석촌호수로 262 (송파동)
  - 02-758-8693
- 송파나루역DT
  - 서울특별시 송파구 오금로 142 (송파동)
  - 02-421-3622
- 송파구청
  - 서울특별시 송파구 오금로 87 (방이동)
  - 02-2145-0300
- 잠실시그마타워
  - 서울특별시 송파구 올림픽로 289 (신천동)
  - 02-417-3614
- 잠실푸르지오월드
  - 서울특별시 송파구 올림픽로35가길 9, 잠실푸르지오월드마크 1층 (신천동)
  - 02-758-8652

### 스타벅스 매장검색 화면
- 검색창
- 옵션 별 검색 (dt, 리저브, 블론드, 콜드브루, 주차 가능)
- 가까운 매장 | 자주 가는 매장
- 매장 리스트

![Alt text](pictures/starbucks_shops.jpeg?raw=true "Title")


### 스타벅스 메뉴 화면


![Alt text](pictures/starbucks_menu.jpeg?raw=true "Title")

### 스타벅스 음료 화면


![Alt text](pictures/starbucks_coffee.jpeg?raw=true "Title")

### 스타벅스 주문 화면
![Alt text](pictures/starbucks_order.jpeg?raw=true "Title")


### 메뉴 예시들

메뉴 관련 정보들?
  - id
  - name
  - price
  - img
  - options
    - 아이스 / hot
    - 포장 / 테이크아웃
    - 사이즈
    - 옵션 (지금은 불필요?)
  - 분류 (카테고리?)
    - 음료
    - 푸드

- 프리미엄 바나나
  - Preminum Banana
  - 1500
  - https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_banana.jpeg?raw=true
  - food

- 아메리카노
  - Americano
  - 4100
  - https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_americano.jpg?raw=true
  - beverage

- 아이스 아메리카노
  - Ice Americano
  - 4100
  - https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_americano.jpg?raw=true
  - beverage

- 카페 라떼
  - Caffe Latte
  - 4600
  - https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_latte.jpg?raw=true
  - beverage

- 아이스 카페 라떼
  - Ice Caffe Latte
  - 4600
  - https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_latte.jpg?raw=true
  - beverage

- 카라멜 마키아또
  - Caramel Macchiato
  - 5600
  - https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_caramel_macchiato.jpg?raw=true
  - beverage

- 아이스 카라멜 마키아또 
  - Ice Caramel Macchiato
  - 5600
  - https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_caramel_macchiato.jpg?raw=true
  - beverage

- 자몽 허니 블랙 티
  - Grapefruit Honey Black Tea
  - 5300
  - https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_grapefruit_honey_black_tea?raw=true
  - beverage

- 아이스 자몽 허니 블랙 티
  - Ice Grapefruit Honey Black Tea
  - 5300
  - https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_grapefruit_honey_black_tea?raw=true
  - beverage

- 그린 티 라떼
  - Green Tea Latte
  - 5900
  - https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_green_tea_latte.jpg?raw=true
  - beverage

- 아이스 그린 티 라떼
  - Ice Green Tea Latte
  - 5900
  - https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_green_tea_latte.jpg?raw=true
  - beverage

```json
[{
  "id": "1",
  "name": "프리미엄 바나나",
  "nameInEnglish": "Preminum Banana",
  "price": "1500",
  "img": "https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_banana.jpeg?raw=true",
  "category": "food"
},
{
  "id": "2",
  "name": "아메리카노",
  "nameInEnglish": "Americano",
  "price": "4100",
  "img": "https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_americano.jpg?raw=true",
  "category": "beverage"
},
{
  "id": "3",
  "name": "아이스 아메리카노",
  "nameInEnglish": "Ice Americano",
  "price": "4100",
  "img": "https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_americano.jpg?raw=true",
  "category": "beverage"
},
{
  "id": "4",
  "name": "카페 라떼",
  "nameInEnglish": "Caffe Latte",
  "price": "4600",
  "img": "https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_latte.jpg?raw=true",
  "category": "beverage"
},
{
  "id": "5",
  "name": "아이스 카페 라떼",
  "nameInEnglish": "Ice Caffe Latte",
  "price": "4600",
  "img": "https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_latte.jpg?raw=true",
  "category": "beverage"
},
{
  "id": "6",
  "name": "카라멜 마키아또",
  "nameInEnglish": "Caramel Macchiato",
  "price": "5600",
  "img": "https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_caramel_macchiato.jpg?raw=true",
  "category": "beverage"
},
{
  "id": "7",
  "name": "카라멜 마키아또",
  "nameInEnglish": "Ice Caramel Macchiato",
  "price": "5600",
  "img": "https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_caramel_macchiato.jpg?raw=true",
  "category": "beverage"
},
{
  "id": "8",
  "name": "자몽 허니 블랙 티",
  "nameInEnglish": "Grapefruit Honey Black Tea",
  "price": "5300",
  "img": "https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_grapefruit_honey_black_tea?raw=true",
  "category": "beverage"
},
{
  "id": "9",
  "name": "아이스 자몽 허니 블랙 티",
  "nameInEnglish": "Ice Grapefruit Honey Black Tea",
  "price": "5300",
  "img": "https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_grapefruit_honey_black_tea?raw=true",
  "category": "beverage"
},
{
  "id": "10",
  "name": "그린 티 라떼",
  "nameInEnglish": "Green Tea Latte",
  "price": "5900",
  "img": "https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_green_tea_latte.jpg?raw=true",
  "category": "beverage"
},
{
  "id": "11",
  "name": "아이스 그린 티 라떼",
  "nameInEnglish": "Ice Green Tea Latte",
  "price": "5900",
  "img": "https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_green_tea_latte.jpg?raw=true",
  "category": "beverage"
}
] 
```