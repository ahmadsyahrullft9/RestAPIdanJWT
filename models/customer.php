<?php

require_once('./utils/dbconnect.php');

class Customer {

    private $tableName = 'customer';
    private $Id, $Name, $Email, $Address, $Mobile, $UpdateBy, $UpdateOn, $CreatedBy, $CreatedOn;
    private $conn;

    public function __construct(){
        $db = new DbConnect();
        $this->conn = $db->connect();
    }

    public function getall_costumer($index = 0){
        $stmt = $this->conn->prepare('SELECT * FROM '.$this->tableName.' LIMIT '.$index.', 10');
        $stmt->execute();
        $costumers = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $costumers;
    }

    public function reconnect(){
        $db = new DbConnect();
        $conn = $db->connect();
        return true;
    }

    /**
     * Get the value of Id
     */ 
    public function getId(){
        return $this->Id;
    }

    /**
     * Set the value of Id
     *
     * @return  self
     */ 
    public function setId($Id){
        $this->Id = $Id;

        return $this;
    }

    /**
     * Get the value of Name
     */ 
    public function getName(){
        return $this->Name;
    }

    /**
     * Set the value of Name
     *
     * @return  self
     */ 
    public function setName($Name){
        $this->Name = $Name;

        return $this;
    }

    /**
     * Get the value of Email
     */ 
    public function getEmail(){
        return $this->Email;
    }

    /**
     * Set the value of Email
     *
     * @return  self
     */ 
    public function setEmail($Email){
        $this->Email = $Email;

        return $this;
    }

    /**
     * Get the value of Address
     */ 
    public function getAddress(){
        return $this->Address;
    }

    /**
     * Set the value of Address
     *
     * @return  self
     */ 
    public function setAddress($Address){
        $this->Address = $Address;

        return $this;
    }

    /**
     * Get the value of Mobile
     */ 
    public function getMobile(){
        return $this->Mobile;
    }

    /**
     * Set the value of Mobile
     *
     * @return  self
     */ 
    public function setMobile($Mobile){
        $this->Mobile = $Mobile;

        return $this;
    }

    /**
     * Get the value of UpdateBy
     */ 
    public function getUpdateBy(){
        return $this->UpdateBy;
    }

    /**
     * Set the value of UpdateBy
     *
     * @return  self
     */ 
    public function setUpdateBy($UpdateBy){
        $this->UpdateBy = $UpdateBy;

        return $this;
    }

    /**
     * Get the value of UpdateOn
     */ 
    public function getUpdateOn(){
        return $this->UpdateOn;
    }

    /**
     * Set the value of UpdateOn
     *
     * @return  self
     */ 
    public function setUpdateOn($UpdateOn){
        $this->UpdateOn = $UpdateOn;

        return $this;
    }

    /**
     * Get the value of CreatedBy
     */ 
    public function getCreatedBy(){
        return $this->CreatedBy;
    }

    /**
     * Set the value of CreatedBy
     *
     * @return  self
     */ 
    public function setCreatedBy($CreatedBy){
        $this->CreatedBy = $CreatedBy;

        return $this;
    }

    /**
     * Get the value of CreatedOn
     */ 
    public function getCreatedOn(){
        return $this->CreatedOn;
    }

    /**
     * Set the value of CreatedOn
     *
     * @return  self
     */ 
    public function setCreatedOn($CreatedOn){
        $this->CreatedOn = $CreatedOn;

        return $this;
    }
}


?>