/**
 * Description : Take 2 sets and perform Union, Intersection and Difference sets.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 26/11/2024
 *
 * Revision Logs :  V_1.0 - Created
 */

public  class OperationsOnSet {

/**
 * Description : This method is used to perform the operation like intersection, Union and difference on setOfStudents1 and setOfStudents2
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 26/11/2024
 * 
 * Revision Logs :  V_1.0 - Created
 */

    public static void differentOperationsOnSet () {

        // Set of students1 
        Set<String> setOfStudents1 = new Set<String>();

        // Adding values in Set1 
        setOfStudents1.add('Tom');
        setOfStudents1.add('Mark');
        setOfStudents1.add('Harry');
        
		// Set of students2
        Set<String> setOfStudents2 = new Set<String>();

        // Adding values in Set2        
        setOfStudents2.add('Brook');
        setOfStudents2.add('Travis');
        setOfStudents2.add('Tom');
        
        // Intersection of Both sets        
        Set<String> intersectionOfStudent=new Set<String>(setOfStudents1);
        intersectionOfStudent.retainall(setOfStudents2);

        // Union of Both sets        
        Set<String> unionOfStudent=new Set<String>(setOfStudents1);
        unionOfStudent.addall(setOfStudents2);

        // Difference of Both sets        
        Set<String> differenceOfStudent=new Set<String>(setOfStudents1);
        differenceOfStudent.removeall(setOfStudents2);
        
        // Debugging Intersection, Union & Difference        
        System.debug(intersectionOfStudent);
        System.debug(unionOfStudent);
        System.debug(differenceOfStudent);
    }
}
