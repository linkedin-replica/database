-- create database
CREATE DATABASE IF NOT EXISTS linkedin;

-- use created database
USE linkedin;

-- create users table
CREATE TABLE IF NOT EXISTS users(
  id int  AUTO_INCREMENT PRIMARY KEY,
  email varchar(50) UNIQUE,
  password  varchar(512)
);


CREATE TABLE IF NOT EXISTS companies(
  id int AUTO_INCREMENT PRIMARY KEY,
  name varchar(50) UNIQUE,
  user_id int NOT NULL UNIQUE,
  FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS skills(
  id int AUTO_INCREMENT PRIMARY KEY,
  name varchar(50),
  type varchar(50)
);

CREATE TABLE IF NOT EXISTS jobs(
  id int AUTO_INCREMENT PRIMARY KEY,
  title varchar(50),
  company_id int NOT NULL,
  FOREIGN KEY (company_id) REFERENCES companies(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS user_has_skill(
  user_id int NOT NULL,
  skill_id int NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE ,
  FOREIGN KEY (skill_id) REFERENCES skills(id) ON UPDATE CASCADE ON DELETE CASCADE ,

  PRIMARY KEY (user_id, skill_id)
);

CREATE TABLE IF NOT EXISTS job_requires_skill(
  job_id int NOT NULL,
  skill_id int NOT NULL,
  FOREIGN KEY (job_id) REFERENCES jobs(id) ON UPDATE CASCADE ON DELETE CASCADE ,
  FOREIGN KEY (skill_id) REFERENCES skills(id) ON UPDATE CASCADE ON DELETE CASCADE ,

  PRIMARY KEY (job_id, skill_id)
);


CREATE TABLE IF NOT EXISTS user_applied_for_job(
  user_id int,
  job_id int,
  status tinyint,

  FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE ,
  FOREIGN KEY (job_id) REFERENCES jobs(id) ON UPDATE CASCADE ON DELETE CASCADE ,

  PRIMARY KEY (user_id, job_id)
);


CREATE TABLE IF NOT EXISTS user_saved_job(
  user_id int,
  job_id int,

  FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE ,
  FOREIGN KEY (job_id) REFERENCES jobs(id) ON UPDATE CASCADE ON DELETE CASCADE ,

  PRIMARY KEY (user_id, job_id)
);

CREATE TABLE IF NOT EXISTS user_blocked_user(
  blocking_user_id int,
  blocked_user_id int,

  FOREIGN KEY (blocking_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE ,
  FOREIGN KEY (blocked_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE ,

  PRIMARY KEY (blocking_user_id, blocked_user_id)
);

-- is_accepted value 0 means user1 added user2, value 1 means user2 added user1, and value 2 means user1 and user2 are friends
CREATE TABLE IF NOT EXISTS user_friends_with_user(
  user1_id int,
  user2_id int,
  is_accepted int,

  FOREIGN KEY (user1_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE ,
  FOREIGN KEY (user2_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE ,

  PRIMARY KEY (user1_id, user2_id)
);
