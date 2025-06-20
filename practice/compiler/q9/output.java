
public class SimpleCalculator {
    
    
    public static void main(String[] args) {
        
        int num1 = 10;
        int num2 = 20;
        int num3 = 30;
        
        
        int sum = calculateSum(num1, num2, num3);
        
        
        double average = calculateAverage(sum, 3);
        
        
        System.out.println("Number 1: " + num1);
        System.out.println("Number 2: " + num2);
        System.out.println("Number 3: " + num3);
        System.out.println("Sum: " + sum);
        System.out.println("Average: " + average);
    }
    
    
    public static int calculateSum(int a, int b, int c) {
        
        return a + b + c;
    }
    
    
    public static double calculateAverage(int sum, int count) {
        
        if (count == 0) {
            return 0;
        }
        
        
        return (double) sum / count;
    }
}