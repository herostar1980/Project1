<p class="right__desc">Thêm Nhân viên mới</p>
    <div class="right__formWrapper">
        <form action="index.php" method="post" enctype="multipart/form-data">
            <?php
                if(strlen($MESSAGE)){
                    echo "<h5>$MESSAGE</h5>";
                }
            ?>
            <div class="right__inputWrapper">
                <label for="name">Tên Nhân viên</label>
                <input name="ten_nv" type="text" placeholder="Tên admin">
            </div>                               
            <div class="right__inputWrapper">
                <label>Hình ảnh</label>
                <input name="images" type="file">
            </div>
            <div class="right__inputWrapper">
                <label for="diachi">Địa chỉ</label>
                <input name="dia_chi" type="text" placeholder="địa chỉ">
            </div>
            <div class="right__inputWrapper">
                <label for="sdt">Số điện thoại</label>
                <input name="sdt" type="text" placeholder="số điện thoại">
            </div>
            <div class="right__inputWrapper">
                <label for="ngaysinh">Ngày sinh</label>
                <input name="ngay_sinh" type="text" placeholder="Ngày sinh">
            </div>
            <div class="right__inputWrapper">
                <label for="email">Email</label>
                <input name="email" ype="text" placeholder="Email">
            </div>
            <div class="right__inputWrapper">
                <label for="name">Tài khoản</label>
                <input name="taikhoan_nv" type="text" placeholder="tài khoản">
            </div>      
            <div class="right__inputWrapper">
                <label for="name">Password</label>
                <input name="matkhau_nv" type="password" placeholder="Password">
            </div>      
            
            <div class="right__inputWrapper">
                <label for="name">chức danh</label>
                <input name="id_role" type="text">
            </div>             
            <button name="btn_insert" class="btn" type="submit">Thêm</button>
        </form>
    </div>