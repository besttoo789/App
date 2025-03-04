<?php
$queryBorrow = $condb->prepare("SELECT * FROM product_changes
");
$queryBorrow->execute();
$rsBorrow = $queryBorrow->fetchAll();
?>

<div class="content-wrapper">


  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-12">
          <!-- /.card -->
          <div class="card">
            <!-- /.card-header -->
            <div class="card-body">
            <table id="example1" class="table table-bordered table-striped table-sm">
            <thead>
                <tr>
                    <th width="10%" class="text-center">ID.</th>
                    <th width="25%" class="text-center">ประเภทการทำรายการ</th>
                    <th width="20%" class="text-center">จำนวนเก่า</th>
                    <th width="10%" class="text-center">จำนวนคงเหลือ</th>
                    <th width="10%" class="text-center">วันที่เเก้ไข</th>
                    <th width="10%" class="text-center">เเก้โดย</th>
                    <th width="10%" class="text-center">วันที่เพิ่ม</th>
                    <th width="15%" class="text-center">เลขสินค้า</th>
                </tr>
                </thead>
                <tbody>   
                  <?php 
                  $i=1;
                  foreach ($rsBorrow as $row) { ?>
                <tr>
                  <td class="text-center"><?php echo $i++;?> </td>
                  <td class="text-center">
                  <span style="color: <?php echo $row['change_type'] =='ADD' ? 'green' : 'orange'; ?>">
                      <?php echo $row['change_type'] == 'ADD' ? 'เพิ่มเข้า' : 'อัพเดท'; ?>
                      
                    </span></td>
                  <td class="text-center"><?php echo $row['old_quantity'];?></td>
                  <td class="text-center"><?php echo $row['new_quantity'];?></td>
                  <td class="text-center"><?php echo $row['changed_at'];?></td>
                  <td class="text-center">
                    <span style="color: <?php echo $row['changed_by'] == 'admin' ? 'green' : 'red'; ?>">
                      <?php echo $row['changed_by'];?>
                    </span>
                  </td>
                  <td class="text-center"><?php echo $row['created_at'];?></td>
                  <td class="text-center"><?php echo $row['product_id'];?></td>
                </tr>
                  <?php } ?>
                </tbody>
              </table>
            </div>
          </div>
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