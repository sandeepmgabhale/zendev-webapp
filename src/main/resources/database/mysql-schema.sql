CREATE DATABASE dev_webapp DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

use dev_webapp;

CREATE TABLE user (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  username varchar(64) NOT NULL,
  password varchar(128) NOT NULL,
  name varchar(128) NOT NULL,
  gender tinyint(1),
  birthdate date,
  email varchar(128),
  mobile varchar(32),
  enabled bit(1) DEFAULT 1,
  PRIMARY KEY (id),
  UNIQUE KEY (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE role (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(64) NOT NULL,
  description varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE user_role (
  user_id int(10) unsigned NOT NULL,
  role_id int(10) unsigned NOT NULL,
  PRIMARY KEY (user_id,role_id),
  FOREIGN KEY (user_id) REFERENCES user (id),
  FOREIGN KEY (role_id) REFERENCES role (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE role_permission (
  role_id int(10) unsigned NOT NULL,
  element varchar(255) DEFAULT NULL,
  FOREIGN KEY (role_id) REFERENCES role (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
