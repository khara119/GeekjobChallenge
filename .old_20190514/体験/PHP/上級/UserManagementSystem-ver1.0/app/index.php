<?php require_once '../common/defineUtil.php'; ?>
<!-- topへリンク貼る場合はコメントアウトを外す -->
<?php /*require_once '../common/scriptUtil.php';*/ ?>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
    <title>ユーザー情報管理トップ</title>
</head>
<body>
    <h1>ユーザー情報管理トップ画面</h1><br>
    <h3>ここでは、ユーザー情報管理システムとしてユーザー情報の登録や検索、
        付随して修正や削除を行うことができます</h3><br>
    <a href="<?php echo INSERT; ?>">新規登録</a><br>
    <a href="<?php echo SEARCH; ?>" >検索(修正・削除)</a><br>

    <!-- 他のページと合わせるならここにtopへのリンクも貼るが、
    	このページ自体がtopなので、他と合わせたい場合は好みで設置 -->
    <?php /*echo return_top();*/ ?>

</body>
</html>
