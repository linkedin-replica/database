DROP procedure IF EXISTS `edit_password`;

DELIMITER $$
CREATE PROCEDURE `edit_password`( user_id int,  new_password varchar(512))
  BEGIN
    UPDATE users SET password = new_password WHERE id = user_id;
  END$$
DELIMITER ;


DROP procedure IF EXISTS `respond_to_applicant`;
DELIMITER $$
    CREATE PROCEDURE `respond_to_applicant`( User_id int,  Job_id int, new_status int)
           BEGIN
        UPDATE user_applied_for_job j SET j.status = new_status WHERE j.user_id = User_id AND j.job_id = Job_id;
     END$$
DELIMITER ;