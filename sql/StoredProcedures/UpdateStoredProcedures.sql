DROP PROCEDURE IF EXISTS `edit_password`;

DELIMITER $$
CREATE PROCEDURE `edit_password`( user_id int,  new_password varchar(512))
  BEGIN
    UPDATE users SET password = new_password WHERE id = user_id;
  END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS `accept_friend_request`;

DELIMITER $$
CREATE PROCEDURE `accept_friend_request`( user_id1 int, user_id2 int)
  BEGIN
    UPDATE user_friends_with_user SET is_accepted = 2 WHERE user1_id = user_id1 AND user2_id = user_id2;
  END$$
DELIMITER ;
