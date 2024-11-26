/**
 * Description : Mapping a list
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 26/11/2024
 * 
 */

public class EmployeeDepartmentMap {
    public static void employeeData() {

        Map<String, List<String>> dataOfEmployee =new Map<String, List<String>>();

        dataOfEmployee.put('IT',new List<String>{'R','A','C'});
        dataOfEmployee.put('Sales',new List<String>{'P','Q','R'});
        dataOfEmployee.put('Marketing',new List<String>{'S','T','U'});

        System.debug(dataOfEmployee);

    }
}