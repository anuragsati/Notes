# GRAPHS    
***
### DFS

```c++

    const int sz = (int)2e5+10;
    vector<int> a[sz];
    vector<bool> vis(sz, false);

    void dfs(int i){
        vis[i] = true;
        for(auto x:a[i]){
            if(!vis[x])
                dfs(x);
        }
    }
```


*** 

### BFS



***



### count connected components : 

```c++
    int cnt=0;
    for(int i=0; i<n; ++i){
        if(!vis[i]){
            dfs(i);
            cnt++;
        }
    }
```


Graph with N nodes and K connected components will have atleast **`(N-K)`** edges.
