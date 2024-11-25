public  class Assignment1Part2 {
    public static void Assignment1Part2() {

        // Set1 of students 
        
        Set<String> StudentSet1 = new Set<String>();
        
        // Adding values in Set1 

        StudentSet1.add('Tom');
        StudentSet1.add('Mark');
        StudentSet1.add('Harry');
        
		// Set2 of students
		
        Set<String> StudentSet2 = new Set<String>();

        // Adding values in Set2 
        
        StudentSet2.add('Brook');
        StudentSet2.add('Travis');
        StudentSet2.add('Tom');
        
        // Intersection of Both sets
        
        Set<String> IntersectionOfStudent=new Set<String>(StudentSet1);
        IntersectionOfStudent.retainall(StudentSet2);

        // Union of Both sets
        
        Set<String> UnionOfStudent=new Set<String>(StudentSet1);
        UnionOfStudent.addall(StudentSet2);

        // Difference of Both sets
        
        Set<String> DifferenceOfStudent=new  Set<String>(StudentSet2);
        DifferenceOfStudent.removeall(StudentSet1);
        
        // Debugging Intersection, Union & Difference
        
        System.debug(IntersectionOfStudent);
        System.debug(UnionOfStudent);
        System.debug(DifferenceOfStudent);
    }
}