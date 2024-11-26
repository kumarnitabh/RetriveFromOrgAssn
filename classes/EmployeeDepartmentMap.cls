/**
 * Description : Mapping a list
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 26/11/2024
 * 
 * Revision Logs :  V_1.0 - Created
 */

public class EmployeeDepartmentMap {

/**
 * Description : This method is used to map a record 
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 26/11/2024
 * 
 * Revision Logs :  V_1.0 - Created
 */

    public static void employeesData() {

        Map<String, List<String>> mapOfDepartmentToEmployees =new Map<String, List<String>>();

        mapOfDepartmentToEmployees.put('IT',new List<String>{'R','A','C'});
        mapOfDepartmentToEmployees.put('Sales',new List<String>{'P','Q','R'});
        mapOfDepartmentToEmployees.put('Marketing',new List<String>{'S','T','U'});

        System.debug(mapOfDepartmentToEmployees);

    }
}
