# Dynamic Programming

***

- 0/1 knapsack
    - subset sum
    - equal sum partition
    - count of subset sum
    - minimum subset sum diff
    - target sum
    - no. of subset with given diff
- Unbounded knapsack
- LCS
- LIS
- Kadane's
- Matrix chain multiplication
- Dp on trees
- Dp on grid


***

### 0/1 knapsack

####General knapsack

```c++
    int dp[n+1][w+1];

    for(...)
        //initialize

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
#### 2. equal sum partition
#### 3. count of subset sum
#### 4. minimum subset sum diff
#### 5. target sum
#### 6. no. of subset with given diff

​            


        (3)minimum partition
    
            // Calculate sum of all elements 
            int sum = 0; 
            for (int i = 0; i < n; i++) 
                sum += arr[i]; 
    
            bool dp[n+1][sum+1]; 
    
            // Initialize first column as true. 0 sum is possible 
            for (int i = 0; i <= n; i++) 
                dp[i][0] = true; 
    
            // Initialize top row, except dp[0][0], as false. With 
            // 0 elements, no other sum except 0 is possible 
            for (int i = 1; i <= sum; i++) 
                dp[0][i] = false; 
    
            for (int i=1; i<=n; i++) 
            { 
                for (int j=1; j<=sum; j++) 
                { 
                    // If i'th element is excluded 
                    dp[i][j] = dp[i-1][j]; 
    
                    // If i'th element is included 
                    if (arr[i-1] <= j) 
                        dp[i][j] |= dp[i-1][j-arr[i-1]]; 
                } 
            } 
    
            int diff = INT_MAX; 
            
            // Find the largest j such that dp[n][j] 
            // is true where j loops from sum/2 t0 0 
            for (int j=sum/2; j>=0; j--) 
            { 
                if (dp[n][j] == true) 
                { 
                    diff = sum-2*j; 
                    break; 
                } 
            } 
            return diff; 
