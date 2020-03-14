package combination

// 현재는 []int 를 반환한다
//
// 이 경우 매번.. []int 를 생성해줘야한다.. ㄷ
// 그냥 한 []int 를 가지고 계속 변경하고
// chan 로 변경되었다는 신호(Next 등을 구현해서)를 주는 것도 방법일 듯

func Combination(n, r int) <-chan []int {
	c := make(chan []int)

	go func() {
		defer close(c)

		recursive(n, r, c)
	}()

	return c
}

func recursive(n, r int, c chan<- []int) {
	ordered := make([]int, r)

	var rec func(begin, idx int)
	rec = func(begin, idx int) {
		if idx == r {
			cpy := make([]int, len(ordered))
			copy(cpy, ordered)
			c <- cpy

			return
		}
		for i := begin; i < n; i++ {
			ordered[idx] = i
			rec(i+1, idx+1)
		}
	}

	rec(0, 0)
}
