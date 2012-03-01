CREATE DATABASE dev DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

use dev;

CREATE

CREATE TABLE role (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  name varchar(64) NOT NULL,
  description varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
