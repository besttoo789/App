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
                      <label class="col-sm-1">ชื่อ</label>
                      <div class="col-sm-4">
                        <input type="text" name="name" class="form-control" require placeholder="ชื่อ" >
                      </div>
                    </div>
                  
                    <div class="form-group row">
                      <label class="col-sm-1">นามสกุล</label>
                      <div class="col-sm-4">
                        <input type="text" text='surname' class="form-control" require placeholder="นามสกุล" >
                      </div>
                    </div>
                  <div class="form-group row">
                      <label class="col-sm-1"></label>
                      <div class="col-sm-4">
                        <!-- <button type="submit" class="btn btn-primary">submit</button> -->
                        <button type="submit" class="btn btn-primary">บันทึก</button>
                        <a href="member.php" class="btn btn-danger">ยกเลิก</a>
                      </div>
                    </div>
                </form>

                <?php
  echo"pre";
  print_r($_POST);


  ?>
              </div>
            </div>
          </div>
        </div>
        <!-- /.col-->
      </div>
      <!-- ./row -->
    </section>
    <!-- /.content -->
  </div>

