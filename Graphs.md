***
### Topological sorting (Kahn's algo)
T.C : O(v + e)
S.C : O(v)


- Compute in-degree for each of the vertex 
- Pick all the vertices with in-degree as 0 and add them into a queue 
- Remove a vertex from the queue (Dequeue operation) and then. 
    - Increment count of visited nodes by 1.
    - Decrease in-degree by 1 for all its neighbouring nodes.
    - If in-degree of a neighbouring nodes is reduced to zero, then add it to the queue.

- If count of visited nodes is not equal to the number of nodes in the graph 
    then the topological sort is not possible for the given graph.

```c++
	vector<int> adj[n+1];
	vector<int> ind(n+1);

	for(int i=1; i<=n; ++i){ //calcualte indegree of every node
		for(auto x:adj[i])
			ind[x]++;
	}

	queue<int> q;

	for(int i=1; i<=n; ++i){ //push all nodes with indegree 0 in queue bcz they are starting nodes
		if(ind[i] == 0)
			q.push(i);
	}

	vector<int> toporder;

	while(!q.empty()){
		int node = q.front();
		q.pop();
        toporder.push_back(node);

		for(auto x : adj[node]){    //if we are visiting this node then reduce indegree of every child by 1
			ind[x]--;

			if(ind[x] == 0)     //if at some point indegree becomes 0 that means now we can process it so push in queue
				q.push(x);
		}
	}


    if(topsort.size() == n)
        return topsort;
    else
        // topsort not possible

```




***
### Parallel BFS
- when you want to sum bfs from many nodes
- you can run parallel bfs from many nodes at once if you want nearest something
- just push all starting nodes in queue first

```c++
	queue<pair<int, int> > q;

	for(int i=0; i<n; ++i){
		for(int j=0; j<m; ++j){
			if(a[i][j] == 0){
				q.push({i,j});
			}
		}
	}
```



***
### Shortest path from source to all nodes in undirected graph
- use BFS from source and visit all vertex
- maintain a distance array that tracks dist. of each node from src node



***
### check for a root node in directed graph
	simply check if a node has indegree 0



***
### color tree in 2 colors but if two nodes have same color then dist between them should be even (https://atcoder.jp/contests/abc126/tasks/abc126_d)
	just color first node ans 1 and then if dist. between any node and this node is even color it the same as 1
	use dfs (int i, int sum)


void dfs(ll i, ll sum){
	vis[i] = true;

	if(sum & 1) color[i] = 0;
	else color[i] = 1;

	for(auto x:a[i]){
		if(!vis[x.first])
			dfs(x.first, sum + x.second);
	}
}






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



	//to visit all nodes
	for(int i=1; i<=n; ++i)
		if(vis[i] != 2)
			dfs(i);
```



***
### BFS
- used to find shortest path in unweighted graph
- shortest path can also be used like recursive dfs with depth like backtracking

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

    void dfs(int i){ //need to make sure starting node is not visited
        vis[i] = true;
        for(auto x:a[i]){
            if(!vis[x])
                dfs(x);
        }
    }
```

- other way
```c++
    const int sz = (int)2e5+10;
    vector<int> a[sz];
    vector<bool> vis(sz, false);

    void dfs(int i){
		if(vis[i] == true)
			return;

        vis[i] = true;
        for(auto x:a[i])
			dfs(x);
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
	bool cycle = false;

    void dfs(int i, int par){
		if(vis[i] == true){
			cycle = true;
			return;
		}

        vis[i] = 1;
        for(auto x : a[i]){
			if(x == par) //don't visit the parent 
				continue;
			
			dfs(x, i); //pass current node as par to other nodes
        }
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