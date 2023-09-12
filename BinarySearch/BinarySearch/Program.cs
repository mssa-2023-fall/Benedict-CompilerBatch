using System.Runtime.CompilerServices;

public class BinarySearch
{
    public static void Main(string[] args)
    {
        int[] array = new int[100];
        int target = 33;
        for (int i = 0; i < array.Length; i++)
        {
            array[i] = i;
        }
        int index = benarySearch(array, target);
       
        if (index == -1)
        {
            Console.WriteLine($"{target} not found");
        }
        else
        {
            Console.WriteLine($"target found at position {index}");
        }
        
    }

    public static int benarySearch(int[] array, int target)
    {
        int start = 0;
        int end = array.Length -1;

        while (start <= end)
        {
            int middle = start + (end - start) / 2;
            int value = array[middle];
           
            if (value < target) {start = middle + 1;}
            else if (value > target) {start = middle - 1;}
            else {return middle;}

        }
        
        return -1;
    }
}