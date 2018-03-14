DROP PROCEDURE IF EXISTS `delete_company`;

DELIMITER $$
CREATE PROCEDURE `delete_company`(id_company varchar(25))
  BEGIN
    DELETE FROM companies WHERE id = id_company;
  END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS `delete_job`;

DELIMITER $$
CREATE PROCEDURE `delete_job`(id_job varchar(25))
  BEGIN
    DELETE FROM jobs WHERE id = id_job;
  END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS `delete_job_needs_skill`;

DELIMITER $$
CREATE PROCEDURE `delete_job_needs_skill`(job_id_in varchar(25), skill_id_in varchar(25))
  BEGIN
    DELETE FROM job_requires_skill WHERE job_id = job_id_in AND skill_id = skill_id_in;
  END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS `delete_skill`;

DELIMITER $$
CREATE PROCEDURE `delete_skill`(id_skill varchar(25))
  BEGIN
    DELETE FROM skills WHERE id = id_skill;
  END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS `delete_user`;

DELIMITER $$
CREATE PROCEDURE `delete_user`(id_user varchar(25))
  BEGIN
    DELETE FROM users WHERE id = id_user;
  END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS `delete_user_apply_for_job`;

DELIMITER $$
CREATE PROCEDURE `delete_user_apply_for_job`(user_id_in varchar(25),  job_id_in varchar(25))
  BEGIN
    DELETE FROM user_applied_for_job  WHERE user_id = user_id_in AND job_id = job_id_in;
  END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS `delete_user_blocks_user`;

DELIMITER $$
CREATE PROCEDURE `delete_user_blocks_user`(blocking_user_id_in varchar(25), blocked_user_id_in varchar(25))
  BEGIN
    DELETE FROM user_blocked_user WHERE blocking_user_id = blocking_user_id_in AND blocked_user_id = blocked_user_id_in;
  END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS `delete_user_friend_with_user`;

DELIMITER $$
CREATE PROCEDURE `delete_user_friend_with_user`(user1_id_in varchar(25), user2_id_in varchar(25))
  BEGIN
    DELETE FROM user_friends_with_user WHERE user1_id = user1_id_in AND user2_id = user2_id_in;
  END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS `delete_user_has_skill`;

DELIMITER $$
CREATE PROCEDURE `delete_user_has_skill`(user_id_in varchar(25), skill_id_in varchar(25))
  BEGIN
    DELETE FROM user_has_skill WHERE user_id = user_id_in AND skill_id = skill_id_in;
  END$$
DELIMITER ;
