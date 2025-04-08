import java.util.*;
public class Palindrome {
    public static void main (String args[]){
     Scanner scanner = new Scanner(System.in);
     System.out.print("Enter a number:");
     int number = scanner.nextInt();
     
     if(isPalindrome(number)){
     System.out.print(number +"is a palindrome");

     }
     else{
        System.out.println(number+"is not a palindrome");
     }
     scanner.close();
    }
    public static boolean isPalindrome(int number){
        String original = String.valueOf(number);
        String reversed = new StringBuilder(original).reverse().toString();
        return original.equals(reversed);
    }
}




