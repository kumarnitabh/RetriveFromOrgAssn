/**
 * Description : Take 2 sets and perform Union, Intersection and Difference sets.
 * 
 * Created By : Kumar Nitabh
 * 
 * Created on : 26/11/2024
 * 
 */

public  class OperationsOnSet {
    public static void setDifferentOperation () {

        // Set1 of students 
        Set<String> studentSet1 = new Set<String>();

        // Adding values in Set1 
        studentSet1.add('Tom');
        studentSet1.add('Mark');
        studentSet1.add('Harry');
        
		// Set2 of students
        Set<String> studentSet2 = new Set<String>();

        // Adding values in Set2        
        studentSet2.add('Brook');
        studentSet2.add('Travis');
        studentSet2.add('Tom');
        
        // Intersection of Both sets        
        Set<String> intersectionOfStudent=new Set<String>(studentSet1);
        intersectionOfStudent.retainall(studentSet2);

        // Union of Both sets        
        Set<String> unionOfStudent=new Set<String>(studentSet1);
        unionOfStudent.addall(studentSet2);

        // Difference of Both sets        
        Set<String> differenceOfStudent=new Set<String>(studentSet2);
        differenceOfStudent.removeall(studentSet1);
        
        // Debugging Intersection, Union & Difference        
        System.debug(intersectionOfStudent);
        System.debug(unionOfStudent);
        System.debug(differenceOfStudent);
    }
}