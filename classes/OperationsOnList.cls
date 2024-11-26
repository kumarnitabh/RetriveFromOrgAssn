/**
 * Description : Created a list add random numbers then sort it 
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 26/11/2024
 *
 * Revision Logs :  V_1.0 - Created
 */

public  class OperationsOnList {

 /**
 * Description : This method is used to sort the list  
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
