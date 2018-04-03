<html>
<head>
  <meta charset="utf-8" />
  <title>ナベアツ課題</title>
</head>
<body>
  <h1>ナベアツ課題</h1>
  <?php
    $i = 1;
    while ($i <= 40) {
      echo $i;
      if ($i % 3 == 0 || strpos($i, '3') !== false) {
        echo "アホになる";
      }
      if ($i % 5 == 0) {
        echo "犬っぽくなる";
      }
      echo "<br>\n";

      $i++;
    }
  ?>
</body>
</html>
