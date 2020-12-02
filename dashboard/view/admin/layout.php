<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="shortcut icon" href="../public/assets/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="<?=$PUBLIC_URL?>/css/main.css">
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <div class="dashboard">
                <?php require 'menu.php' ?>
                <div class="right">
                    <div class="right__content">
                    <div class="right__title">DASHBOARD</div>
                    
                        <?php require $VIEW_NAME; ?>
                </div>
            </div>
        </div>
    </div>

    <script src="<?=$PUBLIC_URL?>/js/main.js"></script>
</body>
</html>