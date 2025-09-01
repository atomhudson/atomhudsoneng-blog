---
title: "_023_BinaryTree - Java Code Documentation"
date: 2025-09-01T17:42:01.856Z
description: "Auto-generated documentation for Data_Structures/_023_BinaryTree.java"
tags: ["java", "code-documentation", "automated"]
---

# _023_BinaryTree.java Documentation

# Java Binary Tree Implementation and Traversal

This Java code implements a binary tree data structure and provides methods for two specific tree traversals: level order traversal (with alternating direction) and finding all paths with a given sum.

## 1. Overview

The code defines a `Node` class representing a node in the binary tree, containing an integer `value`, and left and right child nodes.  Two primary functionalities are implemented:

* **`levelOrderTraversalII(Node root)`:** Performs a level order traversal of the binary tree, alternating the traversal direction (left-to-right, then right-to-left, and so on) for each level.  It returns a list of lists, where each inner list represents a level in the tree.

* **`pathSum(Node root, int targetSum)`:** Finds all root-to-leaf paths in the binary tree that sum up to a given `targetSum`. It returns a list of lists, where each inner list represents a path.

## 2. Detailed Explanation of Key Methods and Classes

### 2.1 `Node` Class

```java
public static class Node {
     Node left;
     int value;
     Node right;
     Node(int value) {
         this.value = value;
     }
}
```

This inner class represents a node in the binary tree. It contains:

* `left`: A reference to the left child node.
* `value`: An integer value stored in the node.
* `right`: A reference to the right child node.
* `Node(int value)`: Constructor to create a new node with a given value.


### 2.2 `heightOfTree(Node root)`

```java
static int heightOfTree(Node root){
    if (root==null)return 0;
    return 1+Math.max(heightOfTree(root.left),heightOfTree(root.right));
}
```

This method recursively calculates the height of the binary tree.  The height is the number of edges on the longest path from the root to a leaf node.  An empty tree has a height of 0.

### 2.3 `levelOrderTraversalII(Node root)`

```java
static List<List<Integer>> levelOrderTraversalII(Node root){
    int height = heightOfTree(root);
    List<List<Integer>> ans = new ArrayList<>();
    for (int i = height; i > 0 ; i--) {
        boolean leftToRight = (height - i) % 2 == 0;
        ans.add(traversal(root, i, leftToRight));
    }
    return ans;
}
```

This method performs a level order traversal with alternating directions. It first determines the height of the tree. Then, it iterates through each level from the bottom up, calling the `traversal` helper method to get the nodes at that level. The `leftToRight` boolean variable controls the traversal direction.

### 2.4 `traversal(Node root, int level, boolean leftToRight)`

```java
private static List<Integer> traversal(Node root,int level,boolean leftToRight){
    if (root == null) return new ArrayList<>();
    List<Integer> arr = new ArrayList<>();
    if (level == 1){
        arr.add(Integer.valueOf(root.value));
        return arr;
    }
    if (leftToRight){
        arr.addAll(traversal(root.left,level-1,leftToRight));
        arr.addAll(traversal(root.right,level-1,leftToRight));
    }else{
        arr.addAll(traversal(root.right,level-1,leftToRight));
        arr.addAll(traversal(root.left,level-1,leftToRight));
    }
    return arr;
}
```

This recursive helper method retrieves the nodes at a given level. If `leftToRight` is true, it traverses left then right; otherwise, it traverses right then left.

### 2.5 `pathSum(Node root, int targetSum)`

```java
public static List<List<Integer>> pathSum(Node root, int targetSum) {
    List<List<Integer>> allPaths = new ArrayList<>();
    dfs(root, new ArrayList<>(),0,targetSum ,allPaths);
    return allPaths;
}
```

This method initiates the Depth-First Search (DFS) to find all paths that sum to `targetSum`.

### 2.6 `dfs(Node root, List<Integer> path, int currentSum, int targetSum, List<List<Integer>> allPaths)`

```java
private static void dfs(Node root, List<Integer> path,int currentSum ,int targetSum,List<List<Integer>> allPaths) {
    if (root == null) return;
    path.add(Integer.valueOf(root.value));
    currentSum+=root.value;
    if (root.left == null && root.right == null && currentSum == targetSum) {
        allPaths.add(new ArrayList<>(path));
    } else {
        dfs(root.left, path,currentSum, targetSum, allPaths);
        dfs(root.right, path,currentSum, targetSum, allPaths);
    }
    path.remove(path.size() - 1);
}
```

This recursive helper method performs a Depth-First Search (DFS) to find all paths. It adds the current node's value to the `path` and `currentSum`. If a leaf node is reached and the `currentSum` equals the `targetSum`, the `path` is added to `allPaths`.  The backtracking step (`path.remove(path.size() - 1)`) is crucial for exploring other paths.


## 3. Code Workflow and Logic Flow

The `main` method creates a sample binary tree and then calls `levelOrderTraversalII` to perform the alternating level order traversal and `pathSum` to find paths summing to 22.  Both methods use recursion to traverse the tree. `levelOrderTraversalII` uses a helper function to traverse each level in a specified order, while `pathSum` uses DFS to explore all paths from the root to leaves.

## 4. Use Cases and Examples

* **Level Order Traversal:** Useful for visualizing the tree structure level by level,  and for algorithms that process nodes level by level (e.g., breadth-first search).  The alternating direction adds a variation to the standard level order traversal.

* **Path Sum:**  Useful in problems where you need to find combinations of node values that add up to a specific target.  For instance, finding combinations of expenses that equal a budget.

The `main` method demonstrates both use cases with a sample tree.  The output of `levelOrderTraversalII` will be a list of lists representing the tree levels, traversed alternately left-to-right and right-to-left. The `pathSum` method, when called with `targetSum = 22`, will identify and print paths in the tree that sum to 22.


## 5. Important Notes and Considerations

* **Error Handling:** The code lacks explicit error handling (e.g., for null root).  Production-ready code should include checks for null inputs.

* **Efficiency:** The `levelOrderTraversalII` method has a time complexity of O(N), where N is the number of nodes, due to visiting each node once.  The `pathSum` method also has a time complexity of O(N) in the worst case (when all paths need to be explored).  Space complexity for both methods is O(W) where W is the maximum width of the tree for `levelOrderTraversalII` and O(H) where H is the height of the tree for `pathSum`, due to the recursive calls.

* **Generics:** The `Node` class could be made more generic by using a type parameter `<T>` for the `value` field to allow storing different data types.


This detailed explanation should provide a comprehensive understanding of the provided Java code. Remember to handle edge cases and consider efficiency improvements for production environments.


---
*This documentation was automatically generated from the source code.*
