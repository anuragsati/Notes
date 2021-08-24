# GRAPHS    
***

***
### Level wise DFS
```c++
    void dfs(TreeNode* root, int lv, vector<int> &res){
        if(!root)   return;
        if(lv>=res.size()) res.push_back(root->val); //for every new level do something
        dfs(root->left,lv+1,res);
        dfs(root->right,lv+1,res);
    }

```
***
### Alternate BFS
```c++

	queue<TreeNode*> q;
	q.push(root);
	int level = -1; //initially no level

	while(!q.empty()){ //reaches here for new level  
		int sz = q.size();
		++level;  //increment before each level
		cout << "visiting level : " << level << endl; 

		while(sz){ //process all nodes in this level
			TreeNode* node = q.front();
			q.pop();


			if(node->left)
				q.push(node->left);
			if(node->right)
				q.push(node->right);

			sz--;
		}
	}
```
***
## Detech cycles in a DAG / directed graph
- comes in hady in topsort algo

```c++
    const int sz = (int)1e5;
    vector<int> g[sz];
    vector<int> vis(26);
    vector<int> ans;
    int cycle=0;

    void dfs(int v){
        vis[v] = 1;         //mark an in process

        for(auto x:g[v]){
            if(vis[x]==0)           //if not processed visit it
                dfs(x);
            else if(vis[x]==1)          // if encounterd a processed node means it has a cycle
                cycle = 1;
        }

        vis[v] = 2;             // mark as finished processing
    }
```


***
## Topological sorting (DAG)

```c++
    int n; // number of vertices
    vector<vector<int>> adj; // adjacency list of graph
    vector<bool> visited;
    vector<int> ans;

    void dfs(int v) {
        visited[v] = true;
        for (int u : adj[v]) {
            if (!visited[u])
                dfs(u);
        }
        ans.push_back(v);
    }

    void topological_sort() {
        visited.assign(n, false);
        ans.clear();
        for (int i = 0; i < n; ++i) {
            if (!visited[i])
                dfs(i);
        }
        reverse(ans.begin(), ans.end());
    }
```

***
## Dijkstra (complete with std::set)

```c++
    #include <bits/stdc++.h>
    using namespace std;

    #define ll long long
    #define ull unsigned long long 
    #define endl '\n'
    #define pii pair<int, int>
    #define all(a) a.begin(),a.end()

    template <typename T>
    inline T gcd(T a, T b) { while (b != 0) swap(b, a %= b); return a; }

    const int sz = 200000;
    const ll inf = 1e17;
    vector<pair<ll, ll> > a[sz];        // node -> (node, dist), ...
    vector<ll> dist(sz, inf);           // (distance of node)
    vector<ll> par(sz, -1);             //parent array to print path
    ll n, m;

    void dijkstra(int src){
        dist[src] = 0;              //source distance will always be zero
        par[src] = -1;              //parent of source is -1
        set<pair<ll, ll> > s;                 // (distance , node)
        s.insert({dist[src], src});

        while(!s.empty()){
            ll node = (s.begin()) -> second;        //get the active node in set
            s.erase(s.begin());

            for(auto x:a[node]){
                if(x.second + dist[node] < dist[x.first]){          //if dist. of neibour is greather than the dist of parent + weight then reduce that dist.
                    s.erase({dist[x.first], x.first});              // if that set exists exists update it
                    dist[x.first] = x.second+dist[node];
                    par[x.first] = node;                            // make node as parent of child
                    s.insert({dist[x.first], x.first});
                }
            }
        }

    }

    void printPath(ll j) { 
        if (par[j] == - 1) {
            cout << j << " ";
            return; 
        }
        printPath(par[j]); 
        cout << j << " ";
    } 

    int main(){
        cin >> n >> m;
        while(m--){
            ll x, y, w;
            cin >> x >> y >> w;
            a[x].push_back({y, w});
            a[y].push_back({x, w});
        }

        dijkstra(1);        // calling dijkstra from node 1

        if(dist[n] != inf)      //reachable
            printPath(n);
        else                    //not reachable
            cout << -1;
        
    }

```


***
### BFS
- used to find shortest path in unweighted graph

```c++
    const int sz = (int)2e5+10;
    vector<int> a[sz];
    vector<bool> vis(sz, false), d(sz);

    void bfs(int src){
        queue<int> q;
        q.push(src);
        vis[src] = true;
        d[src] = 0;
        //inital node's depth = 0

        while(!q.empty()){
            int v = q.front();
            q.pop();
            // do operation on elements

            for(auto x : a[v]){
                if(!vis[x]){
                    q.push(x);
                    vis[x] = true;
                    d[x] = d[v]+1; // increase depth with every level
                }
            }
        }
    }
```

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


***
### dfs in adjacency matrix (cycle detection)

```c++
    int n, m;
    char a[110][110];
    bool vis[110][110];
    int cycle = 0;

    bool dfs(int i, int j, int pi, int pj, char c){
        vis[i][j] = 1;

        if(a[i+1][j]==c){
            if(!(i+1 == pi && j==pj))
                if(vis[i+1][j]==1)
                    return 1;
                else
                    if(dfs(i+1, j, i, j, c))
                        return 1;
        }
        if(a[i-1][j]==c){
            if(!(i-1 == pi && j==pj))
                if(vis[i-1][j]==1)
                    return 1;
                else
                    if(dfs(i-1, j, i, j, c))
                        return 1;
        }
        if(a[i][j+1]==c){
            if(!(i == pi && j+1==pj))
                if(vis[i][j+1]==1)
                    return 1;
                else
                    if(dfs(i, j+1, i, j, c))
                        return 1;
        }
        if(a[i][j-1]==c){
            if(!(i == pi && j-1==pj))
                if(vis[i][j-1]==1)
                    return 1;
                else
                    if(dfs(i, j-1, i, j, c))
                        return 1;
        }

        return 0;
    }

    int main(){
        cin >> n >> m;
        for(int i=1; i<=n; ++i){
            for(int j=1; j<=m; ++j)
                cin >> a[i][j];
        }
        
        for(int i=1; i<=n; ++i){
            for(int j=1; j<=m; ++j){
                if(vis[i][j] == 0){
                    if(dfs(i, j, -1, -1, a[i][j])){
                        cout << "Yes";
                        return 0;
                    }
                }
            }
        }

        cout << "No";
    }

```

***
### Visiting all nodes with indegree 0 in order (https://codeforces.com/contest/999/problem/E)

```c++

	const int sz = 5020;
	int n, m, s;
	vector<int> adj[sz];
	vector<int> vis(sz, false);
	stack<int> st;

	void dfs(int i){
		vis[i] = true;

		for(auto x:adj[i]){
			if(!vis[x])
				dfs(x);
		}
	}

	void dfs2(int i){
		vis[i] = true;
		st.push(i);
		for(auto x:adj[i]){
			if(!vis[x])
				dfs(x);
		}
	}

	int main(){
		ios_base::sync_with_stdio(false);cin.tie(0);
		cin >> n >> m >> s;
		--s;

		for(int i=0; i<m; ++i){
			int u, v;
			cin >> u >> v;
			--u, --v;

			adj[u].push_back(v);
		}

		dfs(s);

		for(int i=0; i<n; ++i){
			if(!vis[i]){
				dfs2(i);
			}
		}


		fill(vis.begin(),vis.end(), false);

		int ans = 0;
		while(!st.empty()){
			int t = st.top();
			st.pop();

			if(!vis[t]){
				dfs(t);
				++ans;
			}
		}

		cout << ans;

		return 0;
	}
```