DROP procedure IF EXISTS `edit_password`;

DELIMITER $$
CREATE PROCEDURE `edit_password`( user_id int,  new_password varchar(512))
  BEGIN
    UPDATE users SET password = new_password WHERE id = user_id;
  END$$
DELIMITER ;
