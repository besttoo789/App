<?php
// query ข้อมูลสมาชิก
 $queryPro = $condb->prepare("SELECT * FROM products");
 $queryPro->execute();          
 $rsPro = $queryPro->fetchAll() ;

// $queryPro->debugDumpParams();
// exit;
?>

 <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>จัดการข้อมูลสินค้า
              <a href="productAdd.php" class="btn btn-outline-primary">เพิ่มข้อมูล</a>
          </h1>
          </div>
        </div>
      </div>
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
                <table id="example1" class="table table-bordered table-striped table-sm">
                  <thead>
                  <tr>
                    <th width="5%" class="scope">ID.</th>
                    <th width="23%"class="text-center">ชื่อสินค้า</th>
                    <th width="20%"class="text-center">ประเภท</th>
                    <th width="7%"class="text-center">จำนวน</th>
                    <th width="5%"class="text-center">Barcode</th>
                    <th width="10%"class="text-center">สถานะ</th>
                    <th width="5%"class="text-center">เวลาเพิ่ม</th>
                    <th width="5%"class="text-center">อัพเดทล่าสุด</th>
                    <th width="5%"class="text-center">ลบ</th>
                    
                  </tr>
                  </thead>
                  <tbody>   
                    <?php 
                    $i=1;
                    foreach ($rsPro as $row) { ?>
                  <i>
                    <td align="center"><?php echo $i++;?> </td>
                    <td align="center"><?=$row['product_name'];?></td>
                    <!-- <td><?=$row['product_name'];?></td> -->
                    <td align="center"><?=$row['category'];?></td>
                    <!-- <td><?=$row['category'];?></td> -->
                    <td align="center"><?=$row['quantity'];?></td>
                    <td align="center"><?=$row['barcode'];?></td>
                    <td align="center">
                      <span style="color: <?= $row['stock_status'] == 'ใช้งานได้' ? 'green' : 'red'; ?>">
                        <?=$row['stock_status'];?>
                      </span>
                    </td>
                    <td align="center"><?=$row['created_at'];?></td>
                    <td align="center"><?=$row['updated_at'];?></td>
                    </td>
                    <td align="center">
                    <a href="product.php?id=<?=$row['product_id'];?>&act=delete" class="btn btn-danger btn-sm" onclick="return confirm('ยืนยันการลบข้อมูล ?');">ลบ</a>
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