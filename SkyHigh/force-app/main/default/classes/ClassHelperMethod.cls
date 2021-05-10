public class ClassHelperMethod {
    
    public static void deleteClass(List<Class__c> cList){
        //List<Task> tClass = new List<Task> tClass;
        for(Class__c c : cList){
            if(c.Class_Count__c > 0){
                c.addError('Class still has students connected to class. Please review the students in class.');
            }
        } 
    }
 
}