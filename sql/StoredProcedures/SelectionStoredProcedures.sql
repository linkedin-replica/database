-- use created database
USE linkedin;

DROP procedure IF EXISTS `search_for_company`;
DELIMITER $$
CREATE PROCEDURE `search_for_company`(name_search varchar(50) )
  BEGIN
    SELECT * FROM companies WHERE name = name_search;
  END$$
DELIMITER ;


DROP procedure IF EXISTS `search_for_job_by_title`;
DELIMITER $$
CREATE PROCEDURE `search_for_job_by_title`( title_search varchar(50))
  BEGIN
    SELECT * FROM jobs WHERE title = title_search;
  END$$
DELIMITER ;


DROP procedure IF EXISTS `view_applied_jobs`;
DELIMITER $$
CREATE PROCEDURE `view_applied_jobs`(id varchar(40))
  BEGIN
    SELECT * FROM user_applied_for_job WHERE user_id = id;
  END$$
DELIMITER ;

DROP procedure IF EXISTS `view_jobs_for_company`;

DELIMITER $$
CREATE PROCEDURE `view_jobs_for_company`(id_company varchar(40))
  BEGIN
    SELECT * FROM jobs WHERE company_id = id_company;
  END$$
DELIMITER ;

DROP procedure IF EXISTS `search_for_user`;

DELIMITER $$
 CREATE PROCEDURE `search_for_user`(user_email varchar(50))
   BEGIN
     SELECT * FROM users WHERE email = user_email;
   END$$
DELIMITER ;

DROP procedure IF EXISTS `get_user`;

DELIMITER $$
 CREATE PROCEDURE `get_user`(user_id varchar(40))
   BEGIN
      SELECT * FROM users WHERE id = user_id;
   END$$
DELIMITER ;

DROP procedure IF EXISTS `Get_Saved_Job`;
  DELIMITER $$
 CREATE PROCEDURE `Get_Saved_Job`(user_id varchar(40))
             BEGIN
       SELECT *  FROM user_saved_job WHERE user_id = user_id;
       END$$
DELIMITER ;
