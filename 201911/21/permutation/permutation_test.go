package permutation

import (
	"reflect"
	"testing"
)

func TestPermutation(t *testing.T) {
	tests := []struct {
		n    int
		want [][]int
	}{
		{
			1,
			[][]int{
				{0},
			},
		},
		{
			2,
			[][]int{
				{0, 1},
				{1, 0},
			},
		},
		{
			3,
			[][]int{
				{0, 1, 2},
				{0, 2, 1},
				{1, 0, 2},
				{1, 2, 0},
				{2, 0, 1},
				{2, 1, 0},
			},
		},
	}

	for i, tt := range tests {
		permutation := Permutation(tt.n)

		got := func(permutation <-chan []int) [][]int {
			permutations := [][]int{}

			for perm := range permutation {
				permutations = append(permutations, perm)
			}

			return permutations
		}(permutation)

		if !reflect.DeepEqual(got, tt.want) {
			t.Errorf("[%d] got: %v, want: %v\n", i, got, tt.want)
		}
	}
}
