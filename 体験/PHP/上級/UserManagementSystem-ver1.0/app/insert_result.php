<?php require_once '../common/scriptUtil.php'; ?>
<?php require_once '../common/dbaccesUtil.php'; ?>

<!DOCTYPE html>
<html lang="ja">

<head>
<meta charset="UTF-8">
      <title>登録結果画面</title>
</head>
<body>

    <?php if (!isset($_POST['confirm']) || $_POST['confirm'] != 'pass') { ?>
        <h1>このページへの直接リンクは許可されていません</h1>
        <?php echo return_top(); ?>
    <?php } else {?>

    <?php
    session_start();

    $data = array(
        "name" => $_SESSION['name'],
        "birthday" => $_SESSION['birthday'],
        "type" => $_SESSION['type'],
        "tell" => $_SESSION['tell'],
        "comment" => $_SESSION['comment']
    );

    // DBにレコードを登録
    $result = insertRecord2MySQL($data);

    if ($result != '') { ?>
        <h1>データの登録に失敗しました</h1>
        <p><?php echo $result; ?></p>
        <?php echo return_top();
    } else { ?>

    <h1>登録結果画面</h1><br>
    名前:<?php echo $data['name'];?><br>
    生年月日:<?php echo $data['birthday'];?><br>
    種別:<?php echo TYPE[$data['type']]?><br>
    電話番号:<?php echo $data['tell'];?><br>
    自己紹介:<?php echo $data['comment'];?><br>
    以上の内容で登録しました。<br>

    <?php echo return_top(); 
    }}
    ?>
    
</body>

</html>
