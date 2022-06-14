[https://www.interviewbit.com/rest-api-interview-questions/]

# REST

-   Representational State Transfer
-   REST is used to design web services 
-   can use websocket as well (different uses two way handshake model) while REST uses request response model
-   REST is stateless client-server architecture where client communicates with 
    server using CRUD requests to invoke web services.
    `Each webservice & resource is identified by URI`
    <br />

    **web service** : anything that a server does and returns to client.
        ex : calculating square of a number is a web service

```
-   REST is stateless, therefore the SERVER has no state (or session data)
    means server does not store state of client.
    server does not care about client state it only servers requsts given to it.
    client can sends sessionID if needed.
```

-   REST have a URL structure and a request/response pattern
    while in AJAX we simply make request and get response without changing URL.

-   disadvantages :
        Since it works on HTTP, there can’t be asynchronous calls.
        sessionID needs to be passes by client everytime to maintain sessions


### PUT Vs POST
    If there is already a file or resource at that URI, PUT changes that file or resource. If there is no resource or file there, PUT makes one

    POST sends data at URI then server will deal with it.
<br/>

    PUT is idempotent meaning, invoking it any number of times will not have an impact on resources.
    generally used for update.

    However, POST is not idempotent, meaning if you invoke POST multiple times it keeps creating more resources
    generally used for create.


### Status Codes
-   200 - OK, shows success.
-   400 - BAD REQUEST, e.g. validation error, missing data.
-   401 - FORBIDDEN, e.g., delete access without admin rights.
-   404 - NOT FOUND, states that method is not available.
-   500 - INTERNAL SERVER ERROR, states that server has thrown some exception while executing the method.


### Resource
    Every content in the REST architecture is considered a resource.
    They can either be represented as text files, HTML pages, images, or any other dynamic data.


### URI
    Uniform Resource Identifier
    The URI is case-insensitive 

    2 Types : URL and URN

    URL :
        protocol / domain / path

    URN :
        e.g. : urn:isbn:1234567890
    

### Messaging
    Request and response cycle is called messaging.

### REST API
we use REST API as means of implementation of REST.
-   JSON is standard way to send data as it is widely used 
        and many have inbuilt tools to parse JSON

-   response and request header should be set as `application/json`

-   While retrieving huge data, use filtering and pagination so that only some
    data is sent at a time


### SAFE Methods
Safe methods are those that do not change any resources internally. These methods can be cached and can be retrieved without any effects on the resource.

`only get is safe`

### IDEMPOTENT Methods
Even after calling single request multiple times, the outcome of the request should be the same. new resources are not created internally if we call N times.

GET, PUT, DELETE, HEAD, OPTIONS, and TRACE are the idempotent HTTP methods. because they don't create new resources if we call them N times.
` POST is not idempotent `


### HTTP REQUEST

1.  Method − Methods to use like GET, PUT, POST, DELETE etc. 
1.  URI − To uniquely identifying the resources on the server.
1.  HTTP Version − To indicate version of HTTP protocol you are using. e.g. HTTP v1.1.
1.  Request Header − Tells us details of the request metadata such as client type, the content format supported, message format, cache settings, etc.
1.  Request Body − represents the actual message content to be sent to the server.

### HTTP RESPONSE 

1.  Response Status Code
1.  HTTP Version − HTTP protocol version.
1.  Response Header − metadata of the response message. Data can describe what is the content length, content type, response date, what is server type, etc.
1.  Response Body − actual resource/message returned from the server.