SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- Create Database called 'documentmanager', then paste what's bellow into the sql window.

CREATE DATABASE documentmanager;
USE documentmanager;

CREATE  TABLE users (
  userId INT(11) NOT NULL AUTO_INCREMENT,
  username VARCHAR(45) NOT NULL ,
  password VARCHAR(45) NOT NULL ,
  firstName varchar(50) NOT NULL,
  lastName varchar(50) NOT NULL,
  email varchar(50) NOT NULL,
  enabled TINYINT NOT NULL DEFAULT 1 ,
  PRIMARY KEY (userId));
 
CREATE TABLE user_roles (
  user_role_id INT(11) NOT NULL AUTO_INCREMENT,
  userId INT(11) NOT NULL,
  ROLE VARCHAR(45) NOT NULL,
  PRIMARY KEY (user_role_id),
  UNIQUE KEY uni_username_role (ROLE,userId),
  KEY fk_username_idx (userId),
  CONSTRAINT fk_userId FOREIGN KEY (userId) REFERENCES users (userId));
 

CREATE TABLE distributees (
  distributeeId int(11) NOT NULL AUTO_INCREMENT,
  userId int(11) NOT NULL,
  revisionId int(11) NOT NULL,
  distributionDate date NOT NULL,
  PRIMARY KEY (distributeeId)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


CREATE TABLE document_records (
  documentId int(11) NOT NULL AUTO_INCREMENT,
  title varchar(50) NOT NULL,
  description varchar(500) NOT NULL,
  author varchar(50) NOT NULL,
  PRIMARY KEY (documentId)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


CREATE TABLE revisions (
  revisionId int(11) NOT NULL AUTO_INCREMENT,
  revisionNo int(11) NOT NULL,
  documentAttachment varchar(200) NOT NULL,
  documentId int(11) NOT NULL,
  createdDate date NOT NULL,
  status varchar(50) NOT NULL,
  PRIMARY KEY (revisionId)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE USER 'java'@'localhost' IDENTIFIED BY 'java';
GRANT ALL PRIVILEGES ON * . * TO 'java'@'localhost';

INSERT INTO users(userId,username,password,firstName,lastName,email,enabled)
VALUES (NULL,'craig','test','Craig','Miller','craig@1.com', TRUE);
INSERT INTO users(userId,username,password,firstName,lastName,email,enabled)
VALUES (NULL,'john','test','John','Smith','john@1.com', TRUE);
 
INSERT INTO user_roles (user_role_id, userId, ROLE)
VALUES (NULL, 1, 'ROLE_USER');
INSERT INTO user_roles (user_role_id, userId, ROLE)
VALUES (NULL, 1, 'ROLE_ADMIN');
INSERT INTO user_roles (user_role_id, userId, ROLE)
VALUES (NULL, 2, 'ROLE_USER');
