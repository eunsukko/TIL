## 알아두어야 할 속성들

### grid
- https://vuetifyjs.com/ko/components/grids

- v-flex
  - ex. xs12
    - 오홍.. [breakpoints]0-12 로 표시할 수 있구나
      - ![Alt text](pictures/vuetify_grid_breakpoints.png?raw=true "Title")
    - 각 화면이 12개로 분할되어 있다고 생각하면 됨
      - xs12 는 xs 일때 12등분중에 12개만큼
      - xs6 은 xs 일때 12등분중에 6개만큼
        - 버전2 부터는 cols 를 이용
          - ex. <v-col cols="12">
  - https://medium.com/@cmdlhz/
  - https://blog.minamiland.com/376
  vuetify-part-2-of-3-2dd96eb7c926

- v-row
  - 


- v-container
  - 

``` html
   <v-card>
        <!-- v-container 를 사용하면 padding 이 추가됨, 이를 없애려고 pa-0 을 추가 -->
        <v-container fluid class="pa-0">
          <!-- no-gutters 는 테두리를 없애기 위함 -->
          <v-row no-gutters="true">
            <v-col>
              <!-- <div> -->
                <v-toolbar dense class="brown darken-1" dark>
                  <v-btn icon>
                    <v-icon>mdi-arrow-left</v-icon>
                  </v-btn>
                  <v-toolbar-title>Title</v-toolbar-title>
                  <v-spacer></v-spacer>
                  <v-btn icon>
                    <v-icon>mdi-magnify</v-icon>
                  </v-btn>
                </v-toolbar>
            </v-col>
          </v-row>
        </v-container>
      </v-card>
```

#### flex 란?? (자꾸 보여서리)
- grid 에서 자주 사용되는 용어들 정리(css) 
  - vuetify 에서도 이런 용어들을 사용하기에 알면 이해가 쉽다
  - https://heropy.blog/2018/11/24/css-flexible-box/
- flex 란?
  - https://d2.naver.com/helloworld/8540176