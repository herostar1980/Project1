<?php 
    function getFlashSale($conn) {
        $sql = "SELECT products.`idProduct` , products.`nameProduct`,productDetail.`idProductDetail`,productDetail.`price` , productDetail.`oldPrice`,products.`imgUrl` , productDetail.`size`,productDetail.`quantity`,products.`flashSale`,products.`note`,products.`date` FROM `products`AS products INNER JOIN `productdetail` AS productDetail ON productDetail.`idProduct` = products.`idProduct` WHERE products.`flashSale` = 1 GROUP BY idProduct LIMIT 6";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $data = $stmt->fetchAll();
        return $data;
    }
?>