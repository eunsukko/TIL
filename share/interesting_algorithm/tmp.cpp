#include <string>
#include <vector>
#include <stdio.h>
 
using namespace std;

// numPeople 인 숫자가 건너갈 수 있는지 확인하는 로직
// k 를 건너 뛸 순 없음 (사람들이 건널 수 없는 최소값!)
bool canPeopleCross(vector<int> &stones, int numPeople, int k) {
    // 현재 위치를 i 라고 할 때
    // i - 1 부터 감소하는 방향으로, 연속된 '건널 수 없는 돌' 의 개수
    int pre = 0;
 
    for (auto stone : stones) {
        // stone == numPeople 일 경우, numPeople 까지는 건널 수 있는 경우(이후부터 못 건넘)
        // 따라서 stone < numPeople 인 경우를 세어줍니다!
        if (stone < numPeople) {
            // 이제 pre 는 현재위치(i)도 포함하게 됩니다..!
            pre += 1;
            // 현재위치까지 못건너는 연속된 돌의 개수가 k 개인 경우 -> 건널수없는 경우!
            if (k <= pre) {
                return false;
            }
        } else {
            pre = 0;
        }
    }
    return true;
}
 
int solution(vector<int> stones, int k) {
    // printf("%d\n", isPossible(stones, 2, 1));
    int answer = 0;
 
    long long l = 1, r = 200000001;
 
    // [l, r)
    while((r - l) > 1) {
        long long mid = (l + r) >> 1;
 
        if (canPeopleCross(stones, mid, k)) {
            l = mid;
        } else {
            r = mid;
        }
    }
 
    return l;
}