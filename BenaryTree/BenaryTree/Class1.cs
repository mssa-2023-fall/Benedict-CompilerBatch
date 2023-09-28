namespace BenaryTree;

public class Node
{
    public int data;
    public Node left, right;

    public Node(int item)
    {
        data = item;
        left = right = null;
    }
}

public class BinaryTree
{
    public Node root;

    public BinaryTree()
    {
        root = null;
    }

    public void insert(Node root, int key)
    {
        if (root == null)
        {
            root = new Node(key);
            return;
        }

        if (key < root.data)
        {
            if (root.left == null)
            {
                root.left = new Node(key);
                return;
            }

            insert(root.left, key);
        }
        else if (key > root.data)
        {
            if (root.right == null)
            {
                root.right = new Node(key);
                return;
            }
            insert(root.right, key);
        }
    }

    public void inorder(Node root)
    {
        if (root != null)
        {
            inorder(root.left);
            Console.WriteLine(root.data +" ");
            inorder(root.right);
        }
    }
}
