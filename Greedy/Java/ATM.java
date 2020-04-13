import java.util.Arrays;
import java.util.Scanner;

public class ATM {
    public static void main(String[] args) {
       Scanner sc = new Scanner(System.in);

       int num = sc.nextInt();

       int[] time = new int[num];

       for(int i =0; i<num; i++) {
           time[i] = sc.nextInt();
       }

       int min = 0;
       Arrays.sort(time); // 정렬
       int sum = 0;

       for(int i =0; i<time.length; i++){
          min+=time[i];
          sum+=min;
       }

       System.out.println(sum);
    }
 }
 