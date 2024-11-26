/**
 * Description : Created a list add random numbers then sort it 
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 26/11/2024
 * 
 */

public  class OperationsOnList {
    public static void SortedList() {

        List<Integer> NumbersList =new List<Integer>();
            
        List<Integer> RandomNumbers=new List<Integer>{3,43,12,76,11,32,91,62,72,37};

        NumbersList.addall(RandomNumbers);

        NumbersList.sort();

        System.debug(NumbersList);

    }
}