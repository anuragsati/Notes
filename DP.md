***
## General rules
- if such dp comes where we have to choose out of some but not consicutive we can create dp array such that
    dp[i][j] = dp[i-1][j] + ... (not include which we cant choose consecutively)


***
# Dynamic Programming

---

-   0/1 knapsack
    -   subset sum
    -   equal sum partition
    -   count of subset sum
    -   minimum subset sum diff
    -   target sum
    -   no. of subset with given diff
-   Unbounded knapsack
-   LCS
-   LIS
-   Kadane's
-   Matrix chain multiplication
-   Dp on trees
-   Dp on grid

---

## 0/1 knapsack

- when only one array is given we consider as weight and `ignore value array`

#### General knapsack

```c++
    int dp[n+1][w+1];

    for(...)
        //initialize
        // with 0

    for(int i=1; i<=n; ++i){
        for(int j=1; j<=w; ++j){
            if(w[i-1] <= j)
                dp[i][j] = max(dp[i-1][j-w[i-1]] + v[i-1] , dp[i-1][j]);
            else
                dp[i][j] = dp[i-1][j];
        }
    }

    // Printing

    for(int i=n; i>0 && sz>0; --i){
        if(dp[i][sz] != dp[i-1][sz]){
            cout << v[i-1];
            sz -= w[i-1];
        }
    }

```

#### 1. subset sum

```c++
    //n = size of arr 

    int dp[n+1][sum+1];

    
    //  T F F F F F F F
    //  T
    //  T
    //  T
    //  T
    //  T

    // 1st column true - we can make sum 0
    // 1 row except (0,0) false - can't make sum

    for(int i=1; i<=n; ++i){
        for(int j=1; j<=sum; ++j){
            if(a[i-1]<=j){
                dp[i][j] = dp[i-1][j] || dp[i-1][j-a[i-1]];
            }
            else{
                dp[i][j] = dp[i-1][j];
            }
        }
    }

    if(dp[n][w])
        "yes possible"
    else
        "not possible"

```

#### 2. equal sum partition

- first find out sum
- if sum is odd ans is not possible
- if sum is even check if we can make sum/2 using subset sum method

```c++
    //n = size of arr 

    for(...)
        sum += a[i];
    
    if(sum & 1){
        "not possible"
        return;
    }

    sum /= 2;

    int dp[n+1][sum+1];
    
    //  T F F F F F F F
    //  T
    //  T
    //  T
    //  T
    //  T

    // 1st column true - we can make sum 0
    // 1 row except (0,0) false - can't make sum

    for(int i=1; i<=n; ++i){
        for(int j=1; j<=sum; ++j){
            if(a[i-1]<=j){
                dp[i][j] = dp[i-1][j] || dp[i-1][j-a[i-1]];
            }
            else{
                dp[i][j] = dp[i-1][j];
            }
        }
    }


    if(dp[n][sum])
        "yes possible"
    else
        "not possible"
```

#### 3. count of subset sum

- Only chane || to + in subset sum

```c++
    //n = size of arr 

    int dp[n+1][sum+1];

    
    //  1 0 0 0 0 0 0 0
    //  1
    //  1
    //  1
    //  1
    //  1

    // 1st column 1 - we can make sum 0
    // 1 row except (0,0) 0- can't make sum

    for(int i=1; i<=n; ++i){
        for(int j=1; j<=sum; ++j){
            if(a[i-1]<=j){
                dp[i][j] = dp[i-1][j] + dp[i-1][j-a[i-1]];
            }
            else{
                dp[i][j] = dp[i-1][j];
            }
        }
    }

    cout << dp[n][sum];

```

#### 4. minimum subset sum diff

- Minimize `abs(s2-s1)`
- Minimize `abs(range - 2*s1)`
- Maximize `s1` so that `abs(range-2*s1)` is minimum

- we find s1 in last row of `dp[n][sum]`
- finding the max `s1` in last row of dp matrix

- **Quick trick** : to find max `s1` we can start from sum/2 and move to 0 and find the first `true` in dp matrix's last row. That will be the max `s1` to exist

- **remember** : `s1` needs to be maximised if you are taking s1 in first half s2 can automatically be found. so either maximise s1 or s2 it does not matter we just need to subtract that max from `range`. This max we can search in either half that's why we are finding in sum/2 only.


