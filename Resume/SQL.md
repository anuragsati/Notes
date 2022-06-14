# SQL

#### DBMS vs RDBMS
    DBMS can be any software that manages e.g. : file system, mySQL

    RDBMS is a type of DBMS that manages data in form of tables.
    e.g. : mySQL, postgreSQL etc.

#### Constraints

-   NOT NULL - Restricts NULL value 
-   CHECK - Verifies that all values in a field satisfy a condition.
-   DEFAULT - assigns a default value if no value has been specified
-   UNIQUE - Ensures unique values to be inserted into the field.
-   PRIMARY KEY - Uniquely identifies each record in a table.
-   FOREIGN KEY - referential integrity for a record in another table.
    refers to PK of other table.
    current table : child and reffered (other) table : parent

#### Primary key
used to uniquely identify a row

    not NULL (implicit)
    Unique
    one and only one for a table
    can be one column or multiple columns together

#### JOINS
[https://joins.spathon.com/]

**join makes `cartesian product` first and then subsets it to give us result**
mainly 4 types of joins but there are more e.g. cross, self

1. Inner Join or simply `Join`
    -   matching value in both tables e.g. if uid match in both tables they will be included in join

1. Left Join
    -   Left table has all rows while right table has only those rows which match.
    -   if something on left table has no match then corrosponding value is `NULL` in remaining columns

1. Right Join
    -   Right table has all rows while left table has only those rows which match.
    -   if something on right table has no match then corrosponding value is `NULL` in remaining columns

1. Outer Join
    -   gets all rows from both tables (matched put together)
    -   if something is missing puts `NULL` there


#### Union 
used to combine the result-set of two or more SELECT statements.
if we do union then it just puts rows of table2 under table1 

these select statements must be similar form (same col., same data type, same order)

by default it unions only unique rows
we can include duplicates as well using `union all`

**Intersect** : intersection (just like union but intersection)

#### Union vs Join
[https://stackoverflow.com/questions/905379/what-is-the-difference-between-join-and-union]

union just put rows after other rows
while join makes cartesian product first and then subsets it to give us result




#### ACID
A transaction is a single logical unit of work that accesses and possibly modifies the contents of a database. Transactions access data using read and write operations. 
In order to maintain consistency & validity in a database, before and after the transaction, certain properties are followed. These are called ACID properties. 

1. Atomicity : entire transaction takes place or nothing happens at all 
2. consistency : DB must be consistent before & after transaction. 
    i.e it should not be in faulty state before & after a transaction
    i.e no currupt data should be there
3. Isolation : multiple transaction occur independently & without interfering .
4. Durability : changes of successful transition should occur even if system fails.



#### sql vs nosql
sql is tables, nosql is everything non table (graph, JSON objects, key-value pairs)
sql has fixed schema, nosql have dynamic schema(can change)
query using sql, query using diff means




### Normalization
[https://www.youtube.com/playlist?list=PLLGlmW7jT-nTr1ory9o2MgsOmmx2w8FB3]

it is a technique to `minimize` data redundancy.
we cannot completely remove data redundancy.
this is done by separating data into different tables, one for common data.

**data redundancy :** it is repetition of data in rows.
    ex : repetition of hod name in student table (all rows have same data)

data redundancy lead to anomalies :
1. insert anomaly : we insert repetitive data each time (takes more time)
2. delete anomaly : if we delete all data then static information is lost 
    e.g. : if we delete all students then hod name will also be lost
3. update anomaly : if we need to update one static thing then that needs to be updated in all rows


good databases need to follow these normalization forms to reduce redundancy :


#### 1 NF
- columns must not have multivalues [imp]
- column names should be unique
- column should contain values of same type 

to solve : we repeat rows with diff values at multivalue 

### 2 NF
- should be 1NF
- No partial dependency should be there

dependency : like some col. depends on other columns like PK so we say col has dependency on PK

**partial dependency** : when some col(attribute) depends on part of PK
e.g. PK = (student id + student name) and teacher depends only on student name

to solve : break into diff tables


### 3 NF
- should be 2 NF
- No transitivie dependency

**transitivie dependency** : when some attribute(col) depends on other col that is not PK(prime attribute)

solution : to break into tables with which it depends on


