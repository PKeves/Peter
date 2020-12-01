# Table of contents







[test](java.md#middle)
<br><br><br>
# Definitions
---

* ## Context Switch
    * Process of storing the state of a process or thread, so that it can be stopped and another task resumed

    * Can occur as a result of [interrupt](#interrupt), such as when another process needs to access disk storage etc..

    * This allows multiple processes to share a single CPU

* ## Marshalling
    * process of converting the data into a byte-stream
    * this conversion is achieved through [serialization](#serialization)
    * UnMarshalling is the reverse process of Marshalling

* ## Buffer
    * Temporary storage to hold data

    * Use case:
        *   Reading/Writing one by o ne can be inefficient, especially if cost of these operation is high <br><br>
            OS Data Reading/Writing Subroutine is very expensive, instead of reading/writing one byte at time time we can read/write thousand of bytes at once to / from a temporary structure called buffer 

* ## ADT
    * Abstract data type, describes behavior but not the implementation e.g:<br><br>
    Graph, List, Map, Priority Queue, Queue, Set, Stack, Tree

* ## Data Structure
    * Concrete implementation of the abstract datatype e.g: <br><br>
    List -> Arraylist, Linkedlist <br>
    Map  -> Hashmap, Treemap

* ## Serialization
    * Process of writing the state of an object into a byte stream
    * Used wto transfer the object's state through network over store it on the disk
    * Deserialization is the reverse process of Serialization

* ## String Interning
    * Method to save the runtime memory by preserving a pool of immutable strings in a string intern pool
    * Subsequent string creation, can just check this pool, if string already exists just return it from the pool instead of creating a new one
    * Example of [flyweight-design-pattern](#flyweight-design-pattern)

* ## Recursive Algorithm
    * All recursive algorithms can be implemented iteratively, although they may be more complex

    * Space complexity will be at least O(n) where n is the depth of the recursive call

* ## Log Base
    * Logs in computer science implicitly imply base 2 (whereas in math it's base 10)


<br><br><br>
# Arrays and Strings
---
* arrays and string questions are often interchangeable
* ordered
* sequentially stored in memory
* can be either static or dynamic in size
    <br><br>
* ## Dynamic Array 
    <a id="Dynamic Array"></a>
    * when array is full, create a new array with double the size of the original one (resizing factor can vary), and copy all the elements to the new array
    <br><br>
    * ### String Concation
        * strings are usually immutable which can result in a major performance bottleneck during repepetitive concat operation  

        * consider the following, a list of string in which all strings are same length (l) and there are n strings. 

            ```Python
            sentence = "
            for s in strings:
                sentence.append(s)

            ```

        <br>

        * On each concat a new string object needs to be created in memory and two strings must be copied over character by character. In first iteration we copy l characters, on second 2l, third 3l and so on... O(l + 2l + 3l .. nl) which reduces to O(ln<sub>2</sub>) because 1 + 2 + ... n = $ \frac{n(n+1)}{2} $ or O(n<sup>2</sup>) + the l prefix
        <br>
        * to prevent this concat bottleneck whenever we manipulate strings many times, we should use a language specific tool for the job, such as a [dynamic array](#dynamic array) of the strings, which initially allocates space that is hoped to be larger than the final string and appends the strings to this array as necessary without a need to create a new string object on each subsequent manipulation

<br>
    
* ## Time Complexity
    |operation|complexity|comment|
    |:---:|:---:|:---|
    |access |O(1)| if items are consecutively stored in memory and each takes fixed  space, we can just multiply the initial memory by let's say 5 to access the 5th element of the array e.g cars[5]
    |insert |O(n) / O(1)| if array is full we need to create a new array and copy all the items to it which takes O(n) but happens so rarely that it can be said that the it's [amortized](#amortized) insertion time is O(1) <br><br> why copy all items into the array is O(n) ? well final capacity increase is n/2, previous capacity increase n/4 ... second capacity increase 2 elements to copy, first capacity increase 1 element to copy therefore the total number of insertion is $ \frac{1}{2} + \frac{1}{4} + \frac{1}{8} ... + 2 + 1 $ which is equal to just less than N
    |remove |O(n) / O(1)| we might have to shift n elements to transform the array back to the consecutive form, but if removed from the end can be O(1) 
    |search |O(n)| need to scan the entire array |

<br><br><br>

# Hash tables
---
- maps keys to vals e.g dict in python
- unordered

* ## Implementation (using chaining collision method)
    * #### insert key val
    1. compute the hash code from the key (hash code will be int usually)
       hash = hashfunc(key)
    1. compute the index from the hash code (as len(array) can be smaller than the potentional hash codes
       index = hash % len(array)
    1. store the key val into the linked list

    * #### access key val
    1. compute the hash code from the key (hash code will be int usually)
       hash = hashfunc(key)
    1. compute the index from the hash code (as len(array) can be smaller than the potentional hash codes
       index = hash % len(array)
    1. search through the linked list for the node.val == key and retreive the result

* ## Good hash function
    *  should be deterministic (every time we pass the exact same data into the func, we should always get the same hash code out)
    * should uniformly distribute data (to avoid collisions)
    
* ## Perfect hash function
    * if we know the data in advance, we could theoretically come up with a perfect hash func to use all the available space in the array
    
* ## Colisions:
    * if two different keys are run through the hash func and return the same hash code 
    
* ## Resolving colissions:
    * #### increase the capacity
        * fuller the array, the higher chance of collision
        * load factor = $ \frac{total\;number\;of\;items\;stored}{size\;of\;the\;array} $
        * if hash table is implemented as a resizable data structure, we can resize the hash table automatically when the load factor reaches a certain trashold e.g 70%

    * #### linear probing (open addressing)
        * run linear search to find the next consecutive vacant slot
        * efficient if load factory is low
        * can cause primary clustering - keys might bunch together in the array, while large portions of it can end up unoccupied
            * fix by using quadratic probing or double hashing
    * #### quadratic probing (open addressing)
        * (failed attemps)<sup>2</sup>, when deciding how far from the original point of colission to look next, with each failed attempt, the distance grows rapidly 
    * #### double hashing (open addressing)
        * double hashing - applies 2nd hash to the key when the collision occurs, the result gives number of position from the original collision to try next 
        
    * #### chaining (close addressing)
        * chaining items that colided into a linked list
<br><br>
* ## Time Complexity
    |operation|complexity|comment|
    |:---:|:---:|:---|
    |access, insert, remove, search |O(1)| assuming a good hash func, with minimal collisions|


# Linked List
---

* ## Singly linked list
    * Each node points to the next node
    <br>
    <img  src="./res/cs/333.png" width="60%">
* ## Doubly linked list
    * Each node poitns to the previous and next node
    <br>
    <img  src="./res/cs/334.png" width="60%">

* ## Time complexity
    |operation|complexity|comment|
    |:---:|:---:|:---|
    |access|O(n)|as we need to traverse through n number of nodes|
    |search|O(n)|as we need to traverse through n number of nodes|
    |insert|O(1)|only when inserting to the start or the end of the linked list, otherwise search has to be used|
    |delete|O(1)|only when deleting at the start or the end of the linked list, otherwise search has to be used|
    
* ## Code
    <br>

    ```Python
    class Node:
        def __init__(self, val):
            self.next = None
            self.val = val

    class LinkedList:
        head = None

        def __init__(self, nodes):
            for node in nodes:
                self.append(node)

        def __str__(self):
            if self.head == None:
                return

            vals = []

            current = self.head
            while current != None:
                vals.append(current.val)
                current = current.next

            return str(vals)

        def prepend(self, val):
            if self.head == None:
                return

            new_head = Node(val)
            new_head.next = self.head
            self.head = new_head

        def append(self, val):
            if self.head == None:
                self.head = Node(val)
                return

            current = self.head
            while current.next != None:
                current = current.next

            new_node = Node(val)
            current.next = new_node

        def remove(self, val):
            if self.head == None:
                return

            if self.head.val == val:
                self.head = self.head.next

            current = self.head
            while current.next != None:
                if current.next.val == val:
                    current.next = current.next.next
                    return
                current = current.next

        def get_middle(self):
            if self.head == None:
                return

            sp = self.head
            fp = self.head
            
            while fp != None and fp.next != None:
                sp = sp.next
                fp = fp.next.next
            
            return sp

        def reverse(self): 
            prev = None

            current = self.head 
            while current != None:
                next = current.next
                current.next = prev 
                prev = current 
                current = next
            self.head = prev

        def return_kth_to_last(self, k):
            self.reverse()
            c = 0
            current = self.head
            while current.next != None and c != k:
                current = current.next
                c += 1
            return current

        def is_palindrome(self):
            if self.head == None:
                return

            #find middle element if one exists
            sp = self.head #slow pointer
            fp = self.head #fast pointer
            mid = None

            while fp != None and fp.next != None:
                sp = sp.next
                fp = fp.next.next
            
            #if fp != None means if linkedlist has odd length
            if fp != None:
                mid = sp.next #mid equals midpoint + 1
            else:
                mid = sp
            
            #reverse second half of the list
            prev = None
            while mid != None:
                next = mid.next
                mid.next = prev
                prev = mid
                mid = next

            #palindrom comparison
            while prev != None:
                if prev.val != self.head.val:
                    return False
                prev = prev.next
                self.head = self.head.next

            return True
        
        def sort(self):
            #in general, merge sort is the best-suited sorting algorithm for sorting linked lists efficiently. 
            pass

        def remove_duplicates_unsorted(self):
            if self.head == None:
                return

            current = self.head
            set = {current.val}

            while current.next !=  None:
                if current.next.val not in set:
                    current = current.next
                    set.add(current.val)
                else:
                    tmp_current = current
                    while current.next != None and current.next.val in set:
                        current = current.next
                    tmp_current.next = current.next


        def remove_duplicates_sorted(self):
            #self.sort()

            if self.head == None:
                return

            current = self.head

            while current.next != None:
                if current.val < current.next.val:
                    current = current.next
                else:
                    tmp_current = current
                    while current.next != None and current.val == current.next.val:
                        current = current.next
                    tmp_current.next = current.next
    ```

<br><br>
# Stack
---

* [ADT](#adt), can be implemented using [linked_list](#Linked-List)

* Items are added & removed from the same side (last-in first-out, imagine stack of dinner plates)

* ## Usage
    * to implement a recursive algorithm iteratively
    * when need to backtrack(e.g if recursive check failed)
    <br><br>

* # Code
    <br>

    ```Python
    import math

    class StackNode:
        def __init__(self, val, last_min):
            self.next = None
            self.val = val
            self.last_min = last_min

    class Stack:
        top = None
        last_min = None

        def __str__(self):
            return str(self.top.val)

        def push(self, val):
            if self.top == None:
                self.last_min = math.inf

            new_top = StackNode(val, self.last_min)
            new_top.next = self.top
            self.top = new_top

            if val < self.last_min:
                self.last_min = val

        def min(self):
            if self.top == None:
                raise Exception("Stack is Empty")
            
            return self.last_min
        def pop(self):
            if self.top == None:
                raise Exception("Stack is Empty")

            if self.top.val == self.last_min:
                self.last_min = self.top.last_min
                        
            tmp_top = self.top
            self.top = self.top.next
            return tmp_top

        def peek(self):
            if self.top == None:
                raise Exception("Stack is Empty")

            return self.top.val

        def is_empty(self):
            return self.top == None
    ```

<br><br>
# Queue
---
* [ADT](#adt), can be implemented using [linked list](#Linked-List)

* items are added and removed from the opposite side

* ## Usage
    * Cache

* ## Code
    ```Python
    class QueueNode:
        def __init__(self, val):
            self.next = None
            self.val = val

    class Queue:
        first = None
        last = None

        def __str__(self):
            return str((self.first.val, self.last.val))

        def add(self, val):
            node = QueueNode(val)

            if self.last != None:
                self.last.next = node

            self.last = node

            if self.first == None:
                self.first = self.last

        def remove(self):
            if self.first == None:
                raise Exception("Queue is Empty")
            if self.first.next == None:
                self.last = None

            val = self.first.val
            self.first = self.first.next

            return val

        def peek(self):
            if self.first == None:
                raise Exception("Queue is Empty")

            return self.first.val

        def is_empty(self):
            return self.first == None
    ```

# Graphs
---

* ## Notation:

    |  |  |
    | :--- | :--- |
    | n | number of nodes |
    | m | number of edges |

<br>

* ## Definitions:

    |  |  |
    | :--- | :--- |
    | directed | edge are one way → |
    | undirected | edges are two way ⟷ or simply － |
    | connected | associated with undirected graphs, there is a path between every two nodes  |
    | strongly connected | associated with directed graphs, there is a path in each direction between every two nodes |
    | <a id="sparse"></a> sparse | has few edges |
    | <a id="dense"></a> dense | has many edges or is a almost complete graph, in a complete graph you have $ \frac{n(n-1)}{2} $ edges
    | cyclic | cycles |
    | acyclic | no cycles |


    <br><br>
    <img  src="./res/cs/335.png">
    <br><br>

* ## Programming Representation

    ```Python
    adjacency_list = {
                        0: [1, 4, 5],
                        1: [3, 4],
                        2: [1],
                        3: [2, 4],
                        4: [],
                        5: []
                      }

    adjacency_matrix =[ [0,1,0,0,1,1],
                        [0,0,0,1,1,0],
                        [0,1,0,0,0,0],
                        [0,0,1,0,1,0],
                        [0,0,0,0,0,0],
                        [0,0,0,0,0,0], ]
    ```

<br><br>
* ## Adjacancy List:

    * Use when graph is [sparse](#sparse)
    * Generally more efficient than the [adjacancy matrix](#adjacancy-matrix)

    * ### Time Complexity:
        |operation|complexity|comment|
        |:---|:---:|:---|
        |checking if there is edge between two nodes| O(n) | checking if there is edge between 0 and 5, we have to loop through all the adjacent nodes in either 0 i.e [1,4,5] or 5 i.e [] and there can be n of these adjacent nodes
    <br><br>
    * ### Space Complexity:
        |structure|complexity|comment|
        |:---|:---:|:---|
        |undirected tree |O(n)| as undirected tree will have n - 1 edges we can write the complexity as O(n - n-1)|
        |directed complete with self loops|O(n<sup>2)|as when graph is complete it will have $ \frac{n(n - 1)}{2} $ edges or n<sup>2 |

    <br>
    
<br><br>
* ## Adjacacny Matrix:
    * use when graph is [dense](#dense) (if the graph is sparse we would waste memory as most of the matrix cells would remain unused)
        
    * in an undirected graph an adjacency matrix will be symmetric

    * ### Time Complexity:
        |operation|complexity|comment|
        |:---|:---:|:---|
        |checking if there is edge between two nodes| O(1) | as we can simply use O(1) array access adjacent_matrix[0][5] to check if the edge exists
    <br><br>
    * ### Space Complexity:
        |structure|complexity|comment|
        |:---|:---:|:---|
        |undirected tree |O(n<sup>2</sup>)| as we have to allocate n * n matrix to the store node-connectivity |
        |directed complete with self loops|O(n<sup>2</sup>)|as we have to allocate n * n matrix to store the node-connectivity |

    <br>

* ## Graph Search:

    * ### DFS:
        * uses [stack](#stack)
        * explore each branch fully before moving on to the next branch (hence the name depth first)
        * suitable if solution away from source, search the entire tree (such as solving maze), find strongly connected components of the graph
        * uses less memory than bfs (depending on branching factor)
        * might find suboptimal solution
        <br><br>
        * #### Time Complexity:
            |operation|complexity|comment|
            |:---|:---:|:---|
            |search | O(n + m) | because every edge is considered exactly twice, and every node is processed exactly once, so the complexity has to be a constant multiple of the number of edges as well as the number of nodes, which is equal to O(n + 2m), as Big O analysis ignores constant this becomes O(n + m)
        <br><br>
        * #### Space Complexity:
            |operation|complexity|comment|
            |:---|:---:|:---|
            |search |O(n)| as nodes are pushed and poped from the stack during the traversal, the most memory it can take up is the longest possible path to find the solution, as during that time all the nodes will be pushed on the stack |

    * ### BFS:
        * uses [queue](#queue)
        * explore the neighbors before going on to any of their children (hence breadth first)
        * suitable if solution close to source, find shortest path, test if graph is bipartite
        uses more memory than dfs (depending on braching factor)
        * complete algorithm, meaning if used to search for solution in the lowest depth possible, it gives the optimal solution 
    
        <br><br>
        * #### Time Complexity:
            |operation|complexity|comment|
            |:---|:---:|:---|
            |search | O(n + m) | same as DFS |

        * #### Space Complexity:
            |operation|complexity|comment|
            |:---|:---:|:---|
            |search|O(l)| where l is max number of nodes in a single level |

        <br>
        <img src="./res/cs/336.png">
        <br>
    
* ## Bidirectional Search: <br>
    * Used to find the shortest path between a source and destination node, by running two simultaneous bfs searches one from each node. where their searches collide, we have found the shortest path <br><br>
    * It's faster than a traditional bfs because given the source s to target t has distance d to find the target in the traditional bfs the worst case O(b<sup>d</sup>) whereas in bidirectional search the two searches collide after approximately levels, meaning the search from s visit approximately b<sup>d&frasl;2</sup> nodes, as does the search from target

* ## Code
    ```Python
    adjacency_list = {
                    0: [1, 4, 5],
                    1: [3, 4],
                    2: [1],
                    3: [2, 4],
                    4: [],
                    5: []
                    }

    visited = []

    def dfs(node):
        visited.append(node)
        for adjacent_node in adjacency_list[node]:
            if adjacent_node not in visited:
                dfs(adjacent_node)
    dfs(0)
    ```
    <blockquote>
    [0, 1, 3, 2, 4, 5]
    </blockquote>

    <br>

    ```Python
    from collections import deque

    adjacency_list = {
                    0: [1, 4, 5],
                    1: [3, 4],
                    2: [1],
                    3: [2, 4],
                    4: [],
                    5: []
                    }
                    

    def bfs(root):
        visited, queue = [root], deque([root])
        while queue:
            node = queue.popleft()

            for adjacent_node in adjacency_list[node]:
                if adjacent_node not in visited:
                    visited.append(adjacent_node)
                    queue.append(adjacent_node)
        return visited

    print(bfs(0))

    def bfs_shortest_path(start, end):
        visited, queue = [start], deque([(start, [])])
        while queue:
            node, path = queue.popleft()           
            if node == end:
            return path + [node]
            
            for adjacent_node in adjacency_list[node]:
                if adjacent_node not in visited:
                    visited.append(adjacent_node)
                    queue.append((adjacent_node, path + [node]))
        return None

    print(bfs_shortest_path(0,2))

    def bfs_is_connected(start, end):
        visited, queue = [start], deque([start])
        while queue:
            node = queue.popleft()           
            if node == end:
            return True
            
            for adjacent_node in adjacency_list[node]:
                if adjacent_node not in visited:
                    visited.append(adjacent_node)
                    queue.append((adjacent_node))
        return False

    print(bfs_is_connected(0,2))
    ```
    <blockquote>
    [0, 1, 4, 5, 3, 2] <br>
    [0, 1, 3, 2] <br>
    True
    </blockquote>

<br><br>
# Trees

* connected acyclic undirected graph
* each node has up to n children
* all nodes are reachable from a single node
* given n nodes the undirected tree must have exactly n - 1 edges

* ## Notation:

    |  |  |
    | :--- | :--- |
    | h | height of the tree |

<br>

* ## Definitions:

    |  |  |
    | :--- | :--- |
    | root | topmost, or the bottommost node (not from graph theory, defined for programming purposes) |
    | leaf | node with no children |

<br>

* ## Binary Tree
    * each node has up to two childrens

* #### Time Complexity:
    |operation|complexity|comment|
    |:---|:---:|:---|
    |search, insert, delete | O(n) | where n is the number of nodes in the tree, as we need to traverse all the nodes before being able to perform search, insert, delete.

* ## Binary Search Tree
    * the left subtree of a node contains only nodes with keys less than the node's key
    * the right subtree of a node contains only nodes with keys greater than the node's key
    * both the left and right subtrees must also be binary search trees
    <br><br>
    <img src="./res/cs/338.png">
<br>

    * #### Time Complexity:
        |operation|complexity|comment|
        |:---|:---:|:---|
        |search, insert, delete | O(h) | as we can determine the path to the node which we want to perform the search,insert,delete operation by checking the magnitude of each node's value through the traversal to determine if we need to move to the left or right subtree

* ## Balanced Binary Tree
    * the height of every node differ by no more than 1


* ## Complete Binary Tree
    * every level of the tree is fully filled, except for perhaps the last level. to the extent that the last level is filled ,it is filled left to right
    * complete binary tree is alway balanced but nothe other way around
    <br><br>
    <img src="./res/cs/339.png">
<br>

* ## Full Binary Tree
    * every node has either zero or two children, that is no node have only one child.
    <br><br>
    <img src="./res/cs/3310.png">
<br>

* ## Perfect Binary  Tree
    * is both complete and full, all leaf nodes will be at the same level, and this level has the maximum number of nodes.

    * a perfect tree must have exactly 2<sup>h</sup> -1 nodes
    <br><br>
    <img src="./res/cs/3311.png">
<br>

* ## Binary Tree Traversal
    *  Process of visiting each node in a tree data structure, exactly once

    * ### Notation
        |  |  |
        | :--- | :--- |
        | n |  visit(print) current node |
        | l |  visit(print) left branch  |
        | r |  visit(print) right branch |
    <br>

    * ### Pre-Order Traversal
        * order of operations - nlr
        * the root is always the first node visited
    * ### In-Order Traversal
        * order of operations - lnr
        * when performed on binary search tree, it visits the nodes in the ascending order (hence the name in-order)
    * ### Post-Order Traversal
        * order of operations - lrn
        * the root is always the last node visited
    * ### Complexities 

        * #### Time:
            |operation|complexity|comment|
            |:---|:---:|:---|
            |traversal| O(n) |  since the number of edges that can originate from a node is limited to 2, the maximum number of total edges in a binary tree is n - 1 where n is total number of nodes, the time complexity becomes O(n + n-1) which is O(n)

        * #### Space:
            |operation|complexity|comment|
            |:---|:---:|:---|
            |traversal | O(h) |since traversal means we need to visit each node in a tree data structure, and stack pushes and pops nodes as we traverse through the tree, the space complexity will equal the longest path we need to traverse, i.e the height of the tree as all nodes will be pushed to the stack at that point

* ## Binary Heap (min-heap and max-heap)
    * a complete binary tree
    * a binary heap is a common implementation of a heap (heap is an implementation of priority queue [ADT](#adt))
    *  suitable for problems to find smallest of something or the largest of something
    <br><br>
    * ### Insert node into the heap
        * Let's say we want to insert 2
        <br>
        1. insert at the bottom rightmost spot to maintain the complete tree property
        1. fix the tree by swapping the new node with its parent, until we find an appropriate spot for the node (essentially bubble up the minimum element)
        <br><br>
        <img src="./res/cs/3313.png">

    * ### Extract node from the heap
        * Let's say we want to extract 2
        <br>
        1. extract the min node (the root element) and remove it
        1. swap the removed min node with the last element in the heap (the bottommostrightmost node). then we bubble down the element by swapping it with one of it's children until the min-heap property is restore
        <br><br>
        <img src="./res/cs/3314.png">

<br><br>
* ### Time Complexity:
    |operation|complexity|comment|
    |:---|:---:|:---|
    |Insert| O(log(n)) | because in worst case we need to do a traversal of the height of the tree, to insert or delete nodes, and since we know the tree is balanced (as all complete binary trees are) then we know that balanced tree height can be express as 1 + floor(log(n)) which after removing constant operations becomes O(log(n))
    |Extract| O(log(n)) | same as insert

<br><br>
* ## Tries

    * Variant of tree (sometimess called a prefix tree) at which characters are stored at each node
    * Commonly a trie is used to store the entire (English) language for quick prefix lookups. while a hash table can quickly look up wheather a string is a valid word, it cannot tell us if a string is a prefix of any valid words, a trie an do this very quickly.

    * A path from root of the tree up to (*)  may represent a word or part of the word nodes usually store a character as its data
    <br><br>
    <img src="./res/cs/3315.png">
    <br>
    * the fact there is a * node under many indicates that MANY is a complete word. the existence of the MA path indicates there are words that start with MA
    <br>

    * ### Time Complexity:
        |operation|complexity|comment|
        |:---|:---:|:---|
        |search| O(l) | where l is the length of the string. this is actually the same runtime as hash table. although we often refer to has hash lookups as O(1) this isn't always true, a hash table must read through all the chars in the input O(l) times in the case of word lookup

* ## Code
    ```Python
    class TreeNode:
        def __init__(self, val):
            self.left = None
            self.right = None
            self.val = val

        def __str__(self):
            return str(self.val)

    #fill in the tree
    node = TreeNode(10)

    node.left = TreeNode(7)
    node.right = TreeNode(11)


    node.left.left = TreeNode(6)
    node.left.right = TreeNode(8)
    node.right.right = TreeNode(20)

    node.left.left.left = TreeNode(1)
    node.left.right.right = TreeNode(9)
    node.right.right.left = TreeNode(14)
    node.right.right.right = TreeNode(22)

    visited = []

    def pre_order_traversal(node):
        if node != None:
            visited.append(node.val)
            pre_order_traversal(node.left)
            pre_order_traversal(node.right)

    pre_order_traversal(node)
    print(visited)

    visited = []

    def in_order_traversal(node):
        if node != None:
            in_order_traversal(node.left)
            visited.append(node.val)
            in_order_traversal(node.right)

    in_order_traversal(node)
    print(visited)

    visited = []

    def post_order_traversal(node):
        if node != None:
            post_order_traversal(node.left)
            post_order_traversal(node.right)
            visited.append(node.val)

    post_order_traversal(node)
    print(visited)
    ```
    <blockquote>
    [10, 7, 6, 1, 8, 9, 11, 20, 14, 22] <br>
    [1, 6, 7, 8, 9, 10, 11, 14, 20, 22] <br>
    [1, 6, 9, 8, 7, 14, 22, 20, 11, 10] <br>
    </blockquote>

    ```Python
    #use to solve majority of tree problems

    #find one or more base cases
    #call the same func on the left subtree
    #call the same func on the right subtree
    #joining the results

    #sum of values
    def tree_sum(root):
        if root is None:
            return 0
        else:
            left_sum = tree_sum(root.left)
            right_sum = tree_sum(root.right)
            return root.data + left_sum + right_sum


    #max value
    def tree_max(root):
        if root is None:
            return - math.inf
        else:
            left_max = tree_max(root.left)
            right_max = tree_max(root.right)
            return max(root.data, left_max, right_max)


    #find height
    def tree_height(root):
        if root is None:
            return 0
        else:
            left_height = tree_height(root.left)
            right_height = tree_height(root.right)
            return 1 +  max(left_height, right_height)


    #check if value exists in tree
    def exists_in_tree(root, value):
        if root is None:
            return False
        else:
            in_left = exists_in_tree(root.left, value)
            in_right = exists_in_tree(root.right, value)
            return root.data == value or in_left or in_right
        
    #reverse tree
    def reverse_tree(root, value):
        if root is None:
            return
        else:
            reverse_tree(root.left)
            reverse_tree(root.right)
            root.left, root.right = root.right, root.left


    #tree longest consecutive seq
    def tree_longest_consecutive_seq(root, count, target, max):
        if root is None:
            return
        elif root.val == target:
            count += 1
        else:
            count = 1
        
        max = max(max, count)
        tree_longest_consecutive_seq(root.left, count, target +1, max)
        tree_longest_consecutive_seq(root.right, count, target +1, max)
    ```
    <br><br>

    ```Python
    # given a sorted(increasing order) array with unique integer elements, write an algorithm to create a binary search tree with minimal height

    #     (6)
    #     ↙↘  
    #   (2) (8)
    #   ↙ ↘   ↙ ↘ 
    # (1)(4) (7)(10)

    arr = [1,2,4,6,7,8,10]
    def build_min_bst(arr):
        mid = len(arr) // 2

        if len(arr) > 0:
            node = TreeNode(arr[mid])
            node.left = build_min_bst(arr[:mid])
            node.right = build_min_bst(arr[mid+1:])
            return node
    node = build_min_bst(arr)
    print(node.left.left)
    ```
    <blockquote>
    1
    </blockquote>



# Algorithms

 * ## Sieve of Eratosthenes
    <br>

      * ```Python
        # find all prime numbers up to limit n

        # works by recognizing that all non-prime numbers are divisble by a prime number

        # T: O(Nlog(N)) 

        def sieve_of_eratosthenes(n):
            if n < 2:
                return []
            
            flags = [True] * (n + 1) 

            for p in range(3, math.ceil(math.sqrt(n)), 2): # optimization 1 # optimization 3
                if flags[p] == True:
                    for num in range(p*p,(n+1),p): # optimization 2
                        flags[num] = False

            return [2] + [i for i in range(3, n, 2) if flags[i]]
        sieve_of_eratosthenes(100)
        ```

    * ### Optimization 1
        * If a number **n** is not a prime, it can be factored into two factors **a** and **b**
        <br>
        **n = a * b**
        <br>
        now **a** and **b** can't be both greater than the **sqrt(n)**, since then the product **a * b** would be greater than **sqrt(n) * sqrt(n) = n**. So in any factorization of **n**, at least one of the factors must be smaller than the **sqrt(n)**, and if we can't find any factors less than or equal to the square root, **n** must be a prime.


    * ### Optimization 2
        * Starts from $p*p$ because all multiple of p smaller than $p*p$ are already checked in prior loops.

    * ### Optimization 3
        * Check only odd numbers


# Design Patterns
* ## Creational
    * Creating objects
* ## Structural
    * Relationships between objects
* ## Behavioural
    * Interactions between objects


<br><br><br>
# Object-Oriented Design
---
<br>

* Requires to sketch out the classes and methods to implement technical problem using OOO Design
* Single Responsibility principle - every class should have a single responsibility
<br><br>
* ## Step 1: Handle Ambiguity
    * these technical problems are purposely ambigious, depending on a question one should clarify with "six Ws" *who, what, where, when, how, why* to resolve any ambigiouty about the problem raised

    * e.g design a coffee maker
    * seems straightforward but in reality we need to know question such as; is it going to be used in massive restaurant chains servicing hundreds of customers per hour and makign ten different kinds of coffee products?, or a single machine, designed for eldery's people to to just make a simple black coffee now and then.

* ## Step 2: Define the core Objects
    * e.g for restaurant things like *Table, Guest, Party, Order, Meal, Employee, Server, Host*


* ## Step 3: Analyze Relationships

    * **Key Questions:**
    * 1. Which objects are members of which other objects?
        * **Party** should have an array of **Guests**
    * 1. Do any objects inherit from any other?
        * **Server** and **Host** inherit from **Employee**
    * 1. Are relationships many-to-many or one-to-many, or one-to-one?
        * Each **Table** has one **Party** but each **Party** may have mutliple **Tables**
        * There is one **Host** for the **Restaurant**
    <br>
    <br>
    * **Careful here**  one might have to return to [Step 1](#Step-1) to handle any ambiguity such as, can single table have multiple parties? (restaraunt which handles wedding)


* ## Step 4: Define the core Actions and how they relate to each other
    * e.g **Guest** requiests a **Table** from the **Host** The **Host** looks up the **Reservation** and if it exists assign the **Party** to a **Table**, Otherwise , the **Party** is added to the end of the list. When **Party** leaves, the **Table** is freed and assigned to a new **Party** in the list.
    <br>

    * **Careful here** we don't have a **Party** object so we might have to go back to [Step 2](#Step-2)

<br>


# Object-Oriented Programming
---
* Based on objects, promotes modularity and reusability
<br><br>
* ## 4 Pinricples
    * ### Encapsulation
        * hiding data by restricting direct access
        * access can be given using getter and setter methods
    * ### Abstraction
        * hiding implementation details by focusing on what object does rather than how it does it 
        * applied using abstract class or interface
    * ### Inheritance
        * class Dog extends Animal
        * reduces duplicate code
    * ### Polymorphism (translated as many forms)
        * ability to treat a class of an object as if it is the parent class
        * e.g Dog that inherits from Animal. Polymorphism is the ability to treat the dog as Animal
<br><br>
* ## Object-Oriented Programming vs Object-Based Programming
    * ### Object-Oriented Programming:
        * follow all 4 OOP principles
    * ### Object-Based Programming
        * do not follow all the OOP principes such as inheritance and polymorphism
        * have built-in objects e.g window object in JavaScript
<br><br>
* ## Association, Aggregation, Composition
    <br>
    
    * **Association** - I have a relationship with an object. Foo uses Bar
        ```
        public class Foo { 
            void Baz(Bar bar) {
            } 
        };
        ```
    * **Aggregation** (weak relationship) - I have an object which I've borrowed from someone else. When Foo dies, Bar may live on.
        ```
        public class Foo { 
            private Bar bar; 
            Foo(Bar bar) { 
            this.bar = bar; 
            }
        }
        ```
    * **Composition** (strong relationship) - I own an object and I am responsible for its lifetime. When Foo dies, so does Bar
        ```
        public class Foo {
            private Bar bar = new Bar(); 
        }
        ```
        ![image](./res/cs/p20.jpg)

<br><br><br>
# Java Virtual Machine (JVM)
---

* ## Subsystem 1. Class Loader
    * ### Phase 1: Loading
        * Loads ```.class``` files into memory

        * #### Three built-in classloaders:
            * #### Bootstrap Class Loader
                * loads ```.class``` files from rt.jar (a.k.a runtime jar)  which contains all class files of Java Standard Edition e.g java.lang etc...
            * #### Extension Class Loader
                * child of Bootstrap Class Loader
                * loads additional jar files located inside $JAVA_HOME/jre/lib/ext
            * #### System/Application Class Loader
                * child of Extension Class Loader
                * loads the class files from the classpath (our application class files) 
                * classpath set to current dir by default, modifiable by -cp switch)
    <br><br>
    * ### Phase 2: Linking
        * #### Step 1: Verify
            * bytecode class files are verified if they conform to standards 
        * #### Step 2: Prepare
            * memory allocated for static variables and default values are assigned 
        * #### Step 3: Resolve
            * all [symbolic references](#symbolic-reference) are replaced with actual references
    <br><br>
    * ### Phase 3: Initilization
        * all static variables are assigned with the actual values
        * static initializers are executed 
  <br><br><br>
* ## Subsystem 2. Runtime Data Area 
    <span style="color:Tomato">shared-to-all-threads</span> | <span style="color:MediumSeaGreen">per-threads</span> <br><br>

    * #### <span style="color:Tomato">Class(Method) Area</span>
        * responsible for holding class level information such as [runtime constant pool](#runtime-constant-pool), static fields, static methods etc
    <a id='heap'></a>
    * #### <span style="color:Tomato">Heap</span>
        *  used to allocate memory to objects at run time
        *  slower allocation (compared to stack)
        *  no size limit
        *  allocated when new objects are created and deallocated by garbage collector when they are no longer referenced
    * #### <span style="color:MediumSeaGreen">Stack</span>
        *  used to store data and partial results which will be needed while returning value for methods or [dynamic linking](#dynamic-linking)
        *  each method invocation creates a new stack frame, subsequently each method invocation completion destroys the stack frame
        * faster allocation (compared to heap)
        * size limit (meaning size is usually smaller than heap)
        * allocated when method is called and deallocated when method returns
    * #### <span style="color:MediumSeaGreen">Native Method Stack</span>
        *  contains all the native methods
    * #### <span style="color:MediumSeaGreen">Program Counter Register</span>
        *  contains the address if an instruction that JVM is currently executing
<br><br><br>
* ## Subsystem 3. Execution Engine
    * Converts bytecode to machine code and executes the instructions
    * Contains:
        * ### Interepreter
            * reads and execute bytecode 
            * the problem with interepreter is that, when method is called multiple times, it interprets those lines of bytecode again and again
        * ### Just-In-Time (JIT) Compiler
            * helps overcome the problem with the interpreter, when repeated method call occur, JIT compiles the bytecode to native code. This native code will be used directly for the repeated method calls
            * components to achieve this feautre:
                * intermediate code generator - generates intermediate code
                * code optimizer - optimizes the intermediate code
                * target code generator - converts intermediate code to native machine code
                * profiler - it is responsible for finding the methods which are called repeatedly
        * ### [Garbage Collector](#garbage-collector)
        * ### Java native method interface
            * make native libraries available for the execution engine
<br><br><br>
* ## JVM Shutdown
    * ### In controlled process
        * The last non-[daemon](#daemon-thread) terminates.
        * Interrupt signal from the OS (Ctrl + C)
        * System.exit()
        <br><br>
        * Subsequently
            * JVM Starts all the [Shutdown-hooks](#Shutdown-hook) in an unspecified order


    * ### Abruptly
        * Host OS dies
        * Kill signal from the OS (kill - 9 <jvm_pid>)
        * Runtime.getRuntime().halt()


<br><br><br><br><br>
# Class
* ## Runtime Class
    * Only one instance of ```Runtime class``` per java application
    * Used to interfact with java runtime environment e.g execute process, invoke GC etc...

* ## Singleton Class
    ```Java
    public class Singleton {
        private static Singleton singleton = new Singleton();

        // private Constructor prevents any other class from instantiating this class
        private Singleton() {}

        // static 'instance' method
        public static Singleton getInstance() {
            return singleton;
        }
    }

    Singleton singleton = Singleton.getInstance();
    ```
* ## Read-only
    * mark all fields ```private```
    * contains only getters methods
* ## Write-Only
    * mark all fields ```private```
    * contains only setter methods
* ## Immutable
    * mark all fields ```final```
    * mark ```class``` as ```final```

* ## Nesting    
    * ### Nested Class
        * A ```class``` which is declared inside another ```class``` or ```interface```

        * A ```class``` defined inside an ```interface``` is implicitly ```static```
    * ### Nested Interface
        * An ```interface``` which is declared inside another ```class``` or ```interface```
        <br><br>
        * Must be ```public``` if declared inside another ```interface```
        * Can have any [access specifier](#access-specifiers) if declared inside another ```class```
        <br><br>
        * An  ```interface``` declared inside an ```interface``` or ```class``` is implicitly ```static```
    <br><br>
    * Used to logically group classes & interfaces in one place
    * Can access all the members of it's outer class (including private members)
    <br><br>
    * Increase total number of classes used, which can result in additional workload for [JVM](#JVM), because if we don't instantiate the nested classes explicitly, they will still all be instantiated implcitly upon instantiating the outer class

    <br>

    * ### Static Nested Class
        *   ```Java
            package myapp;

            public class OuterClass {
                public static class StaticNestedClass {
                    
                }
            }
            ```
        * Declared as static member of another class
        * Can access only ```static``` members of it's ```OuterClass```
        * Doesn't require the ```OuterClass``` to be instantiated before it can be used
            <br>

            ```Java         
            OuterClass.StaticNestedClass nestedStaticObject = new OuterClass.StaticNestedClass();
            ```
        <br><br>
    * ### Non-Static Nested Class (Also known as Inner Classes)
        *   ```Java
            package myapp;

            public class OuterClass {
                public class InnerClass {
                    
                }
            }
            ```
        * Declared as an instance member of another class
        * Can access both ```static``` and ```non-static``` members of it's ```OuterClass```
        * Requires the ```OuterClass``` be instantiated before it can be instantied and used
            ```Java        
            OuterClass outerClass = new OuterClass();
            OuterClass.InnerClass innerObject = outerClass.new InnerClass();
            ```

        * ### Futher divided into:
            <br>

            * ### Local Inner Class
                ```Java
                public class A{  
                    private int val = 30; 
                    
                    void display(){  
                        class B{  
                            void msg(){System.out.println(val);}  
                        }
                            
                        B b = new B();  
                        b.msg();  
                    }  
                }

                A a = new A();  
                a.display();
                ```
                <blockquote>
                30
                </blockquote>
                <br>

                * Created within a method
                * Use when more than one instance is to be created

            <br>

            * ### Anonymous Inner Class
                ```Java
                abstract class A{  
                    abstract void display();  
                }  

                A a = new A(){  
                    void display(){System.out.println("abstract method display() implemented inside an Anynomous Inner Class");}  
                };

                a.display();
                ```
                * Synthactically convenient way of writing a local inner class as it is Anonymous (name will be decided by the java compiler)
                * Use when only single instance is to be created
                * Can be used to implement abstract method, intherface etc ...

---
<br><br><br><br><br>
# Object Class
---

* ## toString()
    * java compiler interanally invokes toString() when trying to obtain the string representation of an object (e.g with print statement)

<br><br><br><br><br>
# Strings
---
* Are Immutable
    <br>

    ```Java
    String s="Apple";  
    s.concat(" Juice"); //concat() method appends the string at the end  
    System.out.println(s);
    ```
    <blockquote>
    Apple
    </blockquote>

<br>

* ## String Pool
    * JVM implementation of [string interning](cs.ipynb)
    * strings in the string pool are java objects which is contrast to [constant pool](#constant-pool) where strings are seralized and not Java Objects 
    * located in [heap](#heap)  <br><br>

* ## String Compairson
    ```string1 == string 2``` checks if the reference of the strings is the same. <br>
    ```string.equals(string2)``` checks if the content of the strings is the same <br><br>
    ![image](./res/java/329.png)
    <br><br>
   
    ```Java
    // 1. Checks if String literal already exists in the String Pool.
    // 2. Since it doesn't, creates new String literal object in the String Pool 
    // 3. Returns reference of the newly created object ing the String Pool
    String s1 = "Cat"
    
    // 1. Checks if String literal already exists in the String Pool.
    // 2. Since it exists, no need to create new String literal object
    // 3. returns the reference to the already existing String pool object
    String s2 = "Cat"
    
    // 1. Creates a new String object in heap memory
    // 2. Checks if String literal alread yexists in the String Pool
    // 3. If exists does nothing, If doesn' creates new string ltieral object and adds it to the the String Pool.
    // 4. Returns reference to the heap (non-pool) object
    String s3 = new String("Cat") 
    String s3 = new String("Dog") // Creates 2 Objects, 1 in heap, 1 in String Pool

    s1 == s2  // true
    s1 == s3  // false
    
    s3 =  s1.intern() // intern() return String object reference from String Pool
    s1 == s3  // false
    ```
    <br>
* ## StringBuilder Vs StringBuffer
    * Refer to [Dynamic Array string concat](#Dynamic-Array)
    <br><br>

        |StringBuilder|StrigBuffer|
        |:--:|:--:|
        |unsynchronized|```synchronized```|
        |faster (since unsynchronized)| slower (since ```synchronized```)|

* ## Security
    * ### Vulnerability:
        * ```String``` stays in the [String Pool](#String-Pool) until garbage collected. If we store a secure data into a string, it stays in the memory for a prolonged period of time, hence any attacker could exploit Memory-Dump exploit to access the secure data.
    * ### Patch
        * Use ```CharArray()``` as we can set it to blank whenever we are done with it, with no trace left in memory.

<br><br><br><br><br>
# Access Specifiers
---
* order doesnt matter e.g **static public** void and **public static** void are the same <br><br>
    ![image](./res/java/321.png)


*  Subclass can **relax** the [access modifier](#access-modifier) but can't make it more **restrictive** as this would violate the rule that a subclass instance should be useable in place of a superclass instance.

    ```Java
    public abstract class A {
        protected void method();
    }

    public class B extends A {
        @Override
        public void method(){    // OK
        }
    }

    public class C extends A {
        @Override
        private void method(){    // Not Allowed
        }
    }
    ```

<br><br><br><br><br>
# Casting
---

* ## Primitives
    ![image](./res/java/326.png)


    * **Widening** conversion doesn't require an explicit cast as no information will be lost
    ```Java
    long l = 10
    ```
    <br>

    * **Narrowering** conversion requires an explicit cast as we are risking a possible loss of information
    ```Java
    loat a = 100.001f; <br>
    int b = (int)a; // Explicit cast, the float could lose info.
    ```

    <br>

* ## Objects <br><br>
    ![image](./res/java/328.png)

<br><br><br><br><br>
# Syntax
---
<br><br>

* ## strictfp
    *  Ensures that operation involving floating-points will remain platform independent

* ## final
    * On variable
        * creates constant
        * if not assined to any value, it can only be initialized:
            * **static:** in static block / method
            * **non-static:**  by class constructor
    * On method
        * prevents overriding
    * On class
        * prevents inheritance 
<br><br>
* ## instanceOf
    * compares instance with type

        ```Java
            Simple s = new Simple();  
            Simple s2 = null
            System.out.println(s instanceof Simple);
            System.out.println(s2 instanceof Simple);
        ```
        <blockquote>
        True <br>
        False
        </blockquote>
<br><br>
* ## Exception Handling
    <br>

    * ### Exception Class Hierarchy
    <br>

    * ![image](./res/java/3216.png)

    <br>
    
    * ### Types of Exception

        * **Checked Exception** - checked at compile-time, e.g ClassNotFoundException
        * **Unchecked Exception** - checked at run time, as they cannot be checked at compile-time, e.g ArithmaticException
        * **Error** - a special unchecked exception, cause program to exist since they are not recoverable, e.g OutOfMemoryError
        <br><br>

    * ### Exception propagation
        * [Checked exception](#Checked-Exception) not propagated

        * An exception is first thrown from the top of the [stack](#Runtime-Data-Area) and if it is not caught, it will propagade down the stack until caught or until it reaches the bottom of the stack

    <br>

    * [Overriding](#Runtime-Polymorphism) method of a subclass can only throw an [unchecked exception](#Unchecked-Exception) if the parent class method doesn't throw an expception

    <br>

    * ### Throw vs Throws
        |  Throw | Throws |
        |:----|:---|
        | followed by instance or used within the method | follwed by class or method signature
        | use to throw exception explicitly | used to declare an exception |
        | cannot throw multiple exceptions |  can declare multiple exceptions e.g method() throws Exception1, Exception2 
        |checked exception cannot be propapagated with throw only | checked exception can be propagated |

    <br>

    *   ```Java
        int a[] = new int[1];

        try {
            System.out.println("Access element three :" + a[2]);
        } 
        // catch blocks are optional, could be just try followed by finally
        catch (NullPointerException e) { 
            System.out.println("1 | Exception thrown  :" + e);
        } 
        catch (ArrayIndexOutOfBoundsException e) {
            System.out.println("2 | Exception thrown  :" + e);
        }
        //
        System.out.println("notice this get's printed");

        // finally block is always executed (no matter if exception didn't occur or  
        // occured and was hadndled or occured and wasn't handled)
        
        // finally block not executed on System.exit() or fatal error abort
        finally {
            System.out.println("The finally statement is executed");
        }
        ```
        <blockquote>
        Exception thrown  :java.lang.ArrayIndexOutOfBoundsException: Index 2 out of bounds for length 1
        The finally statement is executed           
        </blockquote>

        <br>

        ```Java
        int a[] = new int[1];

        try {
            System.out.println("Access element three :" + a[2]);
        } 
        catch (Exception e) {  // <---------------------------------------------------
            System.out.println("1 | Exception thrown  :" + e);
        } 
        catch (ArrayIndexOutOfBoundsException e) {
            System.out.println("2 | Exception thrown  :" + e);
        } 
        finally {
            System.out.println("The finally statement is executed");
        }
        ```
        <blockquote>
        exception java.lang.ArrayIndexOutOfBoundsException has already been caught
        </blockquote>

        <br>
        Since Exception is the base class for all the exceptions, it must be used at last to handle the exception. No class can be used after this.
        <br>

<br><br>
* ## native
    * method is implemented in native code e.g another programming language, could be C / C++ to access system or hardware resources or use an external library
<br><br>
* ## Static
    * belongs to the class, not to the the object
    * mark variable / method static if it's common across objects
    * no need to instantiate class to access static variable / method
    * memory efficient
    * static methods can't be overriden (design flaw IMO)
.
    <br><br>
    * ### Static block
        * Used to initialize static member
        * Executed before the main method, in Phase 3 of [Class Loader](#class-loader)
        * Can be used to executed program which doesn't have [Main method](#main-method)
    <br><br>
    * ### Static import
        <br>
        Allows us to access the static members of a class without class qualifications
        <br><br>

        ```Java
        import static java.lang.Math.*;
        
        public class Sample{
            public static void main(String args[]){
                // static import allows us to skip Math in Math.sqrt(169)
                // this is possible only because Math.sqrt() is static itself
                System.out.println(sqrt(169));
            }
        }
        ```
<br><br>
* ## super
    * [Final](#final) reference to the current object's immediate parent (can't be reassigned)
    * Whenever we create instance of subclass, an instance of the parent class is created implicity
<br><br>
* ## this
    * [Final](#final) reference to the current object (can't be reassigned)
    * Can be used to refer to [static](#static) members of the class (bad practise) 



<br><br><br><br><br>
# Misc
---
* ## Constructor
    * Used to initialize the objects
    * Cant' be abstract, final or static
    * ```this()``` can be used to invoke current class constructor
    * ```super()``` can be used to invoke immediate parent class constructor
    * Both ```this()```and ```super()```must be the first statement in the constructor hence they can't be together
    <br><br>
    * ```super()``` is implicitly called if no ```super()``` or ```this()``` is specfied
        ```Java
        class Animal{  
            Animal(){System.out.println("animal is created");}  
        }

        class Dog extends Animal{  
            Dog(){  
            System.out.println("dog is created");  
            }  
        }  

        class Test{  
            public static void main(String args[]){  
            Dog d=new Dog();  
            }         
        }  
        ```
        <blockquote>
        animal is created 
        <br>
        dog is created
        </blockquote>

    <br><br>
    * ### Chaining using ```this```
        ```Java
        public class Employee  
        {  
            int id,age;   
            String name, address;  
            public Employee (int age)  
            {  
                this.age = age;  
            }  
            public Employee(int id, int age)  
            {  
                this(age);  
                this.id = id;  
            }  
            public Employee(int id, int age, String name, String address)  
            {  
                this(id, age);  
                this.name = name;   
                this.address = address;   
            }  
            public static void main (String args[])  
            {  
                Employee emp = new Employee(105, 22, "Vikas", "Delhi");  
                System.out.println("ID: "+emp.id+" Name:"+emp.name+" age:"+emp.age+" address: "+emp.address);  
            }  
            
        }`
        ```
        <blockquote>
        ID: 105 Name:Vikas age:22 address: Delhi
        </blockquote>
    <br>

    * ### Chaining using ```super```
        ```Java
        class Person  
        {  
            String name,address;   
            int age;  
            public Person(int age, String name, String address)  
            {  
                this.age = age;  
                this.name = name;  
                this.address = address;  
            }  
        }  
        class Employee extends Person   
        {  
            float salary;  
            public Employee(int age, String name, String address, float salary)  
            {  
                super(age,name,address);  
                this.salary = salary;  
            }  
        }  
        public class Test   
        {  
            public static void main (String args[])  
            {  
                Employee e = new Employee(22, "Mukesh", "Delhi", 90000);  
                System.out.println("Name: "+e.name+" Salary: "+e.salary+" Age: "+e.age+" Address: "+e.address);  
            }  
        }
        ```
        <blockquote>
        Name: Mukesh Salary: 90000.0 Age: 22 Address: Delhi
        </blockquote>
<br><br>    
* ## Java Runtime Environment (JRE)
    * JVM + the libraries, and other components to run Java apps
<br><br>
* ## Java Development Kit (JDK)
    * JRE + plus tools such as the compilers and debuggers necessary for development of Java Apps
<br><br>
* ## OpenJDK
    * An open-source version of the Oracle JDK. the main difference is licensing
<br><br>
* ## Serialization
    * By implementing either Serializable or Externalizable ```interface```
      |Serializable|Externalizable|
      |:--:|:--:|
      [Marker interface](#marker-interface) | Not a [marker interface](#marker-interface)
      | serialization logic handled by java| serialization logic has to be implemented by us|
      | Easier to implement but at the cost of performance | Harder to implement but better performance

    <br>

    * Serializable ```ìnterface```:
        * [Java Reflection](#Java-Reflection) figures out how to [marshall / unmarshall](#marshalling) the objects

    * ```transient``` member are not seralized
        * however they can be serialized if:
            * the ```transient``` object is serialized in readObject / writeObject or readExternalizable / writeExternalizable
            * a custom serialization library is used
    * ```static``` member is implicitly ```transient```

    * To avoid serializing child of the serializable base class:
        * Implementing ```writeObject()``` or ```readObject()``` in the subclass which throws ```NotSerializableException```
<br><br>
* ## Multithreading

    <br>

    * ### Thread Vs Process
        ![image](./res/java/3221.png)
    * Each processes has its own memory space, while threads share the process's resources 
    * This makes thread communication more efficient and also problematic
    
    <br>

    * ### Thread Creation:
      |Thread Class| Runnable Interface|
      |:--:|:--:|
      | extends |implements
      | Each tread creates a unique object | Multiple threads share the same object
      | Various inbuild methods - getPriotiy() isAlive() etc...  | Single method - run()

    <br>

    * ### Thread Lifecycle
        <br>

        * New - Thread object created using ```new``` keyword, thread doesn't start until we call the ```start()```
        * Runnable - ```start()``` called, thread is ready but doesn't run until selected by the [thread scheduler](#thread-scheduler)
        * Running -  thread scheduler picks the read from the ready state and the thread is running
        * Non Runnable - thread is not running, but is still alive, or it is waiting for the other thread to finish
        * Terminated  - tread is terminated when the ```run()``` exits

            ![image](./res/java/3220.png)

    * ### Thread Scheduler    
        * Decides which tread should be executed
        * Determines the waiting time for a thread
        * Selects priority of a thread
        <br><br>
        * #### Schedules 
            * #### Preemptive
                * Highest priority thread executes until it enters the waiting or terminated state or a higher priority thread comes into existence
            * #### Time Slicing
                * Thread executes for a predefined amount of time and then reenters the pool of ready threads

    <br>

    * ### Synchronization
        * Controling access to a shared resouces used by multiple threads

        * Built around lock or monitor
            * Each object has a lock
            * Thread needing consistent access to an object's field has to acquire this lock
            * Thread no longer needing consistent access to an object's field releases this lock

            * Mutual Exclusive
                * Synchronized method
                * Synchrnoized block
                * static synchronization
                    * on method
                        * lock will be on the class not on the object

            * Cooperation (Inter-thread communication)

    * ### join()
        * waits for a thread to complete it's work

    * ### Wait() Vs Sleep()
    
      |Wait()|Sleep()|
      |:--:|:--:|
      | Defined in Object class | Defined in Thread class
      | Releases the lock | Doesn't release the lock

    <br>

    * ### volatile keyword
        * marks variable visible to all threads
        * good idea could be to mark a conditional check variable in the loop as ```volatile```

    <br>

    * ### Deadlock
        ![image](./res/java/3223.png)

        * Thread 1 starts to use Resource 1.
        * Thread 1 and Thread 2 try to start using Resource 2
        * Thread 2 'wins' and gets Resource 2 first
        * Now Thread 2 needs to use Resource 1
        * Resource 1 is locked by Thread 1, which is waiting for Resource 2

    <br><br>

    * ### Livelock
        * Similar to deadlock, except that the states of the threads involved is constantly changing with regard to another, none progressing.

    * ### Daemon thread
        * Low priority thread
        * Provide services to the [user threads](#user-threads)
        * Terminated by the JVM after all the user threads die

    * ### Shutdown hook
        * Thread invoked before [JVM Shutdown](#JVM-Shutdown).
        * Can be used to implement user-defined cleanup procedure

<br><br>
* ## Networking 

    * Client must know the IP address and port number of the server

    <br>

    * ### Connection-Oriented (TCP/IP)
        * Classes:
            * Socket
            * ServerSocket
    * ### Connectionless (UDP)
        * Classes:
            * DatagramSocket
            * DatagramPacket


<br><br>
* ## Reflection
    * Process of examining or modifying behavior of a class at run time
    * Can access all the class members (including private)
    * Used in debuggers, testing tools etc...

<br><br>
* ## Java Compiler
    *  Compiles ```.java``` (source code) into ```.class``` (bytecode)
<br><br>
* ## Abstraction
    * [Abstraction](#Abstraction) OO Principle
    * Achieved by
        * Abstract Class
            
        * Interface
            * all fields are public static final implicitly (if not specified they are implicitly  assigned)
            * Marker Interface
                * an empty interface
                * class will exhibits special behavior with respect to the interface implemented
                * e.g Serializable, Cloneable
    <br><br>
    * Common
        * can't be instantied
        * can have abstract methods, non-abstract methods, static methods, final methods
    * Difference

        | Abstract Class | Interface |
        |:----|:---|
        | class can **extend** only one class | class can **implement** multiple interfaces |
        | **Can** have Constructor| **Cannot** have  Constructor |
        | **Can** have Non-static fields | **Cannot** have Non-static members |
        | **Can** have state | **Cannot** have state (as all variables are public static final )|
    <br><br>
    * abstract method
        * can be used only in a abstract class, or interface
        * cannot be used to with [final](#final) specifier
<br><br>
* ## Multiple Inheritance
    * not supported in java to reduce complexity and prevent runtime errors
    ```Java
    class A{  
        void msg(){System.out.println("Hello");}  
    }  
    class B{  
        void msg(){System.out.println("Welcome");}  
    }  
    class C extends A,B  
        Public Static void main(String args[]){  
            C obj=new C();  
            obj.msg();//Now which msg() method would be invoked?  
        }  
    }  
    ```
    <blockquote>
    Compile Time Error
    </blockquote>
<br><br>
* ## Constant Pool
    * contains:
        * [literals](#literal) specified by programmer
        * [symbolic references](#symbolic-references) generated by compiler
<br><br>
* ## Run-Time Constant Pool
    * Per class  or per-interface run-time representation of the [constant pool]#(constant-pool) table in a .class file
<br><br>
* ## Package
    * Namespace to organized related classes and interfaces
    * To manage access control
    * Avoids file name clashes
<br><br>
* ## Compile-Time Polymorphism (Overloading)
    * also known as early binding, static binding, or static method dispach
    * faster execution but less flexibility than [runtime polymorphism](#Runtime-Polymorphism)
    * works **only** by modifying the method's parameters or as [covariant return type](#covariant-return-type)
<br><br>
* ## Runtime Polymorphism (Overriding)
    * also known as late binding, dynamic binding, or dynamic method dispatch.
    * slower execution but more flexibility than [compile-time polymorphism] (#Compile-Time-Polymorphism)
       ```Java
        class Animal{  
            int agility = 10;

            void makeSound(){
                System.out.println("silence")
            }  
        }

        class Dog extends Animal{  
            int agility = 5;

            void makeSound(){
                System.out.println("bark");   
            }

            public static void main(String args[]){  
                Animal obj = new Dog(); 
                System.out.println(obj.agility);  
                obj.makeSound();
            }
        }         
        ```
        <blockquote>
        10 <br>
        bark
        </blockquote>
        <br>
        As instance variables cannot be overriden, they are not subjected to runtime polymorphism
        <br><br>

    * ### Covariant return type
        * When method is overridden, the return type of the overriding method is allowed to be a subtype of the overriden method's return type
        <br><br>
        E.g, ```Object.clone()``` with return type of Object can be overriden as follows:

            ```Java
            public class Foo{
                ...

                // Note covariant return here, method does not just return Object
                public Foo clone(){
                    // Implementation
                }
            }
            ```

            The benefit is that any invoking ```Foo.clone()``` and know without casting that the return type value is an instance of ```Foo``` 
            <br><br>

            Without covariant return type, the overidden method in Foo would have to be declared to return ```Object``` hence the caller would have to explicitly [downcast](#casting) the result even though the caller know the return value can only ever be instance of ```Foo```

<br><br>
* ## Main method
    * if remove [static](#static) keyword from main method, and there is no [static block](#static-block) in our program, we get``` NoSuchMethodError```
    * If no args provided in CLI, the args[] will contain empty array, which is *not* null
    * can be overloaded, final
<br><br>
* ## Symbolic References
    * Names of classess, fields and methods referenced from the class
    * Used by JVM to link the class to other classes it depends on

    * E.g:
        ```Java
        System.out.println("Hello, world!");
        ```
        * Execute to inspect the [constant pool](#constant-pool) of a class :
        ```Shell
        > javap -verbose
        ```
        * Produces:
        ```
        0:   getstatic       #2; //Field java/lang/System.out:Ljava/io/PrintStream;         
        3:   ldc     #3; //String Hello, world!       
        5:   invokevirtual   #4; //Method java/io/PrintStream.println:(Ljava/lang/String;)cV 
        ```

        * #Number is symbol reference to the [constant pool](#constant-pool) <br>
            * #2 is a symbolic reference to ```System.out``` field <br>
            * #3 is a ```Hello, world!``` string <br>
            * #4 is a symbolic reference to ```PrintStream.println(String)V``` <br>
<br><br>
* ## Primitives
    ![image](./res/java/323.png)

    ![image](./res/java/3219.png)

    <br>

    * ### Wrapper Class
        * Allow primitive types to be access as objects:

            * Autoboxing
                * Converting primitives to objects
            * Unboxing
                * Converting objects to primitives
    
        <br>

        * Integer Wrapper Class

            * Maintains ```IntegerCache```, by default from values -128 to 127 in which Integer.valueOf() returns object of mentionted range from that cache 

                <br>

                ```Java
                Integer one = 100; 
                Integer two = 100;
                    
                if(one == two){ //returns true as one and two are pointing to the same object
                    System.out.println("a");
                }
                else if(one.equals(two)){
                    System.out.println("b");
                }
                else{
                    System.out.println("c");
                }
                ```
                <blockquote>
                a
                </blockquote>

                <br>

                ```Java
                Integer one = 200; 
                Integer two = 200;
                    
                if(one == two){ //returns false as 200 > 127, hence the two Integers are not pointing to the same object
                    System.out.println("a");
                }
                else if(one.equals(two)){
                    System.out.println("b");
                }
                else{
                    System.out.println("c");
                }
                ```
                <blockquote>
                b
                </blockquote>
<br><br>
* ## Default Values
    * ### Instance variable
        * for primitives:
            [primitives default value](#primitives)
        * for objects:
            null
    * ### Local variable
        * undefined
<br><br>
* ## Dynamic Linking
    * translates [symbolic method references](#symbolic-references) into concrete method references, loading classes as necessary to resolve as-yet-undefined symbols, and translates variable accesses into appropriate offsets in storage structures associated with the run-time location of these variables.

<br><br><br><br><br>
# Copying Values from one object into another
---
* ## Manually assigning the values of one object into another
* ## Object.clone()
    * creates 
* ## By Constructor
    ```Java
    class Student{  
        int age;  
        String name;  

        Student(int age, String name){  
        this.age = age;  
        this.name = name;  
        }  
        
        //constructor to initialize another object  
        Student(Student student){  
        this.age = student.age;  
        this.name =student.name;  
        }
        
        public String toString() {
        return age + " " + name;
    }
    }  

    Student student1 = new Student(25,"Peter");  
    Student student2 = new Student(student1);  

    System.out.println(student1);
    System.out.println(student2);
    ```
<br><br><br><br><br>
# Order of Operations
---
```Java
// left operations has precedence over the right operations

System.out.println(10 + 20 + "Javatpoint");
System.out.println("Javatpoint" + 10 + 20);
```
---
<blockquote>
30Javatpoint <br>
Javatpoint1020
</blockquote> <br>

```Java
// * has precedence over + 

System.out.println(10 * 20 + "Javatpoint");   
System.out.print("Javatpoint" + 10 * 20);   // as * has precedence over +
```
<blockquote> 
200Javatpoint <br>
Javatpoint200
</blockquote> <br>

```Java
// / has precedence over = hence we divide integers first and then assign to double

double result = 9 / 2;   
System.out.println(result);
```
<blockquote> 
4.0
</blockquote> <br>

```Java
// In Java, for binary operator (division, asignment etc...) the operands must be of the same type. Namely in ```9 / 2 ``` Both 9 and 2 must be of the same type. If they are not the same type, we will do an implicit conversion 
// binary operator's operands must be of same type so first convert 2 to double, then do division, and then assign to double

double result = 9.0 / 2; 
System.out.println(result);
```
<blockquote> 
4.5
</blockquote> <br>

<br><br><br><br><br>
# I / O
---
* ## Stream
    * Sequence of data flowing from source to destination
<br><br>
* ## Byte streams
    * byte:  8-bit byte
    * use when not working with character stream e.g image, video 
    <br><br>
    ![image](./res/java/p17.jpg)
<br><br>
* ## Character Streams
    * character: 16-bit Unicde System
    * use when working with characters e.g textfile
    <br><br>
    ![image](./res/java/p18.jpg)


<br><br><br><br><br>
# Garbage Collector
---
* Process of removing the unreferenced objects from the memory
    <br><br>
    *  Objects can be unreferenced by:
        <br>
        * Nulling the reference
            ```Java
            Employee e = new Employee();  
            e = null;             
            ```
        <br>

        * Assigning the reference to another
            ```Java
            Employee e1 = new Employee();  
            Employee e2 = new Employee();  
            e1 = e2; // now the first object referred by e1 is available for garbage collection           
            ```
        <br>

        * Anonymous object
            ```Java
            new Employees();
            ```
* Is a [Daemon thread](#daemon-thread)
<br>

* ## Trade-offs
    * **Footprint:** Amount of memory required by GC to run
    * **Throughput:**: Percentage of total time not spend in garbage collection
    * **Latency:** Amount of time code has to pause for GC to run 
<br><br>
* ## Generational Hypothesis
    * most objects die young, hence the GC algorithms usually split the heap into two generations:    
        * #### Young Generation
            * Splits into:
                * #### Eden space:
                for newly allocated objects   
                * #### Survival space:
                after object survives first GC
        <br>
        
        * #### Old Generation
            * Objects move here after surviging multiple GC 
            * uses memory-efficient algorithm
        
        ![image](./res/java/3213.png)
<br><br>
* ## Implementations
    * ### Serial Garbage Collector
        * single-threaded garbage collection, freezes all app threads
        * smallest footprint of any collectors
        * lacks multi-threading support (not suitable for server environments)
        * great for programs with limited memory or if CPU is running lot of JVMs (helps limit GC impact on other JVMS as no other threads in the CPU are affected by this GC)
    * ### Parallel Collector
        * multiple-threaded garbage collection but still freezes all app threads
        * in shortest amount of time, it will be able to collect the highest amount of garbage possible on multi-processor systems
        * great for batch apps (i.e apps that can bear application pauses)
    * ### CMS Collector
        * depracted
    * ### G1 Collector ###todo
        * JVM's default collector and replacement for CMS collector
        * Ability to configure the max pause time
        * most of work done concurrently (to minimize freezing of app threads)
        * uses non-continous space, which is very efficient for large heaps (divids heap into small chunks):
        ![image](./res/java/3214.png)
        * run GC on [Eden space], all survived objects gets copied to [Unassigned space], this [Unassigned space] becomes a [Survival space] and [Eden space] becomes [Unassigned space]

        * G1 instead of clearing the entire heap or large space as in other GC, it only clears those small chunks in memory that are ful or almost full
        * great for apps which need predictable latency (due to maxTargetPauseTime) 