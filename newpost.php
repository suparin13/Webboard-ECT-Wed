<?php
session_start();
if(!isset($_SESSION['id'])){
    header("location:index.php");
    die();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Webboard SPR</title>
</head>
<body>
    <h1 style="text-align: center;">Webboard SPR</h1>
    <hr>
    ผู้ใช้ : <?php echo $_SESSION['username'];?>
    <form>
        <table>
            <tr><td>หมวดหมู่ :</td>
            <td>
            <select>
                <option value="general">เรื่องทั่วไป</option>
                <option value="study">เรื่องเรียน</option>
            </select><br>
        </td></tr> 
        <tr><td>หัวข้อ:</td><td><input type="text"></td></tr>
        <tr><td>เนื้อหา:</td><td><textarea rows="2" cols = "25"></textarea></td></tr>
        <tr><td></td><td><input type="submit" value="บันทึกข้อความ"></td></tr>
        </table>
    </form>
</body>
</html>