***
### std::erase(iterator + x) to delete from vector or string in O(N) time


***
### Last digit repeat in cycles of 4 in a^b
ex: n=3
	3
	9
	27
	81

	343
	...

***
### AND
	whenever we have to minimise and& we take more ands bcz and doesnot increase when taken with others
	oppsite with OR (|)
***
### check for perfect square

	ll sr = sqrt(c);
	if(sr*sr == c){
		ans += c;

***
### sometimes to save sapace for array we can use 1st row/col of a matrix


***
### We can use counting sort in string & limited size arrays in O(n)


***
### Precompute XOR array

N = 0: 0, 0             N = 1: 1, 1             N = 2: 3, 3
N = 3: 0, 0             N = 4: 4, 4             N = 5: 1, 1
N = 6: 7, 7             N = 7: 0, 0             N = 8: 8, 8
N = 9: 1, 1             N = 10: 11, 11          N = 11: 0, 0
N = 12: 12, 12          N = 13: 1, 1            N = 14: 15, 15
N = 15: 0, 0            N = 16: 16, 16          N = 17: 1, 1
N = 18: 19, 19          N = 19: 0, 0            N = 20: 20, 20
N = 21: 1, 1            N = 22: 23, 23          N = 23: 0, 0
N = 24: 24, 24          N = 25: 1, 1            N = 26: 27, 27
N = 27: 0, 0            N = 28: 28, 28          N = 29: 1, 1
N = 30: 31, 31          N = 31: 0, 0            N = 32: 32, 32
N = 33: 1, 1            N = 34: 35, 35          N = 35: 0, 0
N = 36: 36, 36          N = 37: 1, 1            N = 38: 39, 39
N = 39: 0, 0            N = 40: 40, 40          N = 41: 1, 1
N = 42: 43, 43          N = 43: 0, 0            N = 44: 44, 44
N = 45: 1, 1            N = 46: 47, 47          N = 47: 0, 0
N = 48: 48, 48          N = 49: 1, 1            N = 50: 51, 51

```c++
	Also there is a formula for prefix xors `0 ^ 1 ^ .... ^ k`

	int xorUpToK(int k) {
		switch (k % 4) {
			case 0: return k;
			case 1: return 1;
			case 2: return k + 1;
			case 3: return 0;
		}
	}
```


***
### Bob and subarray (https://www.hackerrank.com/contests/codeagon/challenges/bob-and-subarray-or/problem)

here we move from bit to bit and we check how much a single bit is contributing




***
### __builtin_popcount() = int
### __builtin_popcountll() = long long


***
### Sometimes you should just consider all small possible answers


***
### push_back() and pop_back() are allowed in strings


***
### unique 
	removes adjacent duplicate elements
	return pointer to first non replaced element then we need to resize array according to that
	1 1 1 1 2 2 3 4 2 2
	1 2 3 4 2

	auto ip = unique(a.begin(), a.end());
	a.resize(distance(a.begin(), ip));


***
### +1 if condition satisfied -1 if not 


***
### Job / Activity selection (greedy)
- first sort according to second element(earliest ending job)
- first job is always selected
- move from job 1 to n and if start time of that job is greater than our ending time of prev job then take that job


```c++
	bool cmp(pair<ll, ll> &a, pair<ll, ll> &b){
		if(a.second == b.second) return a.first < b.first;
		return a.second < b.second;
	}


	sort(a.begin(), a.end(), cmp);
	int ans = 1, curr_job=0;
	for(int j=1; j<n; ++j){
		if(a[j].first >= a[curr_job].second){
			++ans;
			curr_job = j;
		}
	}

	cout << ans; //total jobs we can perform
```


***
### Comparator functin (https://www.youtube.com/watch?v=3pvZhwp0U9w)


***
### Its always better to compute prefix rather than suffix 

***
### Partition algo
```c++
	int partition(int lo, int hi, int pi){
		int idx = lo;

		for(int i=lo; i<=hi; ++i){
			if(a[i]] < a[pi]){
				swap(a[idx], a[i]);
				idx++;
			}
		}

		//finally swap pi(partition index)
		swap(a[idx], a[hi]);

		return idx;
	}
```


***
### no. of subarray sum = k (works for -ve too)

if in array only +ve no. (n>0) are there we can do it with 2 pointers
ex [1, 2, 3, 4, 5, 6]
	L  R
	L will move to decrease sumk
	R will move to increase sum 
	if we reach sum we increase both

```c++
    int subarraySum(vector<int>& nums, int k) {
		int n = nums.size();

		int pref = 0, ans=0;
		unordered_map<int, int> m;
		m[pref]++;  //if [0..a[i]] is sum = k then we need to have one 0 in map

		for(int i=0; i<n; ++i){
			pref += nums[i];
			ans += m[pref-k];
			m[pref]++;
		}

		return ans;
    }
```

***
In-Place sorting : without using extra space.

***
### about games (Mostly DP)
	This is natural in games with scoring: we want to know what the value of each position of the game is.


***
### imp 2^k
	2^2 + 2^2 = 2^4 (L==M)
	2^2 + 2^3 != 2^x (L != M)


	if 2^L + 2^M 
	then if L = M means 2^L + 2^M = 2^x
	but if L != M means 2^L + 2^M != 2^x


***
### Convert string to ll 
	//atoll convert c type string to ll 
	// c_str() to convert c++ string to c string

	long long nn = atoll(string.c_str());

***
### Sort by length first

bool compareLen(const std::string& a, const std::string& b){
    return (a.size() < b.size()); 
} 


***
### If a/k and b/k then (a-b)/k

***
### Bitmasking
use bitmasking when you have to simulate delete some elements / make subsets

***
### Prime factors 
```c++
    vector<pair<ll, ll> > factor(ll n){
        vector<pair<ll, ll> > a;
        for(ll i=2; i*i <= n; ++i){
            if(n%i==0){
                ll t=0;
                while(n%i == 0)
                    n/=i, ++t;
                a.push_back({i, t});
            }
        }
        if(n>1) a.push_back({n, 1});

        return a;
    }
```
***
### Next least integer using lower_bound
```c++
    lower_bound(a.rbegin(), a.rend(), x, greater<int> ());
```

***
### observe
    sometimes ans is in binary representation like no. of set bits

***
### how to divide into segments
```c++
    ll s=0, ans=0;
    for(int i=0; i<n; ++i){
        ++s;
        if(s*a[i] >=x){         //if this seg. is complete start a new segment
            ++ans;
            s=0;
        }
    }
    cout << ans << endl;
```

***
### Number of pairs whose sum is greater than 0 (sum > 0)
- always use binary search (lower_bound)
- when will an index start forming + numbers --> -a[i]+1
- if 2 numbers sum is >0 then atleast one will be >0

```c++
    sort(all(a));
    ll ans=0;

    for(int i=0; i<n; ++i){
        if(a[i]<=0)             //skip -ve and 0
            continue;
        
        ll p = lower_bound(all(a), -a[i]+1)-a.begin();  
        ans += i-p;
    }
    cout << ans;
```


***
### facts about prime fac
- prime fac. can be divided into 2 numbers p1*p2 where p1 is prime 
- prime fac. contains only 2^x as even term rest all are odd
- in prime fac. if we divide by all odd factors it becomes 2^x


***
## subarray with sum <= t

```c++
    for(int i=0; i<n; ++i)
        cin >> a[i];
    ll sum = 0;
    ll ans = 0, cnt=0;

    for(int i=0; i<n; ++i){
        if(sum + a[i] <= t){
            sum += a[i];
            ++cnt;
        }
        else{
            sum = sum - a[i-cnt]+a[i];
        }
        ans = max(ans, cnt);
    }
    cout << ans;
```

***
### IMP GCD
    g = gcd(a, b)
    If a is multiple of G and b is multiple of G then |a-b| is also multiple of g

***
### prime factor 
    If two things are divisible they must be in same prime factor form.
    ex = a/b .  then prime fac. .  then prime fac. of b must be of form of a and each power has to be less of b must be of form of a and each power has to be less

***
### factorial 

**𝑛! ends with 0 for any 𝑛>4.**

***
### nUmber mod
    If (a1 + a2 )%k==0 then
    a1%k + a2%k  = k

    i.e if (a1 + a2) is divisible by k then sum of their mods will sum up to k


***
### LCM
- LCM grows exponentially
- If n is divisible by all (1...k) means n is divisible by lcm(1, 2...k)


***
### nCr
Read this [cp-algorthms](https://cp-algorithms.com/combinatorics/binomial-coefficients.html)


***
## DSU
Learned from codeNcode [here](https://youtu.be/0Ol6hjzh6NA?list=PL2q4fbVm1Ik4JdzE2Bv_UUGBz0TXEIrai)
**Optimization techniques**
1. Path compression -> improves find(parent) from o(n) to o(logn)
2. Union by rank -> impoves union of sets



### Basic Dsu without optimization
only parent array is needed which stores where the parent is.

    index : 1 2 3 4 5 6 7 
    parent: 2 2 3 1 4 2 2       <-  parent of 1,2,6,7 is 2 

```c++
    int n;
    vector<int> parent(n);
    for(int i=0; i<n; i++)      //boilerplate initialization
        parent[i] = i;

    void join(int a, int b){        // join two sets
        a = find(a);
        b = find(b);
        parent[a] = b;          

        //shorter
        // parent[find(b)] = find(a);  
    }

    int find(int a){            //find parent of set
        if(a == parent[a])
            return a;
        else
            return find(parent[a]); //go to its parent
    }

    bool check(int a, int b){           // check if both ele. belong to same set
        return find(a) == find(b); 
    }

```

### Path compression

compress path so that child points directly to parent. 

```c++
    find(a){
        if(parent[a] < 0)   // generally representative's parent is -ve
            return a;
        
        int x = find(parent[a]);
        parent[a] = x;
        return x;

        // shorter
        //return parent[a] = find(parent[a]);

        //even shorter
        // return a == parent[a] ? a : parent[a] = find(parent[a]);  
    }
```

***
***
### Upper bound 
gives next strictly greatest element 

```c++
    upper_bound(all(a), x);
```


***
### Iterating a vector of tuple
- get elements of tuple using : `get<0>(tuple[i])`

```c++
    for(int i=0; i<(int)fans.size(); ++i)
            cout << get<0>(fans[i]) << " " << get<1>(fans[i]) << " " << get<2>(fans[i]) << endl;
    }
```

***
### Shifts
    First of all, a left cyclic shift is the same as 𝑛−1 right cyclic shifts and vice versa


***
### To clear set and add something    
```c++
    set<int> s{2,4,45}  //insert like this
    s = {3,4}           //clear the set and insert this
```


***
### check in how many moves you can make number ex. (1,2,5)

```c++
    // n = number you want to make by using 1, 2, 5 repetidly
    ans += (n/5) + (n%5)/2 + (n%5%2);
```
***

### Balance string : max. substring such that no. of zero = no. of ones

Let cnt0(i) be the number of zeroes and cnt1(i) — the number of ones on prefix of length i; also let balance(i) = cnt0(i) - cnt1(i) (i ≥ 0). The interesting property of balance is that the **substring [x, y] is balanced iff balance(y) = balance(x - 1).** That leads to a solution: for each value of balance maintain the minimum i where this balance is obtained (let it be called minIndex), and for each index i in the string update answer with i - minIndex(balance(i)).
***

### Properties of coprime numbers
- 1 is co-prime with every number.
- Any two prime numbers are co-prime to each other: As every prime number has only two factors 1 and the number itself, the only common factor of two prime numbers will be 1. For example, 2 and 3 are two prime numbers. Factors of 2 are 1, 2, and factors of 3 are 1, 3. The only common factor is 1 and hence they are co-prime.
- **imp** Any two successive numbers/ integers are always co-prime: Take any consecutive numbers such as 2, 3, or 3, 4 or 5, 6, and so on; they have 1 as their HCF.
- The sum of any two co-prime numbers are always co-prime with their product: 2 and 3 are co-prime and have 5 as their sum (2+3) and 6 as the product (2×3). Hence, 5 and 6 are co-prime to each other.
- Two even numbers can never form a coprime pair as all the even numbers have a common factor as 2.
- If two numbers have their unit digits as 0 and 5, then they are not coprime to each other. For example 10 and 15 are not coprime since their HCF is 5 (or divisible by 5).

***
***
## BITMASKING TRICKS

### To flip bits and find number

1. Builtin ~ operator
```c++
    return (unsigned)(~x); //unsigned so that no. will be +
```

2. Xor with number also returns flipped bits
```c++
    ll z = (1LL << 32)-1;  // make all 1 (32 is the length of no. we want)

    
```

### Relation between sum, xor, and
```c++
    sum(a, b) = xor(a, b) + 2 * and(a, b)   // solve like normal maths eqn
```

### Remove last set bit 
```c++
    n & (n-1)
```

### get last/rightmost set bit 
& the number with its 2's complement 

```c++
	x & -x
	// or
	x & (~x + 1)

	//finally ans
	ans &= -ans;
```



### Find max. set Bit
```c++
    int k = (int)(log2(n) + 1);  // +1 because it will give exact bit position of set bit 
    // ex - in 18, without 1 will give 3 but with 1 will give 4 which is position of set bit
```

### Calculating Max Xor pair between L and R

To maximize A xor B, we want A and B to differ as much as possible at every bit index.

We first find the most significant bit that we can force to differ by looking at L and R.

For all of the lesser significant bits in A and B, we can always ensure that they differ and still have L <= A <= B <= R.

Our final answer will be the number represented by all 1s starting from the most significant bit that differs between A and B

**steps**
- Find A ^ B    
- Find msb position in A ^ B  ie log2(a^b)+1
- power of 2 it and subtract 1 to get ans    
- subtract 1 bcs `1111` are always 2^n-1

***
### Count total no. of xor pairs in array

**imp : `a[i] ^ a[j] = x`  happens if `a[i] ^ x = a[j]`**

- we will use map to store result and for every i we find how many j are there
- overall o(n)

- find all pairs then `ans/2` if `i<j` is there

***
***
**imp**
### Testing if we can select subset of [1,2,3,....x] totalling N

**it is always possible if sum of 1..x is N or above**
- let Y be number such that it is barely above N
    (1...Y-1) < N < (1...Y)

- Now (1...y) and N differs less than Y
    0 < (1...Y)-N < Y

- we can select atmost 1 integer from 1...Y and remove it to make sum N

***
### We can iterate a set using iterators

***
### Find something exist in a map

```c++
    if(m.find(x) != m.end()){
        //found
    }
```

If you want to find a key that does not exist in another map

```c++
    for(auto x:m1)
        if(m2.find(x.first) == m2.end())
            ans = x.first;      //this key will not be present in m2
```


***
### For input ouptup in files use : 

```c++
    freopen("input.txt", "rt", stdin);
    freopen("output.txt", "wt", stdout);
```

***
#### Pro tip:  sieve always works for precomputation
#### Sieve can be used for 10^9 using bool array 
    i.e we can use bool[100000000] in global

#### To save time in sieve
```c++
    for(int i=4; i<=sz; i+=2)
        mark[i] = false;
```

***
### LCM always exits


***
### properties of first n natural numbers

first N natural numbers can be divided into 2 groups such that their sum is 0 or 1

***
### solve a^b mod (p)

this can be solve using euler phi function replace every b by `b mod phi(p)`
`only when a is coprime with p`

[like this div2 B](https://codeforces.com/blog/entry/13336)

***
### check if number is divisible by 4
    we just need to check if last 2 digits are divisible

***
### Display conseccutive characters like this

```c++
    cout << "YES\n" << s[i] << s[j] << s[k]
```

not like `cout << s[i]+s[j]+s[k]` this adds them

***
## GCD archives

-    Gcd of numbers remain same if larger number is replaced with diff b/w large and small

***
### Finding numerator and denominator from a decimal value

```c++
    void decimalToFraction(double number) 
    { 
        // Fetch integral value of the decimal 
        double intVal = floor(number); 
    
        // Fetch fractional part of the decimal 
        double fVal = number - intVal; 
    
        // Consider precision value to 
        // convert fractional part to 
        // integral equivalent 
        const long pVal = 1000000000; 
    
        // Calculate GCD of integral 
        // equivalent of fractional 
        // part and precision value 
        long long gcdVal = gcd(round(fVal * pVal), pVal); 
    
        // Calculate num and deno 
        long long num = round(fVal * pVal) / gcdVal; 
        long long deno = pVal / gcdVal; 
    
        // Print the fraction 
        cout << (intVal * deno) + num 
            << "/" << deno << endl; 
    } 

```



***

### Prime factors  (sqrt(n))

Can be done in log(n)

```c++
	vector<pair<int, long long>> val;
	for (long long i = 2; i * i <= n; ++i) {
		int cnt = 0;
		while (n % i == 0) {
			++cnt;
			n /= i;
		}
		if (cnt > 0) {
			val.push_back({cnt, i});
		}
	}
	if (n > 1) {
		val.push_back({1, n});
	}
```


***


### To flip states of a number every time we loop through it

```c++

    int p = 0;      // initial value

    while(1){
        p = 1-p;    //change
    }

```
    
**OR**

```c++

    int x = 0;
    (x == 0) ? +1 : -1;

```


***



### Check for power of 2

if x is isPowerOfTwo then it has only one 1 in its binary form
and x-1 will have all 1's right of the zero
so (x & x-1) will be zero if x isPowerOfTwo
            
```c++

    bool isPowerOfTwo(int x) 
    { 
        // First x in the below expression is 
        // for  the case when x is 0  
        
        return x && (!(x & (x - 1))); 
    } 
```


***



### Convert binary to int

```c++
    auto n = 100010101;
    cout << n;
```



***

### Stars and Bars technique

Used to find out how many solutions does this eqn `a+b+c = n` have

>ans-----------------

***


### Pseudo sieve

This prints increasing numbers where each number is not divisor of all its previous numbers.
This can be done with modified sieve.
If number has no divisors till now insert it into ans and mark all its multiple false.


```c++

    const int imax = 2000000;
    vector<bool> mark(imax, true);

    void sieve(int &n){
        vector<int> ans;
        mark[0]=false;
        mark[1]=false;

        for(int i=2; i*i<=imax; ++i){             //this is O(root n)
            if(mark[i]){
                ans.push_back(i);
                for(int j=i*i; j<=imax; j+=i){          //i+i for next
                    mark[j] = false;
                }
            }
        }

        for(int i=0; i<n; ++i)
            cout << ans[i] << " ";
    }

    int main(){
        int n;
        cin >> n;
        sieve(n);
    }

```

***



### Never forget this check in inner loop

```c++
    for(int i=2; i<n; ++i){
        int cnt=0;
        while(i<n && ...){        //never forget i<n check
            ...
        }
    }
```



***


### To take i closest to k
will not go above k

    int i=0, t=0; 
    while(i+t<k){
        i += t;
        t++;
    }




***


### To print array in increaing segments

-    we make map and print elements one by one and decrease count by -1 everytime
-    we Traverse until size of new array is n

```c++
    vector<int> a(1100), z;
    for(int i=0; i<n; ++i){
        int x;
        cin >> x;
        ++a[x];
    }

    while(z.size() < n){                //pushing in empty array if it occurs
        for(int i=0; i<1100; ++i){
            if(a[i])
                z.push_back(i), --a[i];
        }
    }
```




***


**Uppercase -> lowercase** `a[i] = a[i] | 32;`

**lowercase -> Uppercase** `a[i] = a[i] & ~32`
 
 **alter lower -> upper and upper lower** `a[i] = a[i] ^ ' '`





***

### FENWICK TREE

>   - declare size of bit (n) globally
>   - Ignore 0th element
>   - one based indexing
>   - no need to check for whether l-1 >= 0 or not
>   - only update and query functions
>   - when updating we move index forward till <= n  (+)
>   - when querying we move index back till > 0 not 0   (-)
>
>   -bit only adds or subtract in an element 

ex- to change 1st element to 10 you will have to add something to make it 10

```c++
        update(i, 10);              //this will not work to make it 10 it will icrease it by 10
        update(i, 10 - bit[i]);      //this will find how much to add to make it 10
```

```c++
    const int imax = 200009;
    int n, q;                   //declare n globally
    int bit[imax];

    void update(int i, int val){
        while(i <= n){
            bit[i] += val;
            i += (i&-i);
        }
    }

    int query(int i){
        int sum = 0;
        while(i > 0){
            sum += bit[i];
            i -= (i&-i);
        }
        return sum; 
    }


    int main(){
        cin >> n;
        vector<int> a(n);
        for(int i=0; i<n; ++i){
            cin >> a[i];
            update(i+1, a[i]);          //update every element
        }

        cout << query(n) << endl;
    }

```



***

### String can be made palindrom if max odd character are 1

```c++
    if(no. of odd occuring char <= 1)
        yes
    else
        no
```



***
### count total number of increasing segments in an array
you can chage > for increaing segments

```c++
    int c=0, s=0;
    for(int i=1; i<n; ++i){
        if(a[i] < a[i-1]){
            c++;
            s = i;
        }
    }

    cout << c+1;    //c+1 shows total increasing segments
    cout << c;      //c shows total points of change in increaing
    cout << s;      //s is first int of last increaing character

```



***

### Trimming array


if `a = [1, 1, 1, 1, 1, 2, 3, 4, 5, 5, 5, 5, 5]`
and we want l and r such that a becomes `a = [1,2,3,4,5]` i.e 
removing duplicate elements from fornt and back

we will make map and move until we have k unique elements
then we move again from start and start deleting front duplicate elements

```c++
    int l=0, r=0;
    
    for(r=0; r<n; ++r){         //for right 
        ++m[a[r]];
        if(m.size() == k)
            break;
    }

    for(l=0; l<n; ++l){         //for left 
        if(m[a[l]]==1){
            break;
        }
        --m[a[l]];
    }

    cout << l << r ;

```


***


### Fibonacchi numbers

```c++
    while(...){
        t = f+s;
        f = s;
        s = t;
    }
```


***


### To take input with spaces 

```c++
    stirng s;
    getline(cin, s);
```


**if you are inputing an int before string do put extra getline to cancel input**

```c++
    string s;
    int a; cin >> a;
    getline(cin , s);   //to cancel

    while(){
        getline(cin, s);
    }
```



***

### Matrix out of bounds check

To avoid checking for out of bound errors in matrices 
use 1 based indexing and [r+2, c+2];
that way you can go 1 out of bound
    

    ex:  if array is 3x3  you can take array as (3+2) x (5+2)
         then you wont have to check if for boundries



***


### Check if 2 numbers have same parity or not

`a^b` last digit will be 1 if they have diff parity and 0 if same
then we and with 1  
so if they have diff parity ans will be 1

```c++
    if ((a^b) & 1) {

        //diff pariry

    }

```

***

    You can convert n^3 to n^2 using simple logic in 3 variables
    find two by n^2 and check if third value is non negative



***

### find a+b = n and min(lcm(a,b))

    Short Solution: The two integers are 𝑘 and 𝑛−𝑘, where 𝑘 is the largest proper factor of 𝑛.

    we need to find largest factor of n i.e k then lcm will be n-k
    if it is prime then ans is 1 and n-1.

    We first claim that 𝐿𝐶𝑀(𝑘,𝑛−𝑘)=𝑛−𝑘<𝑛 if 𝑘∣𝑛, and
    we prove this as follows: if 𝑘∣𝑛, then there exists some integer 𝑚 such that 𝑚⋅𝑘=𝑛.
    The integer 𝑛−𝑘 can then be written as (𝑚−1)⋅𝑘, 
    which is a multiple of 𝑘. Thus, 𝐿𝐶𝑀(𝑘,𝑛−𝑘)=𝑛−𝑘 if 𝑘∣𝑛.


    
***

### Finding all factors in sqrt(n)

```c++
    vector<int> a;
    for(int i=1; i*i<=n; ++i){
        if(n%i==0){
            if(n/i==i)
                a.emplace_back(i);
            else{
                a.emplace_back(i);
                a.emplace_back(n/i);
            }
            
        }
    }
```

 
***

### n^2 to find three elements less than k that sums up to s

```c++
    int k, s;
    cin >> k >> s;
    int cnt=0;
    for(int i=0; i<=k; ++i){
        for(int j=0; j<=k; ++j){
            int z = s-i-j;          //find diff b/w s and z
            if(!(z<0 || z>k))       //z is negative if x+y > s and z>k if x+y is too small
                cnt++;
        }
    }
```


***


### To access element of map from end 

```c++
    auto mx=m.rbegin();
    mx++;               //++ because we are starting from end to front
    cout << endl << mx->first;
```


    
***
### To find modulus of negative number

Modulus of negative number is not defined in this shit c++

    (M+M+.....M + x)%M

or find next largest int and %M



*** 


### Number of numbers divisible between a and b by x

```c++
    f(n){
        n/x + 1 (n ≥ 0)     //+1 for 0
        0 (n = −1)          //check for when a-1 < 0
    }
```

ans is `f(b)-f(a-1)`


number of integers between [a, b] are b-a+1



***

### For finding how much we need to add in a number to make multiple of other

we want a as multiple of b
-   **If a < b**
    ```c++
        cout <<  b-a;    
        //when a<b  ex- 5 and 9 returns 4 bcz we need to add 4 in 5 to make 9
    ```

-   **if a > b**
    ```c++
        cout << b - (a%b); 
        // a%b return distance from next less divisible point
        // b-(a%b) returns diff between next greater and b

    ```
    **example -**

            9 and 7
            9%7 returns 2 means next less divible less than 9 which is 7 is dist 2
            7-(9%7) returns 7-2  ie 5 
            which is same as 14-9



***

### Sliding window -:

```c++
    double ans=0;
    for(int i=0; i<k; ++i)      //for 1st win.
        ans+=a[i];
    

    double csum=ans;
    for(int i=k; i<n; ++i){
        csum -= a[i-k];
        csum += a[i];

        ans = max(ans, csum);
    }

    cout << ans;
```


***

### Check if x exists in s  as a substring , return position

```c++
  if(s.find(x) != string::npos)
    cout << found
```


        
***

### Segmented sieve

```c++
    void segSieve(ll a, ll b){
        
        ll lim = sqrt(b);
        vector<bool> mark(lim+1, true);         //create mark array for normal sieve
        vector<ll> primes;
        for(ll i=2; i<=lim; ++i){
            if(mark[i]){
                primes.emplace_back(i);
                for(ll j=i*i; j<=lim; j+=i){
                    mark[j] = false;
                }
            }
        }

        vector<bool> isprime(b-a+1, true);      //create bool for seg sieve
            
        for(auto i:primes){
			ll firstMultiple = ceil(a*1.0 / i);   //get the first multiple of prime i closest to a

			for(int j = max(i*i, firstMultiple*i); j<=b; j+=i){
				isprime[j-a] = false;
			}
        }

        if(a == 1)                  //when a == 1;
            isprime[0] = false;

        for(ll i=a; i<=b; ++i){         //print seg. sieve
            if(isprime[i-a])
                cout << i << endl;
        }

    }
```


***

### Total ways to Select 3 from 5 elements 

```c++
    for(int i=0; i<5; ++i){
        for(int j=i+1; j<5; ++j){
            for(int k=j+1; k<5; ++k)
                ans += d[i]*d[j]*d[k];
        }
    }
    
    ll ans += d[i]*d[j]*d[k]     //will not return ll if all d[] are not ll

```

    
***

### To check for palindrome without strings hardcore way

Here we already know digit is a 5 digit number so we dont check middle element

```c++
    for(int i=a; i<=b; ++i){
        int k = i%10;           //last digit
        int l = i/10%10;        //second last 
        int m = i/1000%10;      //second 
        int n = i/10000%10;     //first

        if(k==n && l==m)
            ans++;
    }
```


***

### No. of divide operations to make even number 1 does not change if we mulitply by odd

```c++
    even * odd/2 ===  even/2 *odd
```


***


### Sorting using Second element in v<pair> , map

```c++
    bool comparison(const pair<int,int> &a,   const pair<int,int> &b){ 
        return a.second<b.second; 
    } 
```



***



### Reverse sorting 



```c++
    sort(a.begin(), a.end(), greater<int>())
```




***

### Traverse a container in reverse



```c++
    for (auto it = m.rbegin(); it != m.rend(); it++) { 
        cout << it->first << it->second;
    } 
```




***




>A rectangle can be cut into two equal parts by any line that passes through the center of the rectangle



***




### Creating a string 

```c++
    string(n, 'c');         //creates n c's
```




***




### std::rotate ( rotates an array to left or right )


    middle argument will come at first 
    n = rotation number

-    **default: rotate left**
```c++
        rotate(s.begin(), s.begin()+n, s.end());
```
    
-    **to rotate rigt:**
```c++
        rotate(s.begin(), s.begin()+s.size()-n, s.end());
```



    
***




### COmpute sum of digits of number from 1 to d

In general, we can compute sum(10^d – 1) using below formula

```c++
   sum(10^d - 1) = sum(10^d-1 - 1) * 10 + 45*(10^d-1) 
```

using recursion or DP





***




### Sum of digits of a number in one line

```c++
    for(sum=0; n>0; sum+=n%10, n/=10);
```


    
***




    In graph problems take abs. difference of coordinates
    next coordinate distance from current =  abs(x2 - x1)




***



    Modulus of an operator goes from 0 - MOD-1 and after that repeat itself
    from 0 - mod-1 every sequence will be different




***

## Fast Modular exponentiation

a^b so we only count active bits of b
next bit number is square of prev. number
refer cp-algorithms

```c++
    long long binpow(long long a, long long b, long long m) {
        a %= m; //optional if a>m
        long long res = 1;
        while (b > 0) {
            if (b & 1)
                res = res * a % m;
            a = a * a % m;
            b >>= 1;
        }
        return res;
    }
```

ex - 2^5 == 2^(101) == 2^4 * 2^1


***

### Compare N charecters of str1 with str2

    strncmp(str1, str2, N);
        == 0   if equal
        < 0    str1 < str2
        > 0    str1 > str2



***



### Process blocks in a matrix


```c++
    const int dx[] = {1,1,0,-1,-1,-1,0,+1};
    const int dy[] = {0,1,1,1,0,-1,-1,-1};
    
    for(int i=0; i<h; ++i){
        for(int j=0; j<w; ++j){
            for(int k=0; k<8; ++k){
                int nx = i+dx[k];
                int ny = j+dy[k];

                if(nx<0 || nx>=h || ny<0 || ny>=w)
                    continue;
                
                ###Process nearest blocks
            }
        }
    }
```

or just make matrix 2 rows and 2 col bigger that reduces complexity
(see above)


***

### Insert whole array in a set 

```c++
    set<char> s1(a.begin(), a.end());
```


*** 




### Increment an iterator


```c++
    advance(it, 2);
```





***



>Even × Even	Even	
>Even × Odd	Even	
>Odd × Even	Even	
>Odd × Odd	Odd	


>E + E = even
>O + O = even
>E + O  = odd
>O + E  = odd



***
### Take minimum of n numbers

```c++
    min({a, b, c, d, .....});
```

max similarly



***

### Check for element in set

```c++
    if(set.count(x)){
        //true if x exitst in set
    }
```




***
### Rounding up

In general, for positive integers x and y, 
rounding up `x/y` is implemented as **`(x + y − 1)/y`**

rounding up 2 ====>   **`(n + 1) / 2`**





***



## Generating subsets

```c++
    int main(){
        int n = 3;
        int a[] = {5, 8, 2};

        for(int i=0; i<1<<n; ++i){
            for(int j=0; j<n; ++j){
                if(i & (1LL << j) ){                   //use LL for overflows if i is long long
                
                    //process element of subset
                    cout << a[j] << " ";
                    
                }
            }
            cout << endl;
        }
    }
```



***

## Generating Permutaions

```c++
    do{
        //process permutaion
    }while(next_permutaion(a.begin(), a.end()));
```

>could use prev_permutaion
> start generation from current value and end at last
> **WARNING** : in order to generate all permutaions you need
            to start from least lex. ordered permutation




*** 
### lexicographical compare

```c++
    lexicograpic_compare(a.begin(), a.end(), b.begin(), b.end());
```

returns true if a is lexicograpically smaller than b


