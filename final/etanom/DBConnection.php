<?php

if (!is_dir(__DIR__ . '/db')) {
    mkdir(__DIR__ . '/db');
}

if (!defined('db_file')) {
    define('db_file', __DIR__ . '/db/etanom_db.db');
}

function my_udf_md5($string)
{
    return md5($string);
}

class DBConnection extends mysqli
{
    protected $db;

    function __construct()
    {
        parent::__construct("localhost", "username", "password", "database_name");

        if ($this->connect_error) {
            die("Connection failed: " . $this->connect_error);
        }

        $this->createFunction('md5', 'my_udf_md5');
        $this->query("SET foreign_key_checks = 1;");

        $this->query("CREATE TABLE IF NOT EXISTS `admin_list` (
            `admin_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            `fullname` VARCHAR(255) NOT NULL,
            `username` VARCHAR(255) NOT NULL,
            `password` VARCHAR(255) NOT NULL,
            `type` INT NOT NULL DEFAULT 1,
            `status` INT NOT NULL DEFAULT 1,
            `date_created` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )");

        $this->query("CREATE TABLE IF NOT EXISTS `category_list` (
            `category_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            `name` VARCHAR(255) NOT NULL,
            `description` TEXT NOT NULL
        ) ");

        $this->query("CREATE TABLE IF NOT EXISTS `user_list` (
            `user_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            `fullname` VARCHAR(255) NOT NULL,
            `username` VARCHAR(255) NOT NULL,
            `password` VARCHAR(255) NOT NULL,
            `status` INT NOT NULL DEFAULT 1,
            `date_created` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )");

        $this->query("CREATE TABLE IF NOT EXISTS `crops_list` (
            `crops_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            `category_id` INT NOT NULL,
            `user_id` INT NOT NULL,
            `title` VARCHAR(255) NOT NULL,
            `planning` TEXT NOT NULL,
            `land_preparation` TEXT NOT NULL,
            `planting_stages` TEXT NOT NULL,
            `other_info` TEXT NOT NULL,
            `status` INT NOT NULL,
            `date_created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY(`category_id`) REFERENCES `category_list`(`category_id`) ON DELETE CASCADE,
            FOREIGN KEY(`user_id`) REFERENCES `user_list`(`user_id`) ON DELETE CASCADE
        )");

        $this->query("CREATE TABLE IF NOT EXISTS `comment_list` (
            `comment_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            `crops_id` INT NOT NULL,
            `user_id` INT NOT NULL,
            `message` TEXT NOT NULL,
            `date_created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY(`crops_id`) REFERENCES `crops_list`(`crops_id`) ON DELETE CASCADE,
            FOREIGN KEY(`user_id`) REFERENCES `user_list`(`user_id`) ON DELETE CASCADE
        )");

        $this->query("INSERT IGNORE INTO `admin_list` VALUES (1, 'Administrator', 'admin', '" . my_udf_md5('admin123') . "', 1, 1, CURRENT_TIMESTAMP)");
        $this->query("INSERT IGNORE INTO `user_list` VALUES (1, 'Realyn Beridico Coprada', 'Rbc', '" . my_udf_md5('Rdc123') . "', 1, CURRENT_TIMESTAMP)");
    }

    function __destruct()
    {
        $this->close();
    }
}

$conn = new DBConnection();
