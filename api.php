<?php

require __DIR__.'/vendor/autoload.php';
use \Firebase\JWT\JWT;

class Api extends Rest{

    private $user_api;
    private $customer;

    public function __construct(){
        parent::__construct();
        $this->user_api = new User_api;
        $this->customer = new Customer;
    }
    
    public function generateToken(){
        $email = $this->validateParameter('email', STRING);
        $password = $this->validateParameter('password', STRING);
        $user = $this->user_api->getuser_byemailpass($email, $password);
        if(!is_array($user)){
            $this->returnResponse(INVALID_USER_PASS, 'email atau password tidak terdaftar.');
        }
        if($user['Active'] == '0'){
            $this->returnResponse(USER_NOT_ACTIVE, 'akun sedang tidak aktif, segera hubungi admin.');
        }
        try {
            $payload = [
                'iat'=>time(),
                'iss'=>'localhost',
                'exp'=>time()+(15*60),
                'userId'=>$user['id']
            ];
            $token = JWT::encode($payload, SECRETE_KEY);
            $this->returnResponse(SUCCESS_RESPONSE, $token);
        } catch (\Exception $e) {
            $this->throwError(JWT_PROCESSING_ERROR, 'tidak dapat membuat token \n'.$e->getMessage());
        }
    }

    public function getcostumers(){
        $index = $this->validateParameter('index', INTEGER, false);
        //index disini untuk keperluan pagination nya
        try {
            $token = $this->getBearerToken();
            $payload = JWT::decode($token, SECRETE_KEY, ['HS256']);
            $user = $this->user_api->getuserbyId($payload->userId);
            if(!is_array($user)){
                $this->returnResponse(INVALID_USER_PASS, 'email atau password tidak terdaftar.');
            }
            if($user['Active'] == '0'){
                $this->returnResponse(USER_NOT_ACTIVE, 'akun sedang tidak aktif, segera hubungi admin.');
            }
            $customers = $this->customer->getall_costumer($index);
            if($customers){
                $this->returnResponse(SUCCESS_RESPONSE, $customers);
            }else{
                $this->throwError(DATA_NOT_FOUND, 'Data tidak ditemukan.');
            }
        } catch (\Exception $e) {
            $this->throwError(ACCESS_TOKEN_ERRORS, $e->getMessage());
        }
    }
}

?>