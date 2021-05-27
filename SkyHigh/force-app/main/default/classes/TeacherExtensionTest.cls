@isTest(SeeAllData=true)
public with sharing class TeacherExtensionTest {
    @isTest
    private static void TeacherExtensionTest() {
        Teacher__c teach = [SELECT Name From Teacher__c where ID = 'a0N5e000000RAQhEAO'];
        System.debug(teach.name);
        TeacherExtension teachTest = new TeacherExtension(teach);
        System.debug(teachTest.classes[0]);
    }
}