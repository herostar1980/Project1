<?php
    session_start();
    require_once("../model/connect.php");
    require_once("../model/shop.php");

//    connect();
        $conn = connect();
        $IMAGE_DIR =  "../images/";
    include_once "../view/header.php";
    if(isset($_GET["act"])){
        $act= $_GET["act"];
        switch($act){
                            
            case 'about':
                    include "../view/about.php";
                    break;
            case 'blog-details':
                    include "../view/blog-details.php";
                    break;
            case 'blog':
                    include "../view/blog.php";
                    break;
            case 'shopping-cart':
                    include "../view/cart.php";
                    break;                    
            case 'cart':                                       
                    include "../model/cart.php";                
                    
                    if(isset($_GET['id'])){
                        $id=$_GET['id'];
                        }
                        $action = (isset($_GET['action'])) ? $_GET['action'] : 'add';
                        $quantity =(isset($_GET['quantity'])) ? $_GET['quantity'] : 1;
                        if($quantity <= 0){
                        $quantity=1;
                        }                                                                                                
                    $item = getProductDetailId($conn, $id);
                //     session_destroy();
                //         die(); 
                    foreach($item as $i){
                            $i=
                            [
                                    'id'=>$i['idProductDetail'],
                                    'color'=>$i['color'],
                                    'size'=>$i['size'],
                                    'price'=>($i['price']>0) ? $i['price'] : $i['oldPrice'],
                                    'img'=>$i['imgUrl'],
                                    'quantity'=> $quantity


                            ];          
                    }
                    if($action == 'add'){
                        if(isset($_SESSION['cart'] [$id])){
                            $_SESSION['cart'] [$id]['quantity']+=$quantity;
                        
                        }else{
                            $_SESSION['cart'] [$id] = $i;
                        }
                    }
                    if($action == 'update'){
                        $_SESSION['cart'][$id]['quantity'] = $quantity;
                    }
                    if($action == 'delete'){
                        unset($_SESSION['cart'][$id]);
                    }                              
                    include "../view/cart.php";
                    break;
            case 'checkout':
                    include "../view/checkout.php";
                    break;
            case 'confirmation':
                    include "../view/confirmation.php";
                    break;
            case 'contact':
                    include "../view/contact.php";
                    break;
            case 'productDetail':
                    include "../model/Products.php";
                    $data = "";
                    if(isset($_GET['id'])&&$_GET['id']>0){
                        $id= $_GET['id'];
                        $data = getProductDetail($conn, $id);
                    }else {
                        $pro=0;
                    }
                    include "../view/product_details.php";
                    break;
            case 'shop':
                include "../model/ProductDetail.php";
                include "../model/Products.php";
                $products = getAllProduct($conn);
                $brand = getAllBrand();
                $group = getAllGroup();
                    include "../view/shop.php";
                    break;
            case 'register':
                    include "../view/register.php";
                    break;
            case 'login':
                    //login
                        require "../model/user.php";
                        $MESSAGE="";
                        extract($_REQUEST);
                        if(array_key_exists("login", $_REQUEST)){
                        $user = khach_hang_select_by_id($username);
                        if($user){
                                if($user['password'] == $password){
                                $MESSAGE = "Đăng nhập thành công!"; 
                                $_SESSION["username"] = $user;                                                 
                                }else{
                                $MESSAGE = "Sai mật khẩu!";
                                }                              
                        }else{
                                $MESSAGE = "Sai ten đăng nhập!";
                        }}                        
                    if(isset($_SESSION['username'])){
                        include '../view/login/info.php';
                    }else{         
                        include "../view/login/login-form.php";
                    }                        
                    //logout
                    if(isset($_GET['logout'])){
                        unset($_SESSION['username']);                        
                        } 
                    break;
            case 'forgot_password':
                        include "../model/Fotgot_password.php";
                        include "../view/forgotpassword.php";
                        if(isset($_POST['fpw_btn'])) {
                                $email = $_POST['email'];
                                $message = forgot_password($conn, $email);
                                echo "<script type='text/javascript'>alert('$message');</script>";
                        }
                break;

            case 'cart':
                        include_once "../view/cart.php";
                        break;

            default:
                include "../model/Products.php";
                include_once "../view/home.php";
                break;
    } 
    }else {
        include "../model/ProductDetail.php";
        include "../model/Products.php";
        $data = getFlashSale($conn);
        $newProducts = getProductsNew($conn);
        $bestSeller = getProductsPoppular($conn);
        $products = getAllProduct($conn);
        include_once "../view/home.php";
    }
  
    include_once "../view/footer.php";
?>