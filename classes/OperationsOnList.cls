/**
 * Description : List is created of Integer add some random numbers in it and sort the list.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 26/11/2024
 *
 * Revision Logs :  V_1.0 - Created
 */

public  class OperationsOnList {

 /**
 * Description : This method is created to have a list of numbers and then add all the records of another list and sort them.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 26/11/2024
 * 
 * Revision Logs :  V_1.0 - Created
 */

    public static void SortedList() {

        List<Integer> listOfNumbers =new List<Integer>();
            
        List<Integer> listOfRandomNumbers=new List<Integer>{3,43,12,76,11,32,91,62,72,37};

        listOfNumbers.addall(listOfRandomNumbers);

        listOfNumbers.sort();

        System.debug(listOfNumbers);

    }
}
