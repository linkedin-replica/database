-- create stored procedures for insertions

DROP PROCEDURE IF EXISTS `insert_user`;
DELIMITER $$
 CREATE PROCEDURE `insert_user`(
 	IN email_val varchar(50),
 	IN password_val varchar(512),
  IN id_val varchar(40)
)
   BEGIN
  	INSERT INTO users (id, email, password)
	VALUES (id_val, email_val, password_val);
   END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS Insert_Company;
DELIMITER //
 CREATE PROCEDURE Insert_Company(
 	IN name_val varchar(50),
 	IN user_id_val varchar(40)
)
   BEGIN
  	INSERT INTO companies (name, user_id)
	VALUES (name_val, user_id_val);
   END //
 DELIMITER ;

DROP PROCEDURE IF EXISTS Insert_Job;
 DELIMITER //
 CREATE PROCEDURE Insert_Job(
 	IN title_val varchar(50),
 	IN company_id_val varchar(40)
)
   BEGIN
  	INSERT INTO jobs (title, company_id)
	VALUES (title_val, company_id_val);
   END //
 DELIMITER ;

DROP PROCEDURE IF EXISTS Insert_Job_With_Skill;
  DELIMITER //
 CREATE PROCEDURE Insert_Job_With_Skill(
 	IN job_id_val varchar(40),
 	IN skill_id_val varchar(40)
)
   BEGIN
  	INSERT INTO job_requires_skill (job_id, skill_id)
	VALUES (job_id_val, skill_id_val);
   END //
 DELIMITER ;

DROP PROCEDURE IF EXISTS Insert_Skill;
  DELIMITER //
 CREATE PROCEDURE Insert_Skill(
 	IN name_val varchar(50),
 	IN type_val varchar(50)
)
   BEGIN
  	INSERT INTO skills (name, type)
	VALUES (name_val, type_val);
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

DROP PROCEDURE IF EXISTS Insert_User_With_Skill;
  DELIMITER //
 CREATE PROCEDURE Insert_User_With_Skill(
 	IN user_id_val varchar(40),
 	IN skill_id_val varchar(40)
 )
   BEGIN
  	INSERT INTO user_has_skill (user_id, skill_id)
	VALUES (user_id_val, skill_id_val);
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
