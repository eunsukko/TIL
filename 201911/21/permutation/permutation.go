package permutation

func Permutation(n int) <-chan []int {
	c := make(chan []int)
	go func() {
		defer close(c)
		recursive(n, c)
	}()

	return c
}

//
func recursive(n int, c chan<- []int) {
	visited := make([]bool, n)
	ordered := make([]int, n)

	var rec func(idx int)

	rec = func(idx int) {
		if idx == n {
			cpy := make([]int, n)
			copy(cpy, ordered)
			c <- cpy
			return
		}

		for i := 0; i < n; i++ {
			if visited[i] {
				continue
			}
			visited[i] = true
			ordered[idx] = i
			rec(idx + 1)
			visited[i] = false
		}
	}

	rec(0)
}

// https://www.golangprograms.com/golang-program-to-print-all-permutations-of-a-given-string.html
