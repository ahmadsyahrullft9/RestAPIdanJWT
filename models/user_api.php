<?php

require_once('./utils/dbconnect.php');

class User_api{
    
    private $conn;
    private $tableName = 'users_api';
    private $id, $Name, $Email, $Password, $Active, $CreateOn;

    public function __construct(){
        $db = new DbConnect();
        $this->conn = $db->connect();
    }

    public function getuser_byemailpass($email, $pass){
        $stmt = $this->conn->prepare("SELECT * FROM users_api WHERE Email = :email AND Password = :pass");
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':pass', $pass);
        $stmt->execute();
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        return $user;
    }

    public function getuserbyId($userId){
        $stmt = $this->conn->prepare("SELECT * FROM users_api WHERE Id = :userId");
        $stmt->bindParam(':userId', $userId);
        $stmt->execute();
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        return $user;
    }
}
