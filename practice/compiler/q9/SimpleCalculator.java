/**
 * Simple Java program that demonstrates basic syntax and operations
 * This program calculates the sum and average of three numbers
 */
public class SimpleCalculator {
    
    /**
     * Main method - entry point of the program
     * @param args command line arguments (not used in this example)
     */
    public static void main(String[] args) {
        // Declaring variables to store our numbers
        int num1 = 10;
        int num2 = 20;
        int num3 = 30;
        
        // Calculate sum
        int sum = calculateSum(num1, num2, num3);
        
        // Calculate average
        double average = calculateAverage(sum, 3);
        
        // Display results
        System.out.println("Number 1: " + num1);
        System.out.println("Number 2: " + num2);
        System.out.println("Number 3: " + num3);
        System.out.println("Sum: " + sum);
        System.out.println("Average: " + average);
    }
    
    /**
     * Method to calculate the sum of three numbers
     * @param a first number
     * @param b second number
     * @param c third number
     * @return sum of the three numbers
     */
    public static int calculateSum(int a, int b, int c) {
        // Adding all three numbers
        return a + b + c;
    }
    
    /**
     * Method to calculate the average of a sum
     * @param sum the sum of numbers
     * @param count the count of numbers
     * @return the average value
     */
    public static double calculateAverage(int sum, int count) {
        // Avoiding division by zero
        if (count == 0) {
            return 0;
        }
        
        // Calculating average
        return (double) sum / count;
    }
}