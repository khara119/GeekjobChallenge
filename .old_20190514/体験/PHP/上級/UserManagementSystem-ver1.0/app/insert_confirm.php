<?php require_once '../common/defineUtil.php'; ?>
<?php require_once '../common/scriptUtil.php'; ?>
<!DOCTYPE html>
<html lang="ja">

<head>
<meta charset="UTF-8">
      <title>登録確認画面</title>
</head>
<body>
    <?php

        // 未入力チェックのため入力項目名の配列を用意
        $form_names = [
            'name' => '名前',
            'year' => '年',
            'month' => '月',
            'day' => '日',
            'type' => '種別',
            'tell' => '電話番号',
            'comment' => '自己紹介文'
        ];

        // 未入力エラー格納用変数
        $error = array();

        foreach($form_names as $key => $item) {
            // 入力項目が空の場合はエラーとして追加
            if (!isset($_POST[$key]) || $_POST[$key] == "") {
                $error[] = $item . 'が入力されていません。';
            } else if ($key == 'year' && $_POST[$key] == '----' ){
                // 誕生日の年の入力が未入力扱いの文字ならエラーとして追加
                $error[] = $item . 'が入力されていません。';
            } else if ($key == 'month' && $_POST[$key] == '--') {
                // 誕生日の月の入力が未入力扱いの文字ならエラーとして追加
                $error[] = $item . 'が入力されていません。';
            } else if ($key == 'day' && $_POST[$key] == '--') {
                // 誕生日の日の入力が未入力扱いの文字ならエラーとして追加
                $error[] = $item . 'が入力されていません。';
            }
        }

        // エラーがなければ登録確認画面を表示し、
        // エラーがあれば未入力項目を表示する
        if(empty($error)){
            
            $post_name = $_POST['name'];
            //date型にするために1桁の月日を2桁にフォーマットしてから格納
            $post_birthday = $_POST['year'].'-'.sprintf('%02d',$_POST['month']).'-'.sprintf('%02d',$_POST['day']);
            $post_type = $_POST['type'];
            $post_tell = $_POST['tell'];
            $post_comment = $_POST['comment'];

            // セッション情報に格納
            session_start();
            $_SESSION['name'] = $post_name;
            $_SESSION['birthday'] = $post_birthday;
            $_SESSION['type'] = $post_type;
            $_SESSION['tell'] = $post_tell;
            $_SESSION['comment'] = $post_comment;
    ?>

    <h1>登録確認画面</h1><br>
    名前:<?php echo $post_name;?><br>
    生年月日:<?php echo $post_birthday;?><br>
    種別:<?php echo TYPE[$post_type]?><br>
    電話番号:<?php echo $post_tell;?><br>
    自己紹介:<?php echo $post_comment;?><br>

    上記の内容で登録します。よろしいですか？

    <form action="<?php echo INSERT_RESULT ?>" method="POST">
        <input type="hidden" name="confirm" value="pass">
      <input type="submit" name="yes" value="はい">
    </form>
    <form action="<?php echo INSERT ?>" method="POST">
        <input type="hidden" name="confirm" value="return">
        <input type="hidden" name="name" value="<?php echo $_POST['name'] ?>">
        <input type="hidden" name="year" value="<?php echo $_POST['year'] ?>">
        <input type="hidden" name="month" value="<?php echo $_POST['month'] ?>">
        <input type="hidden" name="day" value="<?php echo $_POST['day'] ?>">
        <input type="hidden" name="type" value="<?php echo $_POST['type'] ?>">
        <input type="hidden" name="tell" value="<?php echo $_POST['tell'] ?>">
        <input type="hidden" name="comment" value="<?php echo $_POST['comment'] ?>">
        <input type="submit" name="no" value="登録画面に戻る">
    </form>
        
    <?php }else{ ?>
    <h1>入力項目が不完全です</h1><br>
    <ul>
    <?php foreach($error as $e) {
        echo '<li>' . $e . '</li>';
    } ?>
    </ul>

    <br>
    再度入力を行ってください
    <form action="<?php echo INSERT ?>" method="POST">
        <input type="hidden" name="confirm" value="return">
        <input type="hidden" name="name" value="<?php echo $_POST['name'] ?>">
        <input type="hidden" name="year" value="<?php echo $_POST['year'] ?>">
        <input type="hidden" name="month" value="<?php echo $_POST['month'] ?>">
        <input type="hidden" name="day" value="<?php echo $_POST['day'] ?>">
        <input type="hidden" name="type" value="<?php echo $_POST['type'] ?>">
        <input type="hidden" name="tell" value="<?php echo $_POST['tell'] ?>">
        <input type="hidden" name="comment" value="<?php echo $_POST['comment'] ?>">
        <input type="submit" name="no" value="登録画面に戻る">
    </form>
    <?php } ?>

    <?php echo return_top(); ?>

</body>
</html>
