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
### Level of each node using dfs

```c++
    const int sz = (int)1e5+10;
    vector<int> level(sz);
    vector<int> a[sz];

    void dfs(int node, int len){
        level[node] = len;
        for(auto x : a[node]){
            if(level[x] == 0)       //if level has not been assigned yet
                dfs(x, len+1);
        }
    }

    dfs(1, 1)   // start with node 1 with level 1
```

*** 
### Find cycles in undirected graph using DFS

- If graph have back edge it contains a cycle.
- **back edge** : edge who is connected to its ancestor other than its parent.
- Run dfs on each node
    - If node is visited check if it is equal to its parent if not then it is cycle.
    - if not visited visit and now pass new parent.

Returns true if contains cycle

```c++
    const int sz = 200000;
    vector<int> a[sz];
    vector<int> vis(sz);

    bool dfs(int child, int par){
        vis[child] = 1;
        for(auto x:a[child]){
            if(!vis[x]){
                if(dfs(x,child))    // if dfs return true, return true
                    return true;
            }
            else if(x != par) // if node is vis. and it is not its parent
                return true;
        }
        return false;
    }

```


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
