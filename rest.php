<?php

require_once('utils/constans.php');

class Rest{
    
    protected $request;
    protected $serviceName;
    protected $param;

    public function __construct(){
        if($_SERVER['REQUEST_METHOD'] !== 'POST'){
            $this->throwError(REQUEST_METHOD_NOT_VALID, 'request method tidak valid, gunakan hanya method post saja.');
        }
        $handler = fopen('php://input', 'r');
        $this->request = stream_get_contents($handler);
        $this->validateRequest();
    }

    public function validateRequest(){
        if($_SERVER['CONTENT_TYPE'] !== 'application/json'){
            $this->throwError(REQUEST_CONTENTTYPE_NOT_VALID, 'request content type tidak valid, gunakan hanya application/json saja.');
        }

        $data = json_decode($this->request, true);
        if(!isset($data['name']) || $data['name'] == ''){
            $this->throwError(API_NAME_REQUIRED, 'name api masih kosong.');
        }
        $this->serviceName = $data['name'];

        if(!isset($data['param']) || !is_array($data['param'])){
            $this->throwError(API_PARAM_REQUIRED, 'param api masih kosong.');
        }
        $this->param = $data['param'];
    }

    public function processApi(){
       $api = new Api;
       $rMethod = new reflectionMethod('API', $this->serviceName);

       if(!method_exists($api, $this->serviceName)){
           $this->throwError(API_DOST_NOT_EXIST, 'service name api masih kosong.');
       }
       $rMethod->invoke($api);
    }

    public function validateParameter($fieldName, $dataType, $required = true){
        if(!isset($this->param[$fieldName])){
            $this->throwError(VALIDATE_PARAMETER_REQUIRED, 'parameter '.$fieldName.' masih kosong.');
        }
        if($required && empty($this->param[$fieldName])){
            $this->throwError(VALIDATE_PARAMETER_REQUIRED, 'parameter '.$fieldName.' masih kosong.');
        }
        switch ($dataType) {
            case BOOLEAN:
                if(!is_bool($this->param[$fieldName])){
                    $this->throwError(VALIDATE_PARAMETER_DATATYPE, 'tipe data dari parameter '.$fieldName.' tidak valid. gunakan boolean.');
                }
                break;
            case INTEGER:
                if(!is_numeric($this->param[$fieldName])){
                    $this->throwError(VALIDATE_PARAMETER_DATATYPE, 'tipe data dari parameter '.$fieldName.' tidak valid. gunakan numerik.');
                }
                break;
            case STRING:
                if(!is_string($this->param[$fieldName])){
                    $this->throwError(VALIDATE_PARAMETER_DATATYPE, 'tipe data dari parameter '.$fieldName.' tidak valid. gunakan string.');
                }
                break;
            default:
                if(!is_string($this->param[$fieldName])){
                    $this->throwError(VALIDATE_PARAMETER_DATATYPE, 'tipe data dari parameter '.$fieldName.' tidak valid.');
                }
                break;
        }
        return $this->param[$fieldName];
    }

    public function throwError($code, $message){
        header('content-type:application/json');
        $errMsg = json_encode(['error'=>['status'=>$code, 'message'=>$message]]);
        echo $errMsg; exit;
    }

    public function returnResponse($code, $message){
        header('content-type:application/json');
        $result = json_encode(['response'=>['status'=>$code, 'result'=>$message]]);
        echo $result; exit;
    }
    
    public function getAuthorizationHeader(){
        $header = null;
        if(isset($_SERVER['Authorization'])){
            $header = trim($_SERVER['Authorization']);
        }else if(isset($_SERVER['HTTP_AUTHORIZATION'])){
            $header = trim($_SERVER['HTTP_AUTHORIZATION']);
        }elseif (function_exists('apache_request_headers')) {
            $requestHeader = apache_request_headers();
            $requestHeader = array_combine(array_map('ucwords', array_keys($requestHeader)), array_values($requestHeader));
            if(isset($requestHeader['Authorization'])){
                $header = trim($requestHeader['Authorization']);
            }
        }
        return $header;
    }

    public function getBearerToken(){
        $header = $this->getAuthorizationHeader();
        if(!empty($header)){
            if(preg_match("/Bearer\s(\S+)/", $header, $matches)){
                return $matches[1];
            }
        }
        $this->throwError(ATHORIZATION_HEADER_NOT_FOUND, 'token tidak valid, akses ditolak.');
    }
}

?>