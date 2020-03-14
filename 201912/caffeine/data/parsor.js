var menu = [
  {
    "id": "1",
    "name": "프리미엄 바나나",
    "nameInEnglish": "Preminum Banana",
    "price": "1500",
    "image": "https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_banana.jpeg?raw=true",
    "category": "food"
  },
  {
    "id": "2",
    "name": "아메리카노",
    "nameInEnglish": "Americano",
    "price": "4100",
    "image": "https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_americano.jpg?raw=true",
    "category": "beverage"
  },
  {
    "id": "3",
    "name": "아이스 아메리카노",
    "nameInEnglish": "Ice Americano",
    "price": "4100",
    "image": "https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_americano.jpg?raw=true",
    "category": "beverage"
  },
  {
    "id": "4",
    "name": "카페 라떼",
    "nameInEnglish": "Caffe Latte",
    "price": "4600",
    "image": "https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_latte.jpg?raw=true",
    "category": "beverage"
  },
  {
    "id": "5",
    "name": "아이스 카페 라떼",
    "nameInEnglish": "Ice Caffe Latte",
    "price": "4600",
    "image": "https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_latte.jpg?raw=true",
    "category": "beverage"
  },
  {
    "id": "6",
    "name": "카라멜 마키아또",
    "nameInEnglish": "Caramel Macchiato",
    "price": "5600",
    "image": "https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_caramel_macchiato.jpg?raw=true",
    "category": "beverage"
  },
  {
    "id": "7",
    "name": "카라멜 마키아또",
    "nameInEnglish": "Ice Caramel Macchiato",
    "price": "5600",
    "image": "https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_caramel_macchiato.jpg?raw=true",
    "category": "beverage"
  },
  {
    "id": "8",
    "name": "자몽 허니 블랙 티",
    "nameInEnglish": "Grapefruit Honey Black Tea",
    "price": "5300",
    "image": "https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_grapefruit_honey_black_tea.jpg?raw=true",
    "category": "beverage"
  },
  {
    "id": "9",
    "name": "아이스 자몽 허니 블랙 티",
    "nameInEnglish": "Ice Grapefruit Honey Black Tea",
    "price": "5300",
    "image": "https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_grapefruit_honey_black_tea.jpg?raw=true",
    "category": "beverage"
  },
  {
    "id": "10",
    "name": "그린 티 라떼",
    "nameInEnglish": "Green Tea Latte",
    "price": "5900",
    "image": "https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_green_tea_latte.jpg?raw=true",
    "category": "beverage"
  },
  {
    "id": "11",
    "name": "아이스 그린 티 라떼",
    "nameInEnglish": "Ice Green Tea Latte",
    "price": "5900",
    "image": "https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_green_tea_latte.jpg?raw=true",
    "category": "beverage"
  }]


for (let i in menu) {
  let m = menu[i]

  if (Math.random() < 0.5) {
    continue
  }

  let shopId = 104

  console.log('INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES('
  + m.id + ','
  + `'` + m.name + `'` + ','
  + `'` + m.nameInEnglish + `'` + ','
  + `'` + '짱 맛있어용' + `'` + ','
  + m.price + ','
  + `'` + m.image + `'` + ','
  + `'` + m.category + `'` + ','
  + shopId + ')'
  )
}