namespace BenaryTree;

public class Program
{
    public static void Main()
    {
        BinaryTree tree = new BinaryTree();

        tree.root = new Node(1);
        tree.root.left = new Node(2);
        tree.root.right = new Node(3);
        tree.root.left.left = new Node(4);
        tree.root.left.right = new Node(5);
        
        Console.WriteLine("traversal of binary tree is: ");
        tree.inorder(tree.root);

        int key = 6;
        tree.insert(tree.root, key);
        Console.WriteLine("\n traversal of binary tree after insertion is: ");
        tree.inorder(tree.root);
    }
}