create table userTaskCompletenessLevel(userTaskId bigint , completenessLevel int);

create table completedTasks(completedTaskId bigint auto_increment primary key , userTaskName varchar(255), startedDate datetime )