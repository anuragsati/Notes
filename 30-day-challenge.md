***
# Day 1

***
# Day 2

	- I can use pointers to divide array into segmnts. (by swapping and increasing M and L  & decreasing H)
	- 3 ponter method to divide into segments.
	- we can use 3 pointer technique if we can divide our array into 3 parts.
		00000 | 11111 | 22222
		L					H 
		M

		move middle till M<=h and do operations.

		i can separate values in 3 segments with this method.


*** 
# Day 3

	- to visit nodes whose indegree is 0 in order we use dfs1 dfs2 with a stack 

	- subarray sum = k (https://www.youtube.com/watch?v=20v8zSo2v18)
		- if we have only +ve numbers in array we can use 2 pointers
		- if -ve numbers are also present only way is though hashmap
	
	- we can transform many problems into subarray sum = k

	- to convert even = 0 and odd = 1 we use   `nums[i] = (nums[i]%2)`

	- The give away to a heap/priority queue question is whenever a question asks for k closest or k smallest or k largest.

	
	- default priority queue = Max heap type
	- priority_queue <..., ... , greater<int>> = Min heap

	- To make min heap or to use comparator function it needs to be at 3rd argument so 2nd argument we provide same as first but in vector
	- priority_queue<int, vector<int>> = max heap of integers
	- priority_queue<int, vector<int>, greater<int> > = min heap of integers
	- ex : priority_queue< pii, vector<pii>, greater<pii>> = min heap of pairs


*** 
# Day 4

	- some 3 pointer / 4 pointer problems can be solved by fixing one and moving other two (https://codeforces.com/problemset/problem/987/C)

	- If i have 2 possible choices to merge in a sting use dp
	- dp[i] = dp[i-1] (dont merget 2 ) + dp[i-2] (merge 2) .   (https://codeforces.com/problemset/problem/1245/C)


***
# Day 5

	- In modified binary search look for TTTTTFF or FFFFTT type arrays
	- generally in modified BS we compare elements with first / last or element before/after to make T/F array

	- Quickselect is a textbook algorthm typically used to solve the problems "find kth something":
		kth smallest,
		kth largest,
		kth most frequent,
		kth less frequent, etc.
	-It has O(N) average time complexity and widely used in practice. It worth to note that its worth case time complexity is O(N^2), although the probability of this worst-case is negligible.
	- Quickselect : (https://www.youtube.com/watch?v=fnbImb8lo88)


	- in 2 player game theory most of the times one tries to increases global ans and other tries to decrease global ans


