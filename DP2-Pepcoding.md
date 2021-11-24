# 5. Russian doll envelope
	if height and width is smaller only then we can fit it inside other envelopes
	so this is just like LIS
	first sort envelope according to height then apply LIS 
	LIS will give us max subsequence of strictly increasing envelopes


# 4. Maximum Non-overlapping Bridges  
	first sort top part in increasing order then apply LIS according to bottom part
	i.e pick an index and decide which index i can append this to

```c++
	vector<pair<int, int> > a(n);
	for(int i=0; i<n; ++i)
		cin >> a[i].first >> a[i].second;
	
	sort(a.begin(), a.end());

	vector<int> dp(n);
	dp[0] = 1;
	for(int i=1; i<n; ++i){
		dp[i] = 1;
		for(int j=0; j<i; ++j){
			if(a[j].second < a[i].second && dp[j] >= dp[i]){
				dp[i] = 1 + dp[j];
			}
		}
	}

	cout << *max_element(dp.begin(), dp.end());
```


# 3. Longest Bitonic sequenc
	Just like LIS but we create 2 arrays LIS, LDS
	then at every index ans = LIS[i]+LDS[i]-1;

# 2. Max sum Increasing sequence
	Just like LIS but is time we are looking for sum 

# 1. Longest increasing subsequence
	choose : current element ko mai kiske piche chipka skta hu