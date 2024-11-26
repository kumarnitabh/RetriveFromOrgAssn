/**
 * Description : Created a list add random numbers then sort it 
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 26/11/2024
 * 
 */

public  class OperationsOnList {
    public static void sortedList() {

        List<Integer> numbersList =new List<Integer>();
            
        List<Integer> randomNumbers=new List<Integer>{3,43,12,76,11,32,91,62,72,37};

        numbersList.addall(randomNumbers);

        numbersList.sort();

        System.debug(numbersList);

    }
}
