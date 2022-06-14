[https://www.interviewbit.com/react-interview-questions/]

# React

-   Developed at Facebook
-   React itself is a library
-   used to design reusable and complex UI
-   follows component based approach


#### Features
-   **Virtual DOM** : similar to real DOM 
    -   updating / accessing real DOM is time consuming
    -   creating a new virtual DOM is faster
    -   real and virtual DOM are maintained in sync
    -   whenever something changes vanilla JS renders whole DOM again.
        React instead of rerendering whole DOM react creates new virtual DOM then compares real with virtual DOM and only diff. elements are rendered

-   Reusable components
-   one way data binding : 
        data flow from parent to child
        if we want data to flow from child to parent we use callbacks

-   state is locally owned by a component
-   react automatically cleans data when element unmounts
    but it is advised to always cleanup after every useEffect


#### keys
when we want to render array / list then we need to pass key to each element.
this helps react to uniquely identify each element.
keys need to be unique (not globally but locally)


#### JSX
-   javascript XML
-   basically combines js and html files
-   allows us to write HTML in js and easily place them in DOM without any functions like appendChild or createElement
-   in vanilla JS we used to create element then append child etc etc
    but using JSX we simply write HTML and bable converts it for us


#### Types of components
both are equivalent, I like functional bcz it is cleaner and i can use hooks which i think is better bcz it is short and clean

1.  Functional component
    -   Normal JS arrow functions
    -   Uses hooks for state management

2.  Class component 
    -   normal JS class that extends react component
    -   can't use hooks


#### Props
- data passed to a component is done using props. e.g. parent passes data to a child using props.
- can think like arguments to a function.
- Immutable.


#### HOOKS
-   built-in functions that controls state and lifecycle of component
-   component has 3 lifstages : can be controlled using useEffect hook
    -   mount
    -   update
    -   unmount

-   much shorter than using class component, can't be used in class.



