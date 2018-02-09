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
  FOREIGN KEY (user_id) REFERENCES users(id)
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
  FOREIGN KEY (company_id) REFERENCES companies(id)
);

CREATE TABLE IF NOT EXISTS user_has_skill(
  user_id int NOT NULL,
  skill_id int NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (skill_id) REFERENCES skills(id),

  PRIMARY KEY (user_id, skill_id)
);

CREATE TABLE IF NOT EXISTS job_needs_skill(
  job_id int NOT NULL,
  skill_id int NOT NULL,
  FOREIGN KEY (job_id) REFERENCES jobs(id),
  FOREIGN KEY (skill_id) REFERENCES skills(id),

  PRIMARY KEY (job_id, skill_id)
);


CREATE TABLE IF NOT EXISTS user_apply_for_job(
  user_id int,
  job_id int,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (job_id) REFERENCES jobs(id),

  PRIMARY KEY (user_id, job_id)
);

CREATE TABLE IF NOT EXISTS user_blocks_user(
  blocking_user_id int,
  blocked_user_id int,

  FOREIGN KEY (blocking_user_id) REFERENCES users(id),
  FOREIGN KEY (blocked_user_id) REFERENCES users(id),

  PRIMARY KEY (blocking_user_id, blocked_user_id)
);

CREATE TABLE IF NOT EXISTS user_friend_with_user(
  user1_id int,
  user2_id int,

  FOREIGN KEY (user1_id) REFERENCES users(id),
  FOREIGN KEY (user2_id) REFERENCES users(id),

  PRIMARY KEY (user1_id, user2_id)
);
