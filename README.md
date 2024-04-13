# 3005 FINAL PROJECT V2- Shirley Huang (101185496) AND Helen Zhu (101260141)

# Demonstration Video
https://youtu.be/zQA0LMDLN6c
# Files
**DIAGRAMS FOLDER**
<br/> ER Diagram.png - picture of ER diagram (2.1)
<br/> Relation Schemas.png - picture of reduced relation schema (2.2)

**REPORT FOLDER**
<br/> Report- COMP3005ProjectV2.docx 
<br/> Report- COMP3005ProjectV2.pdf - report for assignment and includes all details 

**SQL FOLDER:**
<br/> DML.sql - creates table (2.3)
<br/>  DDL.sql - inserts data into table (2.4) 
<br/> BookingSessions.sql - to run a query for members to book a personal or group session 

<br/> admin.js - administrative staff functions 
<br/> db.js - setup database 
<br/> function.js - error handling with improper user input
<br/> main.js - main menu, starts code
<br/> member.js - member functions
<br/> package-lock.json - used for npm install to run the code
<br/> package.json - used for npm install to run the code 
<br/> README.md 
<br/> trainer.js - trainer functions

# Installation
To download all the files in the repository, execute the following command in the terminal: 
```
git clone https://github.com/Shirly8/COMP3005ProjectV2.git
cd COMP3005ProjectV2
```

# Setup DataBase
Open .db.js file and look for the getConnection() function and update the following information with your own. 
```
database: 'final',
user: ' ',
host: 'localhost',
password: '',
port: 5432,
```
# Running
To run the program execute the following commands in the terminal:
```
npm install 
node main.js
```
