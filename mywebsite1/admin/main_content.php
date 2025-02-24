<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0">เลือกข้อมูลการทำงาน</h1>
        </div><!-- /.col -->
        <!-- /.col -->
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
  </div>
  <!-- /.content-header -->
  <!-- Main content -->
  <section class="content">
    <div class="container-fluid" >
      <!-- New buttons row (2x3 layout) -->
      <div class="row">
        <div class="col-md-6 mb-3">
          <a href="member.php"  class="gap_fl_btn btn btn-float btn-float-lg btn-outline-primary w-100">
            <i class="la la-chalkboard-teacher font-large-2"></i>
            <!-- <span>จัดการบุคลากร</span> -->
            <i class="nav-icon fas fa-user-cog"> จัดการบุคลากร </i>
          </a>
        </div>
        <div class="col-md-6 mb-3">
          <a href="product.php" routerlinkactive="router-link-active" class="gap_fl_btn btn btn-float btn-float-lg btn-outline-warning w-100">
            <i class="la la-user-graduate font-large-2"></i>
            <i class="nav-icon fas fa-building"> จัดการข้อมูลสำนักงาน</i>
          </a>
        </div>
      </div>
      <!-- Second row of buttons -->
      <div class="row">
        <div class="col-md-6 mb-3">
        <a href="product.php" class="gap_fl_btn btn btn-float btn-float-lg btn-outline-success w-100">
            <i class="nav-icon fas fa-boxes"> จัดการข้อมูลการเพิ่มเข้า </i>
          </a>
        </div>
        <div class="col-md-6 mb-3">
          <a href="disbursement.php" class="gap_fl_btn btn btn-float btn-float-lg btn-outline-info w-100">
            <i class="nav-icon fas fa-warehouse"> จัดการข้อมูลการเบิกจ่าย</i>
          
          </a>
        </div>
      </div>
      <!-- Third row of buttons -->
      <div class="row">
        <div class="col-md-6 mb-3">
          <a href="History_disbursement.php" class="gap_fl_btn btn btn-float btn-float-lg btn-outline-dark w-100">
            <i class="la la-cogs font-large-2"></i>
            <i class="nav-icon fas fa-tools"> ประวัตการเบิกจ่าย </i>
          </a>
        </div>
        
      </div>
      <!-- ./row -->
    </div><!-- /.container-fluid -->
  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<!-- Optional CSS for styling -->
<style>
  .btn-float {
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    padding: 15px;
    font-size: 16px;
  }

  .w-100 {
    width: 100%;
  }

  .gap_fl_btn {
    border-radius: 8px;
    padding: 20px;
    transition: all 0.3s ease;
  }

 

  .font-large-2 {
    font-size: 30px;
    margin-bottom: 10px;
  }
</style>
