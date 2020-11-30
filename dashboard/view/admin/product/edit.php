<!DOCTYPE html>
<html lang="en">

<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>

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

</body>

</html>