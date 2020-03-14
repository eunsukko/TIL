package main

import "fmt"
import "./combination"
import "./permutation"

func main() {
	tt := []struct {
		userIDs     []string
		bannedIDs   []string
		possibleCnt int
	}{
		{
			[]string{"frodo", "fradi", "crodo", "abc123", "frodoc"},
			[]string{"fr*d*", "abc1**"},
			2,
		},
		{
			[]string{"frodo", "fradi", "crodo", "abc123", "frodoc"},
			[]string{"*rodo", "*rodo", "******"},
			2,
		},
		{
			[]string{"frodo", "fradi", "crodo", "abc123", "frodoc"},
			[]string{"fr*d*", "*rodo", "******", "******"},
			3,
		},
	}

	for i, t := range tt {
		got := solve(t.userIDs, t.bannedIDs)
		want := t.possibleCnt

		if got != want {
			fmt.Printf("[%d] got: %v, want: %v\n", i, got, want)
		} else {
			fmt.Printf("[%d] succeed!! got: %v, want: %v\n", i, got, want)
		}
	}
}

func solve(userIDs, bannedIDs []string) int {
	n := len(userIDs)
	r := len(bannedIDs)

	possibleCnt := 0
	// 모든 부분집합 구하기 (bannedIDs 크기만큼)
	for combi := range combination.Combination(n, r) {
		subset := func(idxes []int) []string {
			ids := make([]string, 0, r)
			for _, idx := range idxes {
				ids = append(ids, userIDs[idx])
			}
			return ids
		}(combi)

		// 각 부분 집합 중에서 가능한지 판단하기
		if isPossible(subset, bannedIDs) {
			possibleCnt++
		}
	}

	return possibleCnt
}

func isPossible(userIDs, bannedIDs []string) bool {
	if len(userIDs) != len(bannedIDs) {
		return false
	}

	n := len(userIDs)
	for perm := range permutation.Permutation(n) {
		curIDs := func(idxes []int) []string {
			ids := make([]string, 0, n)
			for _, idx := range idxes {
				ids = append(ids, userIDs[idx])
			}

			return ids
		}(perm)

		if canBeBanned(curIDs, bannedIDs) {
			return true
		}
	}
	return false
}

func canBeBanned(userIDs, bannedIDs []string) bool {
	canBeBanned := func(userID, bannedID string) bool {
		if len(userID) != len(bannedID) {
			return false
		}

		for i := 0; i < len(userID); i++ {
			u := userID[i]
			b := bannedID[i]

			if b != '*' && u != b {
				return false
			}
		}

		return true
	}

	for i := 0; i < len(userIDs); i++ {
		userID := userIDs[i]
		bannedID := bannedIDs[i]

		if !canBeBanned(userID, bannedID) {
			return false
		}
	}
	return true
}
