public class Assignment1 {
    public static void Assignment1() {

        Map<String, List<String>> DataOfEmployee =new Map<String, List<String>>();

        DataOfEmployee.put('IT',new List<String>{'R','A','C'});
        DataOfEmployee.put('Sales',new List<String>{'P','Q','R'});
        DataOfEmployee.put('Marketing',new List<String>{'S','T','U'});

        System.debug(DataOfEmployee);

    }
}