<?php
/** Create DB Folder if not existing yet */
if (!is_dir(. '/db')) {
    mkdir(. '/db');
}

/** Define DB File Path */
if (!defined('db_file')) {
    define('db_file', __DIR__ . '/db/forum_db.db');
}

/** Define DB File Path */
if (!defined('tZone')) {
    define('tZone', "Asia/Manila");
}

if (!defined('dZone')) {
    define('dZone', ini_get('date.timezone'));
}

/** DB Connection Class */
class DBConnection extends mysqli
{
    function __construct()
    {
        parent::__construct("localhost", "username", "password", "database_name");

        if ($this->connect_error) {
            die("Connection failed: " . $this->connect_error);
        }

        $this->query("SET foreign_key_checks = 1;");

        $this->query("CREATE TABLE IF NOT EXISTS `user_list` (
            `user_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            `fullname` VARCHAR(255) NOT NULL,
            `username` VARCHAR(255) NOT NULL,
            `password` VARCHAR(255) NOT NULL,
            `type` TINYINT(1) NOT NULL DEFAULT 0,
            `status` TINYINT(1) NOT NULL DEFAULT 0,
            `date_created` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )");

        $this->query("CREATE TABLE IF NOT EXISTS `topic_list` (
            `topic_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            `user_id` INT NOT NULL,
            `title` TEXT NOT NULL,
            `description` TEXT NOT NULL,
            `status` TINYINT(2) NOT NULL DEFAULT 0,
            `date_created` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY(`user_id`) REFERENCES `user_list`(`user_id`)
        )");

        $this->query("CREATE TABLE IF NOT EXISTS `comment_list` (
            `comment_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            `topic_id` INT NOT NULL,
            `user_id` INT NOT NULL,
            `comment` TEXT NOT NULL,
            `date_created` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY(`topic_id`) REFERENCES `topic_list`(`topic_id`)
        )");

        $passwordHash = password_hash('$2y$10$Aj/jjNbcT1vNZrp.9ELpheF9rgjP9RInWb8RSuTGAKcoKJE26HCb6', PASSWORD_DEFAULT);
        $this->query("INSERT IGNORE INTO `user_list` VALUES (1, 'Administrator', 'admin', '$passwordHash', 1, 1, CURRENT_TIMESTAMP)");
    }

    function __destruct()
    {
        $this->close();
    }
}

$conn = new DBConnection();
