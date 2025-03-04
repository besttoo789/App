<?php
// Query ข้อมูลสินค้าสำหรับ dropdown
$queryPro = $condb->prepare("SELECT product_id, product_name, quantity FROM products");
$queryPro->execute();          
$rsPro = $queryPro->fetchAll();

// Query ข้อมูลผู้ใช้สำหรับ dropdown
$queryUsers = $condb->prepare("SELECT user_id, username FROM users");
$queryUsers->execute();
$rsUsers = $queryUsers->fetchAll();
?>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>ฟอร์มเบิก - ยืมวัสดุสำนักงาน</h1>
        </div>
      </div>
    </div>
  </section>

  <section class="content">
    <div class="row">
      <div class="col-md-12">
        <div class="card card-outline card-info">
          <div class="card-body">
            <div class="card card-primary"> 
              <form action="" method="post"> 
                <div class="card-body">
                  <div class="form-group row">
                    <label class="col-sm-2 col-form-label">รหัสการเบิก-ยืม</label>
                    <div class="col-sm-4">
                      <input name="reserve_id" class="form-control" disabled placeholder="สร้างอัตโนมัติ">
                    </div>
                  </div> 

                  <!-- Container สำหรับรายการสินค้า -->
                  <div id="products-container">
                    <div class="product-item">
                      <div class="form-group row">
                        <label class="col-sm-2 col-form-label">ชื่อสินค้า</label>
                        <div class="col-sm-4">
                          <select name="products[0][product_id]" class="form-control" required>
                            <option value="">-- เลือกสินค้า --</option>
                            <?php foreach($rsPro as $row): ?>
                              <option value="<?php echo $row['product_id']; ?>">
                                <?php echo $row['product_name'] . " (คงเหลือ: " . $row['quantity'] . ")"; ?>
                              </option>
                            <?php endforeach; ?>
                          </select>
                        </div>
                        <div class="col-sm-2">
                          <input type="number" name="products[0][request_quantity]" class="form-control" required placeholder="จำนวน" min="1">
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-4">
                      <button type="button" class="btn btn-success" id="add-product">เพิ่มรายการสินค้า</button>
                    </div>
                  </div>
                  
                  <div class="form-group row">
                    <label class="col-sm-2 col-form-label">ผู้ทำรายการ</label>
                    <div class="col-sm-4">
                      <select name="user_id" class="form-control" required>
                        <option value="" disabled>-- เลือกผู้ใช้ --</option>
                        <?php foreach($rsUsers as $row): ?>
                          <option value="<?php echo $row['user_id']; ?>">
                            <?php echo $row['username']; ?>
                          </option>
                        <?php endforeach; ?>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row">
                    <label class="col-sm-2 col-form-label">สถานะ</label>
                    <div class="col-sm-4">
                      <select name="status" class="form-control" required>
                        <option value="" disabled>-- เลือกสถานะ --</option> 
                        <option value="pending">เบิก</option>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-4">
                      <button type="submit" class="btn btn-primary">บันทึก</button>
                      <a href="reserve_list.php" class="btn btn-danger">ยกเลิก</a>
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

<!-- JavaScript สำหรับเพิ่มรายการสินค้า -->
<script>
let productCount = 1;

document.getElementById('add-product').addEventListener('click', function() {
    const container = document.getElementById('products-container');
    const newItem = document.createElement('div');
    newItem.className = 'product-item';
    newItem.innerHTML = `
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">ชื่อสินค้า</label>
            <div class="col-sm-4">
                <select name="products[${productCount}][product_id]" class="form-control" required>
                    <option value="">-- เลือกสินค้า --</option>
                    <?php foreach($rsPro as $row): ?>
                        <option value="<?php echo $row['product_id']; ?>">
                            <?php echo $row['product_name'] . " (คงเหลือ: " . $row['quantity'] . ")"; ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-sm-2">
                <input type="number" name="products[${productCount}][request_quantity]" class="form-control" required placeholder="จำนวน" min="1">
            </div>
        </div>
    `;
    container.appendChild(newItem);
    productCount++;
});
</script>

