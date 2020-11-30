<?php 
    function getProductsNew($conn) {
        $sql = "SELECT * FROM `products` WHERE date BETWEEN '2020-11-20' and '2020-11-21";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $data = $stmt->fetchAll();
        return $data;
    }

    function getProductDetail($conn, $id) {
        $sql = "SELECT products.`idProduct` , products.`nameProduct`,productDetail.`idProductDetail`,productDetail.`price` , productDetail.`oldPrice`,products.`imgUrl` , productDetail.`size`,productDetail.`quantity`,products.`flashSale`,products.`note`,products.`date`, products.`description` FROM `products`AS products INNER JOIN `productdetail` AS productDetail ON productDetail.`idProduct` = products.`idProduct` WHERE products.`idProduct` = '$id'";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $data = $stmt->fetchAll();
        return $data;
    }

    function getAllProduct($conn) {
        // $sql = "SELECT idProduct, nameProduct,  FROM products";  WHERE products.`flashSale` = 1"
        $sql = "SELECT products.`idProduct` , products.`nameProduct`,productDetail.`idProductDetail`,productDetail.`price` , productDetail.`oldPrice`,products.`imgUrl` ,productDetail.`quantity`, products.`date` FROM `products`AS products INNER JOIN `productdetail` AS productDetail ON productDetail.`idProduct` = products.`idProduct`";

        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $data = $stmt->fetchAll();
        return $data;
    }
?>

