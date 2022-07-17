
# Employee Management System

This is a JAVA based project to manage the Employees of company. 
  
# Tools used in this project
  
1. Maven
2. JAVA
3. Jenkins
4. Nexus
5. Git and GitHub
6. Slack 
  
   
# About the project
 This project mainly focus on the contious integration part of pipeline to a small project. 
 In this project when the code is pushed to the github the pipeline automatically puul the source code Build it, Test It, Analyse the code, Upload the artifact to nexus repository and finally give update to the deveopers or other related team on slack channel.
  
When an error occurs automatically notification of error is sended to team on slack channel so that the team check the code and fix it without any delay.  


# How to use This Project
Step 1 :- Fork this project  
Step 2 :- Setup jenkins maven and nexux using the Shell Scripts provided  
Step 3 :- Configure your Jenkins to work with slack maven nexus and other Tools  
Step 4 :- change the Jenkinsfile according to Your Setup like change nexusurl, credentialId, etc  
Step 5 :- Create a pipeline job in Jenkins
Step 6 :- In Build Trigger option choose Poll SCM and schedule you SCM polling  
Step 7 :- In Pipeline section choose Pipeline script from SCM and provide your credentials  
Step 8 :- Save you job. Your Job will automatically build test and uploaded to Nexus  



## Screenshots

![Jenkins Job Screenshot](https://github.com/gautamjha2002/CI-CD_Project/blob/master/ScreenShots/SS-1.png)
![Slack Notification Screenshot](https://github.com/gautamjha2002/CI-CD_Project/blob/master/ScreenShots/SS-2.png)



# Credits
Theproject is a clone of The JAVA Project (Employee Management System) by ChrisJabb21 I have worked on the continous integration part of this project from scrath  
 
**Checkout [ChrisJabb21](https://github.com/ChrisJabb21)**



