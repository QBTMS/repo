create table userTaskCompletenessLevel(userTaskId bigint , completenessLevel int);

create table completedTasks(completedTaskId bigint auto_increment primary key , userTaskName varchar(255), startedDate datetime )

insert into user(password, status, username) values('123','Active','prasadct99@gmail.com');

 insert into role(roleName) values('Normal');

  insert into usersandroles(user_id, role_id) values(1,1);
