<?php
if (isset($_GET['id']) && $_GET['act'] == 'edit') {
    // Single row query to display only one record
    $stmtMemberDetail = $condb->prepare("SELECT * FROM tbl_member WHERE id = ?");
    $stmtMemberDetail->execute([$_GET['id']]);
    $row = $stmtMemberDetail->fetch(PDO::FETCH_ASSOC);

    if ($stmtMemberDetail->rowCount() != 1) {
        exit();
    }
}
?>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>ฟอร์มปรับปรุงข้อมูลสมาชิก</h1>
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
                                            <input type="email" name="username" class="form-control" value="<?php echo $row['username']; ?>" disabled>
                                        </div>
                                    </div>
                                      <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">คำนำหน้า</label>
                                        <div class="col-sm-4">
                                          <select name="title_name" class="form-control" required>
                                            <option value="value "><?php echo $row['title_name']; ?></option>
                                            <option value="" disabled>-- คำนำหน้า --</option>
                                            <option value="นาย">นาย</option>
                                            <option value="นาง">นาง</option>
                                            <option value="นางสาว">นางสาว</option>
                                          </select>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">ชื่อ</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="name" class="form-control" required placeholder="ชื่อ" value="<?php echo $row['name']; ?>">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">นามสกุล</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="surname" class="form-control" required placeholder="นามสกุล" value="<?php echo $row['surname']; ?>">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2"></label>
                                        <div class="col-sm-4">
                                            <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                                            <button type="submit" class="btn btn-primary">ปรับบปรุงข้อมูล</button>
                                            <a href="member.php" class="btn btn-danger">ยกเลิก</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<?php
if (isset($_POST['id']) && isset($_POST['name']) && isset($_POST['surname'])) {
    $id = $_POST['id'];
    $title_name = $_POST['title_name'];
    $name = $_POST['name'];
    $surname = $_POST['surname'];

    // SQL update
    $stmtUpdate = $condb->prepare("UPDATE tbl_member SET 
        title_name = :title_name,
        name = :name, 
        surname = :surname 
        WHERE id = :id
    ");
    // bindParam
    $stmtUpdate->bindParam(':id', $id, PDO::PARAM_INT);
    $stmtUpdate->bindParam(':title_name', $title_name, PDO::PARAM_STR);
    $stmtUpdate->bindParam(':name', $name, PDO::PARAM_STR);
    $stmtUpdate->bindParam(':surname', $surname, PDO::PARAM_STR);
    $result = $stmtUpdate->execute();

    $condb = null; // Close connection to the database

    if ($result) {
        echo '<script>
            setTimeout(function() {
                swal({
                    title: "แก้ไขข้อมูลสำเร็จ",
                    type: "success"
                }, function() {
                    window.location = "member.php";
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
                    window.location = "member.php";
                });
            }, 1000);
        </script>';
    }
}
?>
