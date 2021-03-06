DROP PROCEDURE IF EXISTS `delete_company`;

DELIMITER $$
CREATE PROCEDURE `delete_company`(id_company varchar(40))
  BEGIN
    DELETE FROM companies WHERE id = id_company;
  END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS `delete_job`;

DELIMITER $$
CREATE PROCEDURE `delete_job`(id_job varchar(40))
  BEGIN
    DELETE FROM jobs WHERE id = id_job;
  END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS `delete_job_needs_skill`;

DELIMITER $$
CREATE PROCEDURE `delete_job_needs_skill`(job_id_in varchar(40), skill_id_in varchar(40))
  BEGIN
    DELETE FROM job_requires_skill WHERE job_id = job_id_in AND skill_id = skill_id_in;
  END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS `delete_skill`;

DELIMITER $$
CREATE PROCEDURE `delete_skill`(id_skill varchar(40))
  BEGIN
    DELETE FROM skills WHERE id = id_skill;
  END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS `delete_users`;

DELIMITER $$
 CREATE PROCEDURE `delete_users`()
   BEGIN
     DELETE FROM users;
   END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS `delete_user`;

DELIMITER $$
 CREATE PROCEDURE `delete_user`(user_email varchar(50))
    BEGIN
      DELETE FROM users WHERE email = user_email;
    END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS `delete_user_apply_for_job`;

DELIMITER $$
CREATE PROCEDURE `delete_user_apply_for_job`(user_id_in varchar(40),  job_id_in varchar(40))
  BEGIN
    DELETE FROM user_applied_for_job  WHERE user_id = user_id_in AND job_id = job_id_in;
  END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS `delete_user_blocks_user`;

DELIMITER $$
CREATE PROCEDURE `delete_user_blocks_user`(blocking_user_id_in varchar(40), blocked_user_id_in varchar(40))
  BEGIN
    DELETE FROM user_blocked_user WHERE blocking_user_id = blocking_user_id_in AND blocked_user_id = blocked_user_id_in;
  END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS `delete_user_friend_with_user`;

DELIMITER $$
CREATE PROCEDURE `delete_user_friend_with_user`(user1_id_in varchar(40), user2_id_in varchar(40))
  BEGIN
    DELETE FROM user_friends_with_user WHERE (user1_id = user1_id_in AND user2_id = user2_id_in) OR (user1_id = user2_id_in AND user2_id = user1_id_in);
  END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS `delete_friend_request`;

DELIMITER $$
CREATE PROCEDURE `delete_friend_request`(user1_id_in varchar(40), user2_id_in varchar(40), is_accepted_val int)
  BEGIN
    DELETE FROM user_friends_with_user WHERE user1_id = user1_id_in AND user2_id = user2_id_in AND is_accepted = is_accepted_val;
  END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS `delete_user_has_skill`;

DELIMITER $$
CREATE PROCEDURE `delete_user_has_skill`(user_id_in varchar(40), skill_id_in varchar(40))
  BEGIN
    DELETE FROM user_has_skill WHERE user_id = user_id_in AND skill_id = skill_id_in;
  END$$
DELIMITER ;
