<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>ฟอร์มเพิ่มข้อมูลสมาชิก</h1>
        </div>
      </div>
    </div><!-- /.container-fluid -->
  </section>
  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-md-12">
        <div class="card card-outline card-info">
          <!-- /.card-header -->
          <div class="card-body">
            <div class="card card-primary"> 
              <!-- form start -->
              <form action="" method="post"> 
                <div class="card-body">

                  <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Email/Username</label>
                    <div class="col-sm-4">
                      <input type="email" name="username" class="form-control" required placeholder="Email">
                    </div>
                  </div>

                  <div class="form-group row">
                    <label class="col-sm-2 col-form-label">รหัสผ่าน</label>
                    <div class="col-sm-4">
                      <input type="password" name="password" class="form-control" required placeholder="Password">
                    </div>
                  </div>
                  
                  <div class="form-group row">
                    <label class="col-sm-2 col-form-label">คำนำหน้า</label>
                    <div class="col-sm-4">
                      <select name="title_name" class="form-control" required>
                        <option value="">-- คำนำหน้า --</option>
                        <option value="นาย">นาย</option>
                        <option value="นาง">นาง</option>
                        <option value="นางสาว">นางสาว</option>
                      </select>
                    </div>
                  </div>
                  
                  <div class="form-group row">
                    <label class="col-sm-2 col-form-label">ชื่อ</label>
                    <div class="col-sm-4">
                      <input type="text" name="name" class="form-control" required placeholder="ชื่อ">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-sm-2 col-form-label">นามสกุล</label>
                    <div class="col-sm-4">
                      <input type="text" name='surname' class="form-control" required placeholder="นามสกุล">
                    </div>
                  </div>

                  <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Level</label>
                    <div class="col-sm-4">
                      <select name="m_level" class="form-control" required>
                        <option value="level" disabled >-- level -- </option> 
                        <option value="admin">admin</option>
                        <option value="staff">staff</option>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-4">
                      <button type="submit" class="btn btn-primary">บันทึก</button>
                      <a href="member.php" class="btn btn-danger">ยกเลิก</a>
                    </div>
                  </div>
                </div>
              </form>
              <?php
              // echo"<pre>";
              // print_r($_POST);
              // exit;

use function PHPSTORM_META\map;

              ?>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>

<?php
if (isset($_POST['username']) && isset($_POST['name']) && isset($_POST['surname']) && isset($_POST['m_level'])) {

  $username = $_POST['username'];
  $password = sha1($_POST['password']); 
  $title_name = $_POST['title_name'];
  $name = $_POST['name'];
  $surname = $_POST['surname'];
  $m_level = $_POST['m_level'];
  // echo'<pre>';
  // print_r($_POST);
  // exit;

  // Check for duplicate username
  $stmtMemberDetail = $condb->prepare("SELECT username FROM tbl_member WHERE username = :username");
  $stmtMemberDetail->bindParam(':username', $username, PDO::PARAM_STR);
  $stmtMemberDetail->execute();

  $row = $stmtMemberDetail->fetch(PDO::FETCH_ASSOC);

  if($stmtMemberDetail->rowCount() == 1){
    echo '<script>
           setTimeout(function() {
            swal({
                title: "Username/Email ซ้ำ",
                text: "กรุณาเพิ่มข้อมูลใหม่อีกครั้ง",
                type: "error"
            }, function() {
                window.location = "member.php?act=add"; //หน้าที่ต้องการให้กระโดดไป
            });
          }, 1000);
      </script>';
    } else {
    // Insert new member data
    $stmtInsertMember = $condb->prepare("INSERT INTO tbl_member 
    (
      username,
      password,
      title_name,
      name, 
      surname,
      m_level
    )
    VALUES 
    (
      :username,
      :password,
      :title_name,
      :name, 
      :surname,
      :m_level
    )");

    $stmtInsertMember->bindParam(':username', $username, PDO::PARAM_STR);
    $stmtInsertMember->bindParam(':username', $username, PDO::PARAM_STR);
    $stmtInsertMember->bindParam(':password', $password, PDO::PARAM_STR);
    $stmtInsertMember->bindParam(':title_name', $title_name, PDO::PARAM_STR);
    $stmtInsertMember->bindParam(':name', $name, PDO::PARAM_STR);
    $stmtInsertMember->bindParam(':surname', $surname , PDO::PARAM_STR);
    $stmtInsertMember->bindParam('m_level', $m_level, PDO::PARAM_STR);  
    $result = $stmtInsertMember->execute();

    $condb = null;
    if($result){
      // echo '<pre>';
      // print_r($_POST);
      // exit();
      echo '<script>
           setTimeout(function() {
            swal({
                title: "เพิ่มข้อมูลสำเร็จ",
                type: "success"
            }, function() {
                window.location = "member.php"; //หน้าที่ต้องการให้กระโดดไป
            });
          }, 1000);
      </script>';
    } else {
      echo '<script>
           setTimeout(function() {
            swal({
                title: "เกิดข้อผิดพลาด",
                type: "error"
            }, function() {
                window.location = "member.php"; //หน้าที่ต้องการให้กระโดดไป
            });
          }, 1000);
      </script>';
    }
  }
}
?>

