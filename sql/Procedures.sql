DROP procedure IF EXISTS `edit_password`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_password`( user_id int,  new_password varchar(512))
BEGIN
update users set password=new_password where id=user_id;
END$$
DELIMITER ;

DROP procedure IF EXISTS `search_for_company`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_for_company`(name_search varchar(50) )
BEGIN
select * from companies where name=name_search;
END$$
DELIMITER ;

DROP procedure IF EXISTS `search_for_job_by_title`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_for_job_by_title`( title_search varchar(50))
BEGIN
select * from jobs where title=title_search;
END$$
DELIMITER ;

DROP procedure IF EXISTS `view_applied_jobs`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_applied_jobs`(id int)
BEGIN
select * from user_applies_for_job where user_id=id;
END$$
DELIMITER ;

DROP procedure IF EXISTS `view_jobs_for_company`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_jobs_for_company`(id_company int)
BEGIN
select * from jobs where company_id=id_company;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS `delete_company`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_company`(id int)
BEGIN
DELETE FROM companies WHERE id = id;

END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS `delete_job`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_job`(id int)
BEGIN
DELETE FROM jobs WHERE id =id;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS `delete_job_needs_skill`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_job_needs_skill`(job_id int, skill_id int)
BEGIN
DELETE FROM job_needs_skill WHERE job_id = job_id AND skill_id = skill_id;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS `delete_skill`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_skill`(id int)
BEGIN
DELETE FROM skills WHERE id = id;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS `delete_user`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_user`(id int)
BEGIN
DELETE FROM users WHERE id = id;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS `delete_user_apply_for_job`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_user_apply_for_job`(user_id int,  job_id int)
BEGIN
DELETE FROM user_apply_for_job  WHERE user_id = user_id AND job_id = job_id;
END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS `delete_user_blocks_user`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_user_blocks_user`(blocking_user_id int, blocked_user_id int)
BEGIN
DELETE FROM user_blocks_user WHERE blocking_user_id = blocking_user_id AND blocked_user_id;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS `delete_user_friend_with_user`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_user_friend_with_user`(user1_id int, user2_id int)
BEGIN
DELETE FROM user_friend_with_user WHERE user1_id = user1_id AND user2_id =user2_id;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS `delete_user_has_skill`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_user_has_skill`(user_id int, skill_id int)
BEGIN
DELETE FROM user_has_skil WHERE user_id = user_id AND skill_id = skill_id;
END$$
DELIMITER ;






