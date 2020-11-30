<!DOCTYPE html>
<html lang="en">

<head>
    <title> Thêm Sản phẩm mới</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>

    <div class="container">
        <h2> Set chi tiết cho sản phẩm </h2>
<br><br><br>
        <form action="" method="post">
            <div class="form-group">
                <label>Name Product : </label>
                <select  name="idProduct" class="form-control" value="">
                    <?PHP foreach ($data_prd as $value) {  ?>
                        <option value="<?= $value->idProduct ?>"><?= $value->nameProduct?></option>  
                    <?PHP } ?>
                    </select>
            </div>
            <div class="form-group">
                <label>Color : </label>
                <input type="text" name="color" class="form-control" value="">
            </div>
            <div class="form-group">
                <label>Size : </label> 
                <select name="size" class="form-control" value="">
                        <option value="S">S</option>
                        <option value="M">M</option>
                        <option value="XL">XL</option>    
                        <option value="XXL">XXL</option>
                        <option value="Free size">Free size</option>    
                    </select>
            </div>
            <div class="form-group">
                <label>Price : </label> 
                <input type="text" name="price" class="form-control" value="">
            </div>
            <div class="form-group">
                <label>Old Price : </label> 
                <input type="text" name="oldPrice" class="form-control" value="">
            </div>
            <div class="form-group">
                <label>Image Url </label> 
                <input type="text" name="imgUrl" class="form-control" value="">
            </div>
            <div class="form-group">
                <label>Quantity </label> 
                <input type="text" name="quantity" class="form-control" value="">
            </div>

            <input name="update" type="submit" value="Thêm" class="btn-submit">
        </form>

    </div>

</body>

</html>