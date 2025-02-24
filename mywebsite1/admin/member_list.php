<?php
// query ข้อมูลสมาชิก
 $queryMember = $condb->prepare("SELECT * FROM tbl_member");
 $queryMember->execute();
 $rsMember = $queryMember->fetchAll();

// echo'<pre>';
// $queryMember->debugDumpParams();
// exit;
?>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>จัดการข้อมูลสมาชิก
            <a href="member.php?act=add" class="btn btn-primary">เพิ่มข้อมูล</a>
          </h1>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <!-- /.card -->
            <div class="card">
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example_1" class="table table-bordered table-striped table-sm">
                  <thead>
                  <tr>
                    <th width="5%" class="text-center">ID.</th>
                    <th width="43%"class="text-center">ชื่อ - นามสกุล</th>
                    <th width="30%"class="text-center">Email/Username</th>
                    <th width="5%"class="text-center">ระดับ</th>
                    <th width="7%"class="text-center">เเก้รหัส</th>
                    <th width="5%"class="text-center">เเก้ไข</th>
                    <th width="5%"class="text-center">ลบ</th>
                  </tr>
                  </thead>
                  <tbody>   
                    <?php 
                    $i=1;
                    foreach ($rsMember as $row) { ?>
                  <tr>
                    <td align="center"><?php echo $i++;?> </td>
                    <td><?=$row['title_name'].' '.$row['name'].' '.$row['surname'];?></td>
                    <td><?=$row['username'];?></td>
                    <td><?=$row['m_level'];?></td>
                    <td align="center">
                    <a href="member.php?id=<?=$row['id'];?>&act=editPwd" class="btn btn-info btn-sm">แก้รหัส</a></td>
                    <td align="center">
                    <a href="member.php?id=<?=$row['id'];?>&act=edit" class="btn btn-success btn-sm">แก้ไข</a></td>
                    <td align="center">
                    <a href="member.php?id=<?=$row['id'];?>&act=delete" class="btn btn-danger btn-sm" onclick="return confirm('ยืนยันการลบข้อมูล ?');">ลบ</a>
                    </td>
                  </tr>
                    <?php } ?>
                  </tbody>

                  <!-- <tfoot>
                  <tr>
                    <th>Rendering engine</th>
                    <th>Browser</th>
                    <th>Platform(s)</th>
                    <th>Engine version</th>
                    <th>CSS grade</th>
                  </tr>
                  </tfoot> -->
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->