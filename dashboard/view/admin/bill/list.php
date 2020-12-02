<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>Document</title>
</head>

<body>

<div class="right__cards">
        <a class="right__card" href="view_product.html">
            <div class="right__cardTitle">Products</div>
            <div class="right__cardNumber">72</div>
            <div class="right__cardDesc">See more <img src="../public/assets/arrow-right.svg" alt=""></div>
        </a>
        <a class="right__card" href="view_customers.html">
            <div class="right__cardTitle">User</div>
            <div class="right__cardNumber">12</div>
            <div class="right__cardDesc">See more <img src="../public/assets/arrow-right.svg" alt=""></div>
        </a>
        <a class="right__card" href="view_p_category.html">
            <div class="right__cardTitle">Category</div>
            <div class="right__cardNumber">4</div>
            <div class="right__cardDesc">See more <img src="../public/assets/arrow-right.svg" alt=""></div>
        </a>
        <a class="right__card" href="view_orders.html">
            <div class="right__cardTitle">Bill</div>
            <div class="right__cardNumber">72</div>
            <div class="right__cardDesc">See more <img src="../public/assets/arrow-right.svg" alt=""></div>
        </a>
    </div>
    <div class="right__table">
        <p class="right__tableTitle">Danh sách đơn hàng</p>
        <div class="right__tableWrapper">
            <?PHP
            if (!empty($data)) {
            ?>
                <table>
                    <thead>
                        <tr>
                            <th>ID Bill</th>
                            <th>ID User</th>
                            <th>Total</th>
                            <th>Date</th>
                            <th>Xoá</th>
                            <th>Chi tiết</th>

                        </tr>
                    </thead>

                    <tbody>
                        <?php

                        foreach ($data as $value) {         ?>
                            <tr>
                                <td><?php echo $value->idBill ?></td>
                                <td><?php echo $value->idUser?></td>
                                <td><?php echo $value->total ?></td>
                                <td><?php echo $value->date ?></td>
                                <td class="text-center">                                  
                                <a href="?act=bill&delete=<?PHP echo $value->idBill ?>" class="btn-edit">Del</a>                         
                                </td>
                                <td>
                                <a  href="?act=bill&detail=<?PHP echo $value->idBill ?>" class="btn-edit">Detail</a>
                                </td>
                            </tr>
                        <?php }
                    } else { ?>
                        <h1> Hiện không có dữ liệu trong bảng</h1>



                    <?PHP } ?>
                    </tbody>
                </table>
        </div>
    </div>
    </div>
</body>

</html>