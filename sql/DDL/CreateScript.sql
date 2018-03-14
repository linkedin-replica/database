-- create database
CREATE DATABASE IF NOT EXISTS linkedin;

-- use created database
USE linkedin;

-- create users table
CREATE TABLE IF NOT EXISTS users(
  id varchar(25) PRIMARY KEY,
  email varchar(50) UNIQUE,
  password  varchar(512)
);


CREATE TABLE IF NOT EXISTS companies(
  id varchar(25) PRIMARY KEY,
  name varchar(50) UNIQUE,
  user_id varchar(25) NOT NULL UNIQUE,
  FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS skills(
  id varchar(25) PRIMARY KEY,
  name varchar(50),
  type varchar(50)
);

CREATE TABLE IF NOT EXISTS jobs(
  id varchar(25) PRIMARY KEY,
  title varchar(50),
  company_id varchar(25) NOT NULL,
  FOREIGN KEY (company_id) REFERENCES companies(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS user_has_skill(
  user_id varchar(25) NOT NULL,
  skill_id varchar(25) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE ,
  FOREIGN KEY (skill_id) REFERENCES skills(id) ON UPDATE CASCADE ON DELETE CASCADE ,

  PRIMARY KEY (user_id, skill_id)
);

CREATE TABLE IF NOT EXISTS job_requires_skill(
  job_id varchar(25) NOT NULL,
  skill_id varchar(25) NOT NULL,
  FOREIGN KEY (job_id) REFERENCES jobs(id) ON UPDATE CASCADE ON DELETE CASCADE ,
  FOREIGN KEY (skill_id) REFERENCES skills(id) ON UPDATE CASCADE ON DELETE CASCADE ,

  PRIMARY KEY (job_id, skill_id)
);


CREATE TABLE IF NOT EXISTS user_applied_for_job(
  user_id varchar(25),
  job_id varchar(25),
  status tinyint,

  FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE ,
  FOREIGN KEY (job_id) REFERENCES jobs(id) ON UPDATE CASCADE ON DELETE CASCADE ,

  PRIMARY KEY (user_id, job_id)
);


CREATE TABLE IF NOT EXISTS user_saved_job(
  user_id varchar(25),
  job_id varchar(25),

  FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE ,
  FOREIGN KEY (job_id) REFERENCES jobs(id) ON UPDATE CASCADE ON DELETE CASCADE ,

  PRIMARY KEY (user_id, job_id)
);

CREATE TABLE IF NOT EXISTS user_blocked_user(
  blocking_user_id varchar(25),
  blocked_user_id varchar(25),

  FOREIGN KEY (blocking_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE ,
  FOREIGN KEY (blocked_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE ,

  PRIMARY KEY (blocking_user_id, blocked_user_id)
);

-- is_accepted value 0 means user1 added user2, value 1 means user2 added user1, and value 2 means user1 and user2 are friends
CREATE TABLE IF NOT EXISTS user_friends_with_user(
  user1_id varchar(25),
  user2_id varchar(25),
  is_accepted int,

  FOREIGN KEY (user1_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE ,
  FOREIGN KEY (user2_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE ,

  PRIMARY KEY (user1_id, user2_id)
);
