public with sharing class TeacherExtension {
    private final Teacher__c teach;

    public TeacherExtension(ApexPages.StandardController stdController){
        teach = (Teacher__c)stdController.getRecord();
        init();
    }

    public TeacherExtension(Teacher__c te){ //overloaded method for testing
        this.teach = te;
        init();
    }

    private void init(){
        if(classes==null){
            classMap = new Map<Id,Class__c>([SELECT Name, Campus__r.name ,Teacher__r.name, (SELECT NAME FROM Junctions__r) From Class__c WHERE Teacher__r.id = :teach.id]);
            classes = new List<WrapperStudent>();
            for(Class__c c : classMap.values()){
                classes.add(new WrapperStudent(c,new List<Junction_Class__c>(), new List<Class_Meeting_Time__c>()));
                indexMap.put(c.id,classes.size()-1);
            }

            List<Class_Meeting_Time__c> meetingTime = [SELECT Name, Start_Time__c, End_Time__c, Day__c, Class__r.id FROM Class_Meeting_Time__c where Class__r.ID in :indexMap.keySet()];
            for (Class_Meeting_Time__c CMT : meetingTime){
                classes[indexMap.get(CMT.class__r.id)].meetingTime.add(CMT);
            }
        }
        if(junctionClasses==null){
            junctionClasses = new List<Junction_Class__c>([SELECT NAME, Student__r.name ,Class__r.id FROM Junction_Class__c WHERE Class__r.ID in :indexMap.keySet()]);
            for(junction_class__c jC: junctionClasses){
                classes[indexMap.get(jC.class__r.id)].jC.add(jC);
            }
        }
    }

    public Map<Id,Class__c> classMap; 
    
    public Map<Id,Integer> indexMap{ // returns the index of an Object in a list. Trying to avoid double for loops.
        get{
            if(indexMap==null)
                indexMap = new Map<Id,Integer>();
            return indexMap;
        }
        private set;
    }

    public class WrapperStudent{
        public Class__c classVar{
            get;
            private set;
        }
        public List<Junction_Class__c> jC{
            get;
            private set;
        }
        public List<Class_Meeting_Time__c> meetingTime{
            get;
            private set;
        }
        /*public Boolean availableToday(){
            if(Date.today().weekday()){

            }
        }*/
        public WrapperStudent(Class__c cl, List<Junction_Class__c> jC, List<Class_Meeting_Time__c> CMT){
            this.classVar = cl;
            this.jC = jC;
            this.meetingTime = CMT;
        }
    }

    public List<WrapperStudent> classes {get; private set;}

    public List<Junction_Class__c> junctionClasses {get; private set;}

    public List<Student__c> students {get; private set;}
}