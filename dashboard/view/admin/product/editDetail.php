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
                        <form action="" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label>ID Product :</label>
                                <?php echo $data->idProduct ?>
                            </div>
                            <div class="form-group">
                                <label>Color : </label>
                                <input type="text" name="color" class="form-control" required value="<?=$data->color?>">
                            </div>
                            <div class="form-group">
                                <label>Size : </label>
                                <select name="size" class="form-control" value="<?=$data->size?>">
                                    <option value="S">S</option>
                                    <option value="M">M</option>
                                    <option value="XL">XL</option>
                                    <option value="XXL">XXL</option>
                                    <option value="Free size">Free size</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Price : </label>
                                <input type="text" name="price" class="form-control" required value="<?=$data->price?>">
                            </div>
                            <div class="form-group">
                                <label>Old Price : </label>
                                <input type="text" name="oldPrice" class="form-control" required value="<?=$data->oldPrice?>">
                            </div>
                            <div class="form-group">
                                <label> ImageUrl :</label>
                                <input type="file" name="imgUrl" required value="">
                            </div>
                            <div class="form-group">
                                <label>Quantity </label>
                                <input type="text" name="quantity" class="form-control" required value="<?=$data->quantity?>">
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