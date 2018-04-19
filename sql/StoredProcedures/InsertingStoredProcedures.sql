-- create stored procedures for insertions

DROP PROCEDURE IF EXISTS Insert_User;
DELIMITER $$
 CREATE PROCEDURE Insert_User(
     IN id_val varchar(40)
 	IN email_val varchar(50),
 	IN password_val varchar(512)
)
   BEGIN
  	INSERT INTO users (id, email, password)
	VALUES (id_val, email_val, password_val);
   END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS Insert_Company;
DELIMITER //
 CREATE PROCEDURE Insert_Company(
    IN id_val varchar(50),
 	IN name_val varchar(50),
 	IN user_id_val varchar(40)
)
   BEGIN
  	INSERT INTO companies (id, name, user_id)
	VALUES (id_val, name_val, user_id_val);
   END //
 DELIMITER ;

DROP PROCEDURE IF EXISTS Insert_Job;
 DELIMITER //
 CREATE PROCEDURE Insert_Job(
     IN id_val varchar(50),
     IN title_val varchar(50),
     IN company_id_val varchar(40)
)
   BEGIN
  	INSERT INTO jobs (id, title, company_id)
	VALUES (id_val, title_val, company_id_val);
   END //
 DELIMITER ;


DROP PROCEDURE IF EXISTS Insert_Job_Application;
  DELIMITER //
 CREATE PROCEDURE Insert_Job_Application(
 	IN user_id_val varchar(40),
 	IN job_id_val varchar(40),
 	IN status_val tinyint(4)
 )
   BEGIN
  	INSERT INTO user_applied_for_job (user_id, job_id, status)
	VALUES (user_id_val, job_id_val,status_val);
   END //
 DELIMITER ;

DROP PROCEDURE IF EXISTS Insert_Blocked_User;
  DELIMITER //
 CREATE PROCEDURE Insert_Blocked_User(
 	IN blocking_user_id_val varchar(40),
 	IN blocked_user_id_val varchar(40)
 )
   BEGIN
  	INSERT INTO user_blocked_user (blocking_user_id, blocked_user_id)
	VALUES (blocking_user_id_val, blocked_user_id_val);
   END //
 DELIMITER ;

DROP PROCEDURE IF EXISTS Add_Friend;
  DELIMITER //
 CREATE PROCEDURE Add_Friend(
 	IN user1_id_val varchar(40),
 	IN user2_id_val varchar(40),
  IN is_accepted_val int
 )
   BEGIN
  	INSERT INTO user_friends_with_user (user1_id, user2_id, is_accepted)
	VALUES (user1_id_val, user2_id_val, is_accepted_val);
   END //
 DELIMITER ;


DROP PROCEDURE IF EXISTS Insert_User_Saved_Job;
   DELIMITER //
 CREATE PROCEDURE Insert_User_Saved_Job(
 	IN user_id_val varchar(40),
 	IN job_id_val varchar(40)
 )
   BEGIN
  	INSERT INTO user_saved_job (user_id, job_id)
	VALUES (user_id_val, job_id_val);
   END //
 DELIMITER ;