```c++
    // Calculate sum of all elements
    int sum = 0;
    for (int i = 0; i < n; i++)
        sum += arr[i];

    
    //=====================

    dp(Normal subset sum);

    //======================

    int diff = INT_MAX;

    // Find the largest j such that dp[n][j]
    // is true where j loops from sum/2 t0 0
    for (int j=sum/2; j>=0; j--){
        if (dp[n][j]){
            diff = sum-2*j;
            break;
        }
    }

    cout << diff;
```

#### 5. no. of subset with given diff

    s1 - s2 = diff
    s1 + s2 = sum
    =============
    2*s1 = diff + sum

    s1 = (diff + sum)/2

- we can find `diff` only when s1 is above 
- we need to find out number of subsets which sums up to `s1`
- to find that we count how many subsets are there which sums up to `s1`

```c++

    // Calculate sum of all elements
    int sum = 0;
    for (int i = 0; i < n; i++)
        sum += arr[i];

    
    int s1 = (sum + diff)/2;

    dp[n+1][s1+1];

    //=====================

    dp(Normal count of subset sum);

    //======================


    cout << dp[n][s1];

```

#### 6. target sum

- **Problem** assign `+ / -` to each element in array to make sum = s

- **ans**  this is same as subset with differencd D
answer reduces to finding 2 subsets whose difference is D


***
## Unbounded Knapsack

When we include an item in our knapsack we again check if we can include it or not.

- Rod cutting
- Coin change (Max ways)
- Coin change (Min coins)


#### 1. Rod cutting
- **PROBLEM :** given rode of length `L` we can cut it in segments of a=[...] with price of each segment p=[...]. Find maximum price

- this is same a unbounded knapsack

```c++
    int dp[n+1][L+1];

    // --> length

    // 0 0 0 0 0 0 0 
    // 0
    // 0
    // 0
    // 0
    // 0

    // dp[0][i] = 0  if length = anything but cost = 0 so max profit = 0
    
    // dp[i][0] = 0  if length = 0 we cant cut rod = 0

    for(int i=1; i<=n; ++i){
        for(int j=1; j<=L; ++j){
            if(a[i-1] <= j)
                dp[i][j] = max(dp[i][j-a[i-1]] + p[i-1] , dp[i-1][j]);
            else
                dp[i][j] = dp[i-1][j];
        }
    }

    cout << dp[n][L];

```

#### 2. coin change (max ways)    

- **PROBLEM :** Given coins array `c = [ ... ]` we need to find total number of ways to make change for `sum S`. 
- coins can be repeated
- This is similar to count of subset with given sum but just that we can take one item more than once

```c++
    int dp[n+1][S+1];

    // --> length

    // 1 0 0 0 0 0 0 
    // 1
    // 1
    // 1
    // 1
    // 1

    // dp[0][i] = 0 There are 0 ways to make sum greater than 0 using 0 coins
    
    // dp[i][0] = 1 there is always one way to make sum 0 i.e to use no coins 

    for(int i=1; i<=n; ++i){
        for(int j=1; j<=S; ++j){
            if(c[i-1] <= j)
                dp[i][j] = dp[i][j-c[i-1]] + dp[i-1][j]);
            else
                dp[i][j] = dp[i-1][j];
        }
    }

    cout << dp[n][S];
```

#### 3. Coin change (min coins)

- **PROBLEM :**  Given a sum find minimum number of coins that make that sum.
- coins can be repeated

- use inf ans infinity but dont use full INT_MAX bcz it can cause overflow issues

- we also need to initialize 2nd row int this


```c++
    int dp[n+1][S+1];

    // --> length

    // inf  inf  inf  inf  inf 
    // 0    inf  1    inf  2 ..
    // 0
    // 0
    // 0
    // 0

    //dp[0][i] = inf  min. coins to make sum >= 0 when there are no coins is infinite

    //dp[i][0] = 0  min coins to make sum 0 = 0 dont use any coins at all.

    //dp[1][i] = inf if we can make sum j using only fisrst coin.
    //dp[1][i] = j/c[0] no. of coins req. to make sum j using 1st coin only.
    //we are doing this because we cannot take normal knapsack here.

    for(int i=2; i<=n; ++i){
        for(int j=1; j<=S; ++j){
            if(c[i-1] <= j)
                dp[i][j] = min(dp[i][j-c[i-1]]+1, dp[i-1][j]) //+1 means we are including 
            else
                dp[i][j] = dp[i-1][j];
        }
    }
    cout << dp[n][S];
```


***
## LCS


### Longes common subsequence

- Given two strings of length n and m find longest common subsequence

