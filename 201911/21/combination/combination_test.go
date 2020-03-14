package combination

import (
	"reflect"
	"testing"
)

func TestCombination(t *testing.T) {
	tests := []struct {
		n    int
		r    int
		want [][]int
	}{
		{
			2,
			2,
			[][]int{
				{0, 1},
			},
		},
		{
			3,
			2,
			[][]int{
				{0, 1},
				{0, 2},
				{1, 2},
			},
		},
		{
			4,
			2,
			[][]int{
				{0, 1},
				{0, 2},
				{0, 3},
				{1, 2},
				{1, 3},
				{2, 3},
			},
		},
	}

	for i, tt := range tests {
		combination := Combination(tt.n, tt.r)

		got := func(combination <-chan []int) [][]int {
			combinations := [][]int{}

			for combi := range combination {
				combinations = append(combinations, combi)
			}

			return combinations
		}(combination)

		if !reflect.DeepEqual(got, tt.want) {
			t.Errorf("[%d] got: %v, want: %v\n", i, got, tt.want)
		}
	}
}
