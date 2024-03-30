<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editpost</title>
    <link rel="stylesheet" href="bootstrap-5.3.2-dist/css/bootstrap.min.css">
    <script src = "bootstrap-5.3.2-dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
    <div class="container">
        <h1 style ="text-align: center;" class = "mt-3">Webboard SPR</h1>
        <?php include "nav.php" ?>
        <div class="row mt-4">
            <div class="col-lg-3 col-md-2 col-sm-1"></div>
            <div class="col-lg-6 col-md-8 col-sm-10">
                    <?php
                        if(isset($_SESSION['add_edit'])){
                            if($_SESSION['add_edit'] == "success"){
                                echo "<div class = 'alert alert-success'>แก้ไขข้อมูลเรียบร้อยแล้ว</div>";
                            }
                        }
                        unset($_SESSION['add_edit']);
                        $sql= "SELECT user_id FROM post WHERE post.id=$_GET[id]";
                        $conn=new PDO("mysql:host=localhost;dbname=webboard;charset=utf8","root","");
                        foreach($conn->query($sql) as $row){
                            if(!isset($_SESSION['id']) || $_SESSION['user_id']!=$row['user_id'] ){
                                header("location:index.php");
                                die();
                            }
                        }
                    ?>
                <div class="card border-warning">
                    <div class="card-header bg-warning text-white">แก้ไขกระทู้</div>
                    <div class="card-body">
                        <form action="editpost_save.php" method = "post">
                        <div class="row">
                            <label class="col-lg-3 col-form-label">หมวดหมู่ :</label>
                            <div class="col-lg-9">
                                <select name="category" class = "form-select">
                                    <?php
                                        $conn = new PDO("mysql:host=localhost;dbname=webboard;charset=utf8","root","");
                                        $sql = "SELECT * FROM post INNER JOIN category ON(post.cat_id=category.id)
                                        WHERE post.id = $_GET[id]";
                                        foreach($conn->query($sql) as $row){
                                            echo "<option value = $row[id]>$row[name]</option>";
                                        }
                                    ?>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <label class = "col-lg-3 col-form-label" for = "topic">หัวข้อ :</label>
                            <div class="col-lg-9">
                                <?php
                                    foreach($conn->query($sql) as $row){
                                        echo "<input type='text' name = 'topic' id = 'topic' class = 'form-control' value = '$row[title]' required >";
                                    }
                                ?>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <label class = "col-lg-3 col-form-label" for="comm">เนื้อหา :</label>
                            <div class="clo-lg-9">
                                <?php
                                foreach($conn->query($sql) as $row){
                                    echo "<textarea name='comment' id = 'comm' rows='8' class = 'form-control' required>$row[content]</textarea>";
                                }
                                ?>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-lg-12 d-flex justify-content-center">
                                <button type = 'submit' class = 'btn btn-warning btn-sm text-white me-2'>
                                <i class = 'bi bi-caret-right-square'></i> บันทึกข้อความ</button>
                            </div>
                        </div>
                        <?php
                            echo "<input type='text' name='id' style='display:none' value=$_GET[id]>";
                        ?>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-2 col-sm-1"></div>
        </div>
    </div><br>
</body>
</html>