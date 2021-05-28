@isTest
public class StudentScheduleTest {

    //Teacher__c teach = [SELECT Name From Teacher__c where ID = 'a0N5e000000RAQhEAO'];
    // Teacher needs education and Name
    // Class needs Name, Class Size, and Teacher
    // CMT needs Class, Day__c, Start_Time__c, End_Time__c
    // Student needs Name, GPA, Grade Level, and Graduation Date
    // jC needs Name, Class, and Student 

    private static Student__c newStudent(){
        return new Student__c(Name='Test', GPA__c=3.0, Grade_Level__c='11th', Graduation_Date__c=Date.newInstance(2022, 1, 1));
    }
    private static Teacher__c newTeacher(){
        return new Teacher__c(Name='Test', Education__c='Masters');
    }
    private static Class__c newClass(){
        return new Class__c(Name='Test');
    }
    private static List<Class_Meeting_Time__c> newTimes(Class__c tClass){
        List<Class_Meeting_Time__c> tTimes = new List<Class_Meeting_Time__c>();
        tTimes.add(new Class_Meeting_Time__c(Class__c=tClass.Id, Day__c='Monday', Start_Time__c=Time.newInstance(10, 0, 0, 0), End_Time__c=Time.newInstance(11, 0, 0, 0)));
        tTimes.add(new Class_Meeting_Time__c(Class__c=tClass.Id, Day__c='Tuesday', Start_Time__c=Time.newInstance(10, 0, 0, 0), End_Time__c=Time.newInstance(11, 0, 0, 0)));
        tTimes.add(new Class_Meeting_Time__c(Class__c=tClass.Id, Day__c='Wednesday', Start_Time__c=Time.newInstance(10, 0, 0, 0), End_Time__c=Time.newInstance(11, 0, 0, 0)));
        tTimes.add(new Class_Meeting_Time__c(Class__c=tClass.Id, Day__c='Thursday', Start_Time__c=Time.newInstance(10, 0, 0, 0), End_Time__c=Time.newInstance(11, 0, 0, 0)));
        tTimes.add(new Class_Meeting_Time__c(Class__c=tClass.Id, Day__c='Friday', Start_Time__c=Time.newInstance(10, 0, 0, 0), End_Time__c=Time.newInstance(11, 0, 0, 0)));
        return tTimes;
    }
    
    /*
    @testSetup
    private static void loadTestData(){
        Student__c tStudent = newStudent();
        insert tStudent;
        Teacher__c tTeacher = newTeacher();
        insert tTeacher;
        Class__c tClass = newClass();
        insert tClass;
        List<Class_Meeting_Time__c> tTimes = newTimes(tClass);
        insert tTimes;
    }
    */

    @isTest
    private static void ensureDoW(){

    }

    @isTest
    public static void ensureStudentVar() {
        Student__c tStudent = newStudent();
        insert tStudent;
        StudentScheduleController tSST = new StudentScheduleController();
        System.assertEquals(tSST.currentStudent, tStudent);
    }

    @isTest
    private static void ensureClassList(){
        Student__c tStudent = newStudent();
        insert tStudent;
        Class__c tClass = newClass();
        insert tClass;
        StudentScheduleController tSST = new StudentScheduleController();
        System.assertEquals(tSST.currentStudent, tStudent);
    }

    @isTest
    private static void ensureMeetingTimeList(){
        Student__c tStudent = newStudent();
        insert tStudent;
        Class__c tClass = newClass();
        insert tClass;
        List<Class_Meeting_Time__c> tTimes = newTimes(tClass);
        insert tTimes;
        StudentScheduleController tSST = new StudentScheduleController();
        System.assertEquals(tSST.todaysClassTimes, tTimes);
    }

    @isTest
    private static void ensureMeetingTimeSort(){

    }
}