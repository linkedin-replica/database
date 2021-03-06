DROP PROCEDURE IF EXISTS `edit_password`;

DELIMITER $$
CREATE PROCEDURE `edit_password`( user_id varchar(40),  new_password varchar(512))
  BEGIN
    UPDATE users SET password = new_password WHERE id = user_id;
  END$$
DELIMITER ;

DROP procedure IF EXISTS `respond_to_applicant`;
DELIMITER $$
    CREATE PROCEDURE `respond_to_applicant`( User_id varchar(40),  Job_id varchar(40), new_status int)
           BEGIN
        UPDATE user_applied_for_job j SET j.status = new_status WHERE j.user_id = User_id AND j.job_id = Job_id;
     END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS `accept_friend_request`;

DELIMITER $$
CREATE PROCEDURE `accept_friend_request`( user_id1 varchar(40), user_id2 varchar(40))
  BEGIN
    UPDATE user_friends_with_user SET is_accepted = 2 WHERE user1_id = user_id1 AND user2_id = user_id2;
  END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS respond_to_applicant;
  DELIMITER $$
   CREATE PROCEDURE  respond_to_applicant(
       IN user_id_val varchar(40),
       IN job_id_val varchar(40),
       IN status_val  tinyint
  )
     BEGIN
        UPDATE user_applied_for_job SET status = status_val WHERE user_id = user_id_val AND job_id = job_id_val;
       END $$
  DELIMITER ;