```c++
    int dp[n+1][m+1];

    // 0 0 0 0 0 0
    // 0
    // 0
    // 0
    // 0
     
    // if one of strings is empty the LCS will be 0
    // if(i==0 || j == 0) dp[i][j] = 0;

    for(int i=1; i<=n; ++i){
        for(int j=1; j<=m; ++j){
            if(s1[i-1] == s2[j-1])          // if last char. is same include in lcs and delete that char
                dp[i][j] = 1 + dp[i-1][j-1];
            
            else
                dp[i][j] = max(dp[i-1][j], dp[i][j-1]);     // if last char not same delete one char from each one by one and check for each
        }
    }

```


***
## LIS (Longest Increasing Subsequence)

### General LIS
- [important](http://lightoj.com/article_show.php?article=1000&language=english&type=pdf)
- O(n^2) but there is a faster method using O(n*log(n))
- start from each index initally lis is 1
- for every index check every index befor it whose lis can be increased
- <= because we can increase if lis be increased if it is equal or less
    d[i] = max(d[i], d[j] + 1); is also possible

1. #### moving back (n^2)

```c++
    vector<int> lis(n);
    lis[0] = 1;    
  
    for (int i=1; i<n; i++) { 

        lis[i] = 1;     //initially LIS for each index is 1

        for (int j = 0; j < i; j++ )            // check from beg. whose lis we can increase
            if ( arr[i] > arr[j] && lis[i] <= lis[j])  // if lis can be increased inc by 1
                lis[i] = lis[j] + 1;  
                //d[i] = max(d[i], d[j] + 1);
    } 
  
    // Return maximum value in lis[] 
    int ans = *max_element(all(lis)); 

```

1. #### moving forward (easy n^2)

```c++
    vector<int> lis(n, 1);
  
    for (int i=0; i<n; i++) { 
        for (int j = i+1; j < i; j++ )            // check from beg. whose lis we can increase
            if(a[j] > a[i] && lis[j] <= lis[i]){
                lis[j] = lis[i]+1;
            }
    } 
  
    int ans = *max_element(all(lis)); 
```


1. #### nLog(n) approach

```c++
    vector<int> ans;

    for(int i=0; i<n; ++i){
        int p = lower_bound(all(ans), a[i])-ans.begin();        // find ans
            ans[p] = a[i];
        else                    // else push in ans
            ans.push_back(a[i]);
    }

    cout << ans.size();     // returns lis
```

### Longest non-decreasing substring/subarray

- Increase dp only if element is increasing else reset it to 1

```c++
    vector<int> dp(n, 1);   // initially all have 1 inc. subarray

    for(int i=1; i<n; ++i){
        if(a[i] >= a[i-1])
            dp[i] = 1+dp[i-1];
    }

    cout << *max_element(all(dp));
```

***
### Kadane's Algorithm (Maximum subarray sum)

- If array consist of all (+)ve integers max. subarray is whole array
- check for each index till this point:
    - can we include this element in current max subarray sum if yes include it
    - if not reset subarray sum to that element ans start new search
- initialize dp[0] = a[0] when you want to select atleast one subarray

```c++
    vector<int> a(n);
    int dp[n];
    ll sum = 0;

    dp[0] = a[0];

    for(int i=1; i<n; ++i){
        dp[i] = max(a[i], a[i]+dp[i-1]);        // include with prev. or leave it and start new
    }

    ll ans = *max_element(all(dp));     // gives max sub. sum
```

***
### Max length subarray if you delete atmax 1 element

```c++
    const int sz=200000;
    vector<vector<int> > dp(sz, vector<int> (2));

    int main(){
        int n;
        cin >> n;
        vector<int> a(n);
        for(int i=0; i<n; ++i){
            cin >> a[i];
        }

        dp[0][0] = dp[0][1] = dp[1][0] = dp[1][1] = 1;
        if(a[1]>a[0])
            dp[1][0] = 2;
        
        for(int i=2; i<n; ++i){
            if(a[i]>a[i-2]){
                dp[i][1] = max(dp[i][1], dp[i-2][0]+1);
            }

            if(a[i]>a[i-1]){
                dp[i][0] = max(dp[i][0], dp[i-1][0]+1);
                dp[i][1] = max(dp[i][1], dp[i-1][1]+1);
            }
            else{
                dp[i][0] = max(dp[i][0], 1);
                dp[i][1] = max(dp[i][1], 1);
            }
        }

        int ans = 0;
        for(int i=0; i<n; ++i){
            ans = max(ans, dp[i][0]);
            ans = max(ans, dp[i][1]);
        }
        cout << ans;
    }

```
