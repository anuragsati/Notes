# 6 JUNE

- [x] https://leetcode.com/problems/k-th-symbol-in-grammar/
    look at how kth symbol is derived if it is even position then it is flipped else same
    and it is derived from its parent ceil(k/2)
    f(n) = f(n-1, k/2); if even then flip else same


# 7 JUNE

- [x] Lexical subsets
    just do for loop no need for base case [sorting needed]

    ```c++
        add subset
        for(int i=idx; i<n; ++i){
            push_back
            recurse
            popback
        }
    ```