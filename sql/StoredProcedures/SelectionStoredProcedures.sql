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



DROP procedure IF EXISTS `search_for_user_by_skill`;
DELIMITER $$
CREATE PROCEDURE `search_for_user_by_skill`(skill_id_in varchar(25))
BEGIN
    SELECT * FROM user_has_skill WHERE skill_id = skill_id_in;
END$$
DELIMITER ;


DROP procedure IF EXISTS `view_applied_jobs`;
DELIMITER $$
CREATE PROCEDURE `view_applied_jobs`(id varchar(25))
  BEGIN
    SELECT * FROM user_applied_for_job WHERE user_id = id;
  END$$
DELIMITER ;

DROP procedure IF EXISTS `view_jobs_for_company`;

DELIMITER $$
CREATE PROCEDURE `view_jobs_for_company`(id_company varchar(25))
  BEGIN
    SELECT * FROM jobs WHERE company_id = id_company;
  END$$
DELIMITER ;
