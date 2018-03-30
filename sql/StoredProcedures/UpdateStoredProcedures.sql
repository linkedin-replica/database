DROP PROCEDURE IF EXISTS `edit_password`;

DELIMITER $$
CREATE PROCEDURE `edit_password`( user_id varchar(40),  new_password varchar(512))
  BEGIN
    UPDATE users SET password = new_password WHERE id = user_id;
  END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS `accept_friend_request`;

DELIMITER $$
CREATE PROCEDURE `accept_friend_request`( user_id1 varchar(40), user_id2 varchar(40))
  BEGIN
    UPDATE user_friends_with_user SET is_accepted = 2 WHERE user1_id = user_id1 AND user2_id = user_id2;
  END$$
DELIMITER ;
