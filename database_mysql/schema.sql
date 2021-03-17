-- DROP DATABASE IF EXISTS questions;
CREATE DATABASE IF NOT EXISTS questions;

USE questions;
-- ---
-- Table 'questions'
--
-- ---

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  `question_id` INTEGER NOT NULL AUTO_INCREMENT,
  `question_body` TEXT(1000) NOT NULL,
  `question_date` DATE NOT NULL,
  `asker_name` VARCHAR(60) NULL,
  `asker_email` VARCHAR(60) NULL,
  `product_id` SMALLINT NOT NULL,
  `reported` BINARY NOT NULL DEFAULT 0,
  `question_helpfulness` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  -- Possibly type booolean not null default false?
  PRIMARY KEY
  (`question_id`)
);

-- ---
-- Table 'answer'
--
-- ---

DROP TABLE IF EXISTS answers;

CREATE TABLE answers (
  `answer_id` INTEGER NOT NULL AUTO_INCREMENT,
  `question_id` INTEGER NOT NULL,
  `answer_body` TEXT(1000) NOT NULL,
  `answer_date` DATE NOT NULL,
  `answerer_name` VARCHAR(60) NOT NULL,
  `answerer_email` VARCHAR(60) NOT NULL,
  `reported` BINARY NOT NULL DEFAULT 0,
  `helpfulness` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`answer_id`),
  FOREIGN KEY (`question_id`) REFERENCES questions (`question_id`) ON DELETE CASCADE
);

-- ---
-- Table 'photos'
--
-- ---

DROP TABLE IF EXISTS photos;

CREATE TABLE `photos` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `answer_id` INTEGER NOT NULL,
  `url` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`answer_id`) REFERENCES answers (`answer_id`) ON DELETE CASCADE
);

-- ---
-- Foreign Keys
-- ---

-- ALTER TABLE answers ADD FOREIGN KEY (`question_id`) REFERENCES questions(`question_id`) ON DELETE CASCADE;
-- ALTER TABLE `photos` ADD FOREIGN KEY (`answer_id`) REFERENCES `answers` (`answer_id`) ON DELETE CASCADE;

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `questions` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `answer` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `photos` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `questions` (`questions_id`,`date_`,`question_body`,`asker_name`,`product_id`,`helpfulness`,`reported`) VALUES
-- ('','','','','','','');
-- INSERT INTO `answer` (`id`,`body`,`date_`,`answerer_name`,`helpfulness`,`questions_id_question`) VALUES
-- ('','','','','','');
-- INSERT INTO `photos` (`id`,`id_answer`,`url`) VALUES
-- ('','','');