<?php
if (isset($_POST['products']) && isset($_POST['user_id']) && isset($_POST['status'])) {
  
  $user_id = $_POST['user_id'];
  $status = $_POST['status'];
  $created_at = date('Y-m-d H:i:s');
  $products = $_POST['products'];
  
  $hasError = false;

  // ตรวจสอบผู้ใช้ก่อน
  $stmtUserCheck = $condb->prepare("SELECT user_id FROM users WHERE user_id = :user_id");
  $stmtUserCheck->bindParam(':user_id', $user_id);
  $stmtUserCheck->execute();

  if ($stmtUserCheck->rowCount() == 0) {
    echo '<script>
           setTimeout(function() {
            swal({
                title: "ไม่พบข้อมูลผู้ใช้",
                text: "กรุณาเลือกผู้ใช้ใหม่",
                type: "error"
            }, function() {
                window.location = "index.php";
            });
          }, 1000);
      </script>';
  } else {
    foreach ($products as $index => $product) {
      $product_id = $product['product_id'];
      $request_quantity = intval($product['request_quantity']);

      // ตรวจสอบจำนวนสินค้าคงเหลือ
      $stmtCheck = $condb->prepare("SELECT quantity FROM products WHERE product_id = :product_id");
      $stmtCheck->bindParam(':product_id', $product_id);
      $stmtCheck->execute();
      $productData = $stmtCheck->fetch(PDO::FETCH_ASSOC);

      if ($stmtCheck->rowCount() == 0) {
        echo '<script>
               setTimeout(function() {
                swal({
                    title: "ไม่พบสินค้า",
                    text: "กรุณาเลือกสินค้าใหม่",
                    type: "error"
                });
              }, 1000);
          </script>';
        $hasError = true;
        continue;
      }

      // ตรวจสอบจำนวนสินค้าคงเหลือก่อนบันทึก
      if ($request_quantity > $productData['quantity']) {
        echo '<script>
               setTimeout(function() {
                swal({
                    title: "จำนวนสินค้าไม่เพียงพอ",
                    text: "ขอเบิก: ' . $request_quantity . ' ชิ้น, คงเหลือ: ' . $productData['quantity'] . ' ชิ้น",
                    type: "warning"
                });
              }, 1000);
          </script>';
        $hasError = true;
        continue;
      }

      // บันทึกข้อมูลการเบิก-ยืม
      $stmtInsert = $condb->prepare("INSERT INTO reservations 
        (product_id, user_id, quantity, status, created_at)
        VALUES 
        (:product_id, :user_id, :quantity, :status, :created_at)");

      $stmtInsert->bindParam(':product_id', $product_id);
      $stmtInsert->bindParam(':user_id', $user_id);
      $stmtInsert->bindParam(':quantity', $request_quantity, PDO::PARAM_INT);
      $stmtInsert->bindParam(':status', $status);
      $stmtInsert->bindParam(':created_at', $created_at);
      
      $result = $stmtInsert->execute();

      if (!$result) {
        $hasError = true;
      }
    }

    if (!$hasError) {
      echo '<script>
           setTimeout(function() {
            swal({
                title: "บันทึกข้อมูลสำเร็จ",
                text: "รอการอนุมัติจากผู้ดูแลระบบ",
                type: "success"
            }, function() {
                window.location = "History.php";
            });
          }, 1000);
      </script>';
    } else {
      echo '<script>
           setTimeout(function() {
            swal({
                title: "เกิดข้อผิดพลาดบางรายการ",
                text: "บางรายการไม่สามารถบันทึกได้",
                type: "error"
            }, function() {
                window.location = "reserve_form.php";
            });
          }, 1000);
      </script>';
    }
  }
  
  $condb = null;
}
?>