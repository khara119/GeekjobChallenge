<html>
<head>
  <meta charset="utf-8" />
  <title>ナベアツ課題</title>
</head>
<body>
  <h1>ナベアツ課題</h1>
  <?php
    $i = 1;
    while ($i <= 20) {
      echo $i;
      if ($i % 3 == 0) {
        echo "アホになる";
      }
      echo "<br>\n";

      $i++;
    }
  ?>
</body>
</html>
