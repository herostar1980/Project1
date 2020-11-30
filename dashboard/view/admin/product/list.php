<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>Product</title>
    <link rel="shortcut icon" href="../public/assets/favicon.ico" type="image/x-icon">
</head>

<body>

    <p class="right__desc">Bảng điều khiển</p>
    <div class="right__cards">
        <a class="right__card" href="view_product.html">
            <div class="right__cardTitle">Sản Phẩm</div>
            <div class="right__cardNumber">72</div>
            <div class="right__cardDesc">Xem Chi Tiết <img src="../public/assets/arrow-right.svg" alt=""></div>
        </a>
        <a class="right__card" href="view_customers.html">
            <div class="right__cardTitle">Khách Hàng</div>
            <div class="right__cardNumber">12</div>
            <div class="right__cardDesc">Xem Chi Tiết <img src="../public/assets/arrow-right.svg" alt=""></div>
        </a>
        <a class="right__card" href="view_p_category.html">
            <div class="right__cardTitle">Danh Mục</div>
            <div class="right__cardNumber">4</div>
            <div class="right__cardDesc">Xem Chi Tiết <img src="../public/assets/arrow-right.svg" alt=""></div>
        </a>
        <a class="right__card" href="view_orders.html">
            <div class="right__cardTitle">Đơn Hàng</div>
            <div class="right__cardNumber">72</div>
            <div class="right__cardDesc">Xem Chi Tiết <img src="../public/assets/arrow-right.svg" alt=""></div>
        </a>
    </div>
    <div class="right__table">
        <p class="right__tableTitle">Danh sách sản phẩm</p>
        <div class="right__tableWrapper">
            <?PHP
            if (!empty($data)) {
            ?>
                <table>
                    <thead>
                        <tr>
                            <th>ID product</th>
                            <th>Name Product</th>
                            <th>Category</th>
                            <th>Brand</th>
                            <th>Image</th>
                            <th>Flash sale</th>
                            <th>% discount</th>
                            <th>Date</th>
                            <th>Delete</th>
                            <th>Edit</th>

                        </tr>
                    </thead>

                    <tbody>
                        <?php

                        foreach ($data as $value) {         ?>
                            <tr>
                                <td><?php echo $value->idProduct ?></td>
                                <td><?php echo $value->nameProduct ?></td>
                                <td><?php echo $value->idCategory ?></td>
                                <td><?php echo $value->idBrand ?></td>
                                <td><?php echo $value->imgUrl ?></td>
                                <td><?php echo $value->flashSale ?></td>
                                <td><?php echo $value->note ?></td>
                                <td><?php echo $value->date ?></td>
                                <td class="text-center">                                  
                                <a href="?act=products&delete=<?PHP echo $value->idProduct ?>" class="btn-edit">Del</a>                         
                                </td>
                                <td>
                                <a  href="?act=products&edit=<?PHP echo $value->idProduct ?>" class="btn-edit">Edit</a>
                                </td>
                            </tr>
                        <?php }
                    } else { ?>
                        <h1> Hiện không có dữ liệu trong bảng</h1>



                    <?PHP } ?>
                    </tbody>
                </table>
        </div>
        <a href="" class="right__tableMore">
            <p>Xem tất cả các đơn đặt hàng</p> <img src="../public/assets/arrow-right-black.svg" alt="">
        </a>
    </div>
    </div>
</body>

</html>