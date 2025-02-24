<?php


session_start();
// print_r($_SESSION);

if(empty($_SESSION['m_level']) && empty($_SESSION['staff_id'])){
  header('Location: ../logout.php');
}

// ถ้าไม่ใช่ admin ให้กลับไปหน้า login
if ($_SESSION['m_level'] != 'staff') {
  header('Location: ../logout.php');
}

include 'header.php';
include 'navbar.php';
include 'sidebar_menu.php';
include 'footer.php';

// ถ้าไม่มีการ login ให้กลับไปหน้า login

?>
<!-- Preloader
<div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="assets/dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
</div> -->
