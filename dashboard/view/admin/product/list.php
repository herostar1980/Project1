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
                            <th>Details</th>

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
                                <td><img style="width: 50px; heigh:auto;" src="<?php echo  $IMAGE_DIR.$value->imgUrl ?>"></td>
                                <td><?php echo $value->flashSale ?></td>
                                <td><?php echo $value->note ?></td>
                                <td><?php echo $value->date ?></td>
                                <td class="text-center">                                  
                                <a href="?act=products&delete=<?PHP echo $value->idProduct ?>" class="btn-edit">Del</a>                         
                                </td>
                                <td>
                                <a  href="?act=products&edit=<?PHP echo $value->idProduct ?>" class="btn-edit">Edit</a>
                                </td>
                                <td>
                                <a  href="?act=products&detail=<?PHP echo $value->idProduct ?>" class="btn-edit">Detail</a>
                                </td>
                            </tr>
                        <?php }
                    } else { ?>
                        <h1> Hiện không có dữ liệu trong bảng</h1>
                          <div class="container">
        <h2>Sản phẩm: <?= $getName ?> </h2>
        <!-- Trigger the modal with a button -->
        <button type="button" class="btn-submit" data-toggle="modal" data-target="#myModal">Mở bảng chỉnh sửa</button>

        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Modal Header</h4>
                    </div>
                    <div class="modal-body">

                        <h2>Edit Product</h2>
                        <br><br><br>
                        <form action="" method="post">
                            <div class="form-group">
                                <label>ID Product :</label>
                                <?php echo $data->idProduct ?>
                            </div>
                            <div class="form-group">
                                <label> Name :</label>
                                <input type="text" name="nameProduct" class="form-control" value="<?= $data->nameProduct ?>">
                            </div>
                            <div class="form-group">
                                <label> Category :</label>
                                <select name="idCategory" class="form-control" value="">
                                    <?PHP foreach ($data_ctr as $value) {  ?>
                                        <option value="<?= $value->idCategory ?>"><?= $value->nameCategory ?></option>
                                    <?PHP } ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label> Brand :</label>
                                <select name="idBrand" class="form-control" value="">
                                    <?PHP foreach ($data_brand as $value) {  ?>
                                        <option value="<?= $value->idThuongHieu ?>"><?= $value->nameBrand?></option>
                                    <?PHP } ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label> ImageUrl :</label> <input type="text" name="imgUrl" class="form-control" value="<?= $data->imgUrl ?>">
                            </div>
                            <div class="form-group">
                                <label> is Flash Sale :</label> <input type="text" name="flashSale" class="form-control" value="<?= $data->flashSale ?>">
                            </div>
                            <div class="form-group">
                                <label> Discount (%) :</label> <input type="text" name="note" class="form-control" value="<?= $data->note ?>">
                            </div>
                            <div class="form-group">
                                <label> Date :</label> <?= $data->date ?>
                            </div>
                            <input name="update" type="submit" value="Cập nhật" class="btn-submit">
                        </form>

                    </div>
                </div>

            </div>
        </div>

    </div>



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