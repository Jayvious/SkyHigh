global class StudentWrapper implements Comparable {

    public Student__c student;

    public StudentWrapper() {

    }

    global integer compareTo(Object compareTo){

        ClassMeetingTimeWrapper cmtCompare = (ClassMeetingTimeWrapper)compareTo;

        if (cmt.Start_Time__c > cmtCompare.cmt.Start_Time__c)
            return 1;
        else if (cmt.Start_Time__c < cmtCompare.cmt.Start_Time__c)
            return -1;
        else {
            return 0;
        }
    }

}
