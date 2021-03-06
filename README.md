## Project 1 -- Experience Cloud Site for Sky High School Org

### Overview

The Sky High Salesforce org was created to replicate the operations of a high school. To do that we created a ERD (Entity-Relationship Diagram), which included objects related to school and the school environment (e.g Student, Teacher, Student Counselor, Classes, etc). From the ERD, we created the org with proper Object-Level, Field-Level, and Record-Level security to ensure that our org was used in the correct way. To further ehnace the org, we used out-of-the-box Process Automation tools (e.g Process Builder, Flow Builder, Approval Process) to streamline operatations. Using Apex, we continued to make our org more dynamic through the use of Apex Triggers and tested those triggers intesively. Our aim for this project was to create an administrative portal for staff members of the fictional Sky High School highschool, which could be used to view staff and student schedules, add new students, and track student graduation progress.

### Features

##### New Student Form:
###### This is a form that can be used to add a new student directly to the Salesforce database.

##### Graduation Progress Page:
###### A page that shows a number of statistics for students at the school, such as their current GPA, student counselor, and whether or not they have been approved for graduation. There are features that will change the color of certain texts to visually represent criteria that has been met on that field so users can easily see the proper representations of the list view. 

##### Teacher Schedule Page:
###### A page that displays a list of teachers, with a link to their respective schedules. Each schedule displays the teacher's schedule for the current day, as well as their overall schedule.

##### Student Schedule Page:
###### A page that displays a list of students, with a link to their respective schedules. Each schedule displays the classes that student has scheduled for the current day, as well as their overall schedule.

## Technologies Used

##### Salesforce:
###### Data Models, database, connectivity between pages, controllers, and database

##### Apex:
###### Controller and controller extension logic, triggers, MVC 'controller'

##### SOQL/SOSL:
###### Database queries

##### Visualforce:
###### Page structure, MVC 'view'

##### HTML/CSS:
###### Page styling and structure

##### Git/GitHub:
###### Version control

##### VSCode & SF Dev Console:
###### IDE and Code Editors

## Getting Started
##### Successfully Retrieve and Deploy between Orgs
1. ###### Clone the repository down locally.
   - ###### `git clone https://github.com/Jayvious/SkyHigh`
2. ###### In your org, go to Setup > Feature Settings > Digital Experiences > Settings 
   - ###### Click Enable Digital Experiences
   - ###### Give this site a domain name of your choosing
3. ###### Go back to Setup > Feature Settings > Digital Experiences > Settings 
   - ###### Click Enable Experience Bundles API
4. ###### In VS Studio Code, in force-app\main\default 
   - ###### Right-click the documents folder and deploy source to org
   - ###### After that successfully deploys, open the file in force-app\main\default\sites\Sky_High.site-meta.xml 
   - ###### Change the siteAdmin and siteGuestRecordDefaultOwner to a user's username in your org and save
   - ###### Deploy to org using: `sfdx force:source:deploy -x manifest/package.xml`
   - ###### (If there is an error deploying due to a previous site already using these parameters)
      - ###### add URL paths to any pre-existing sites, as this site uses the default blank URL path 
   
##### See changes as System Admin
5. ###### In your org, navigate to Setup > Apps > App Manager 
6. ###### Click the dropdown arrow next to SkyHigh and click edit
7. ###### In the User Profiles section, add the System Admin Profile (as well as any other profiles you want)

##### Enable Tab Visability
8. ###### Next, navigate to Setup > Users > Profiles
9. ###### Select the System Administrator profile (or any other profile you want)
   - ###### if Enhanced Profile User Interface enabled:
     - ###### In App > Object Settings, search for each of the following Objects and set their tab visibility to Default-On:
     - ###### Campuses, Classes, Clubs, Student Counselors, Graduation Progress, New Student, Students, Student Schedules, Teachers, Teacher Schedule, and Teacher Schedules
   - ###### if Enhance Profile User Interface disabled:
     - ###### Click edit, and then scroll down to tab settings and set the following to Default-On:
     - ###### Campuses, Classes, Clubs, Student Counselors, Graduation Progress, New Student, Students, Student Schedules, Teachers, Teacher Schedule, and Teacher Schedules

10. ###### You should now be able to see all necessary objects, tabs, sites, and apps to interact with the new additions.
