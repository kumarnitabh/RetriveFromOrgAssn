/**
 * Description : Map is created where key is Department name and Value is List of Employees name.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 26/11/2024
 * 
 * Revision Logs :  V_1.0 - Created
 */

public class EmployeeDepartmentMap {

/**
 * Description : This method is created to insert Department and Employee name to variable mapOfDepartmentToEmployees
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
