<?php require_once '../common/defineUtil.php'; ?>
<?php require_once '../common/scriptUtil.php'; ?>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
      <title>登録画面</title>
</head>
<body>
    <?php
        session_start();

        // 登録確認画面から戻ってきたらその値を引き継ぐ
        if (isset($_POST['confirm']) && $_POST['confirm'] == 'return') {
            $keys = array(
                'name',
                'year',
                'month',
                'day',
                'type',
                'tell',
                'comment'
            );

            // 前回の入力を引き継ぎ
            foreach ($keys as $key) {
                ${$key} = isset($_POST[$key]) ? $_POST[$key] : NULL;
            }

            // 種別はデフォルト0にするので最後にまた判定
            if (is_null($type)) {
                $type = 0;
            }
        } else {
            // 普通に登録画面を開いたら保持された値を設定
            $name = array_key_exists('name', $_SESSION) ? $_SESSION['name'] : NULL;
            $type = array_key_exists('type', $_SESSION) ? $_SESSION['type'] : 0;
            $birthday = array_key_exists('birthday', $_SESSION) ? $_SESSION['birthday'] : NULL;
            $tell = array_key_exists('tell', $_SESSION) ? $_SESSION['tell'] : NULL;
            $comment = array_key_exists('comment', $_SESSION) ? $_SESSION['comment'] : NULL;

            // 念の為初期化
            $year = NULL;
            $month = NULL;
            $day = NULL;

            // 誕生日が保存されていた場合は年月日それぞれの変数に保存
            if (!is_null($birthday)) {
                $birthday_tmp = explode("-", $birthday);

                // 数値変換可能か判定し、可能なら数値変換した値を、不可能ならNULLを入れる
                // （intval()は変換不可能な場合0や1を入れてしまうため）
                $year = is_numeric($birthday_tmp[0]) ? intval($birthday_tmp[0]) : NULL;
                $month = is_numeric($birthday_tmp[1]) ? intval($birthday_tmp[1]) : NULL;
                $day = is_numeric($birthday_tmp[2]) ? intval($birthday_tmp[2]) : NULL;
            }
        }
    ?>
    <form action="<?php echo INSERT_CONFIRM ?>" method="POST">
    名前:
    <input type="text" name="name" value="<?php echo is_null($name) ? '' : $name ?>">
    <br><br>
    
    生年月日:　
    <select name="year">
        <option value="----" <?php if(is_null($year)) echo 'selected'; ?>>----</option>
        <?php for($i=1950; $i<=2010; $i++){ ?>
            <option value="<?php echo $i;?>" <?php if($year == $i) echo 'selected'; ?>><?php echo $i ;?> </option>
        <?php } ?>
    </select>年
    <select name="month">
        <option value="--" <?php if(is_null($month)) echo 'selected'; ?>>--</option>
        <?php for($i = 1; $i<=12; $i++){?>
            <option value="<?php echo $i;?>" <?php if($month == $i) echo 'selected'; ?>><?php echo $i;?></option>
        <?php } ;?>
    </select>月
    <select name="day">
        <option value="--" <?php if(is_null($day)) echo 'selected'; ?>>--</option>
        <?php for($i = 1; $i<=31; $i++){ ?>
            <option value="<?php echo $i; ?>" <?php if($day == $i) echo 'selected'; ?>><?php echo $i;?></option>
        <?php } ?>
    </select>日
    <br><br>

    種別:
    <br>
    <input type="radio" name="type" value="0" <?php if($type == 0) { ?> checked <?php } ?>>
        エンジニア<br>
    <input type="radio" name="type" value="1" <?php if($type == 1) { ?> checked <?php } ?>>営業<br>
    <input type="radio" name="type" value="2" <?php if($type == 2) { ?> checked <?php } ?>>その他<br>
    <br>
    
    電話番号:
    <input type="text" name="tell" value="<?php if (!is_null($tell)) { echo $tell; } ?>">
    <br><br>

    自己紹介文
    <br>
    <textarea name="comment" rows=10 cols=50 style="resize:none" wrap="hard"><?php echo is_null($comment) ? '' : $comment ?></textarea><br><br>
    
    <input type="submit" name="btnSubmit" value="確認画面へ">
    </form>

    <?php echo return_top(); ?>

</body>
</html>
