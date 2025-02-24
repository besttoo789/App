<?php
//เริ่มต้นsession
session_start();
require_once("config/condb.php");

// Remove or comment out the debug code
// echo'<pre>';
// print_r($_POST);
// exit;

if(isset($_POST['username']) && isset($_POST['password']) && $_POST['action'] == 'login') {

    //ประกาศตัวแปรรับค่าจากฟอร์ม
    $username = $_POST['username'];
    $password = sha1($_POST['password']); //เก็บรหัสผ่านในรูปแบบ sha1 
 
    //check username  & password
    $stmtLogin = $condb->prepare("SELECT id, m_level FROM tbl_member WHERE username = :username AND password = :password");
    $stmtLogin->bindParam(':username', $username , PDO::PARAM_STR);
    $stmtLogin->bindParam(':password', $password , PDO::PARAM_STR);
    $stmtLogin->execute();

    // echo $stmtLogin->rowCount();
    // exit;  

    //กรอก username & password ถูกต้อง
    if($stmtLogin->rowCount() == 1){
        //fetch เพื่อเรียกคอลัมภ์ที่ต้องการไปสร้างตัวแปร session
        $row = $stmtLogin->fetch(PDO::FETCH_ASSOC);
        
        // Clear existing session variables
        session_unset();
        
        //สร้างตัวแปร session
        $_SESSION['staff_id'] = $row['id'];
        $_SESSION['m_level'] = $row['m_level'];
        
        //เช็คว่ามีตัวแปร session อะไรบ้าง
        // print_r($_SESSION);
        // exit();
 
        $conn = null; //close connect db

        if ($_SESSION['m_level'] == 'admin') { //admin
            header('Location: admin/');  
        
        }

        else if ($_SESSION['m_level'] == 'staff') { //staff
            header('Location: staff/');  
        }



    } else { //ถ้า username or password ไม่ถูกต้อง
        echo '<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>';
        echo '<script>
            setTimeout(function() {
                swal({
                    title: "เกิดข้อผิดพลาด",
                    text: "Username หรือ Password ไม่ถูกต้อง ลองใหม่อีกครั้ง",
                    type: "warning"
                }, function() {
                    window.location = "login.php"; //หน้าที่ต้องการให้กระโดดไป
                });
            }, 1000);
        </script>';
    } //else
}
print_r($_SESSION);
?> 






<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="assets/plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="assets/dist/css/adminlte.min.css?v=3.2.0">

</head>

<body class="hold-transition login-page">
    <div class="login-box">
        <div class="login-logo">
            <b>Stock</b>Login</a>
        </div>
        <!-- /.login-logo -->
        <div class="card">
            <div class="card-body login-card-body">
                <p class="login-box-msg">ล็อคอินเข้าใช้งานระบบยืม - คืน</p>

                <form action="" method="post">
                    <div class="input-group mb-3">
                        <input type="email" name="username" class="form-control" placeholder="Email/Username" required>
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-user"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="password" name="password" class="form-control" placeholder="Password" required>
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <button type="submit" name="action" value="login" class="btn btn-outline-success">Login</button>
                        </div>
                    </div>
                </form>

                <div class="social-auth-link text-center mb-3">
                    <p></p>
                    <p>- ติดต่อ -</p>
                </div>
                </p> 
            </div>
            <!-- /.login-card-body -->
        </div>
    </div>
    <!-- /.login-box -->

    <!-- jQuery -->
    <script src="assets/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="asstes/dist/js/adminlte.min.js?v=3.2.0"></script>
</body>

</html>