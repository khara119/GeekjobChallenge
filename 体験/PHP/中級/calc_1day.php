<?php
//ページが保持している様々な値を受け取って、各種変数に代入(初期値は空としてnull)
$pushed   = isset($_POST['pushed']) ? $_POST['pushed'] : null; 		//押されたボタンの値がそのまま入る
$operator = isset($_POST['operator']) ? $_POST['operator'] : null;	//計算記号が保持される
$num      = isset($_POST['num']) ? $_POST['num'] : null;		//一時的な値の保持用
$answer   = isset($_POST['answer']) ? $_POST['answer'] : null;  	//確定した値の保持用
$log      = isset($_POST['log']) ? $_POST['log'] : null;		//計算ログが保持される。ロジックには全く関係がない
$output   = null;//画面の入力フォームに表示するため変数

//数字か文字かで判別。is_numeric(変数名)は対象の変数の中身が数値かを判別する。
if(is_numeric($pushed) || $pushed == "."){//課題6　小数点を、14行目の処理における「次の桁」と考え適切な分岐をしよう
  $log  = "<br>pushed = " . $pushed . "<br>";

  //もし数字が続けて押されたら、その数字を次の桁にする
  $num .= $pushed;

  //計算記号が入力済みでないならば、$numに格納された数字をそのまま表示。そうでないなら計算記号とくっつけて表示
  if(empty($operator)){
    $output = $num;
  }else{
    $output = $answer.$operator.$num;
  }
}else{

  if($pushed == "C"){//課題4 変数への代入操作のみで可能です。
    $pushed = null;
    $operator = null;
    $num = null;
    $answer = null;
    $output = null;
  }else if(!empty($num)){//課題5「true」と記述されているところの条件を、適切な条件に変えよう。数字の入力チェックはどうやるのか全体を眺めて方法を発見しよう

    //次の条件分岐で$answerが上書きされてしまうのでその前にログに保存
    if($pushed == "＝"){
      $log .=  $answer;
    }

    //最初に計算記号が出現した『後』、何かしらの文字(=や×、税込みなど)が出現した瞬間に計算を実行。
    //「1+2-」や「1+2=」となった時点で「3-」や「3」といった結果にする。または「1+2税込み」でも3*1.08が実行される
    if($operator == "＋") {
      $answer = $answer + (float)$num;
    } else if ($operator == "－") {
      $answer -= (float)$num;
    }else if($operator == "×") {
      $answer = $answer * (float)$num;
    }else if($operator == "÷") {
      //0で割ることのないように判別
      if($num != 0) {
        $answer = $answer / (float)$num;
      } else {
        $answer = "error";
      }
    }else {
      //初めて計算記号が押された際はここに分岐。一時保存用のnumからanswerに値を移す
      $answer = (float)$num;
    }

    //記号計算の結果、もしくは素のままの数字に対し最終的なボタン処理を実行
    if($pushed == "＝"){
      $log .=  $operator . $num . "＝" . $answer . "<br>";
    }

    if($pushed == "税込み"){//課題1 税抜きの処理を参考にcalc_ansへどんな操作をするべきか考えよう
      $answer *= 1.08;
      $log .= "税込み" . $answer . "<br>";
    }

    if($pushed == "税抜き"){
      $answer = $answer / 1.08;
      $log .=  "税抜き" . $answer . "<br>";
    }

    //課題2 税込や税抜きの処理を参考に操作が「%」の時の分岐を考えよう
    if ($pushed == "％") {
      $log .= $answer;
      $answer /= 100.0;
      $log .= "% → " . $answer . "<br>";
    }

    //計算記号を押したかどうかの分岐。推している場合はここでoperatorに計算記号が格納される
    if($pushed == "＋" || $pushed == "－" || $pushed == "×" || $pushed == "÷" ){
      $operator 	=   $pushed;//押されたボタンの記号を保持。これによりもう一度計算記号が出現したときに計算が実行できる
      $output 	=   $answer.$pushed;
      $num 	=   null;
    }else{//計算記号じゃない文字(＝や税込み)が押されたときはこっち
      $operator   =   null;
      $output     =   $answer;
      $num        =   null;
    }

  }else {
    //数値の事前入力なしに文字などを押した際はここに分岐
    $output =   $answer.$operator.$num;
    $log = $log ."数値を入力してください<br>";
  }
}
?>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css"><!-- button{width:50px;} --></style>
<title>WEB電卓</title>
</head>
<body>
<h3>電卓</h3>
計算画面<br><br>
<?php echo $output; ?><br><br>
<form action="" method="post" id="calc">
<table>
<tr class="row">
<td><button type="submit" name="pushed" value="税込み" form="calc">税込</button></td>
<td><button type="submit" name="pushed" value="税抜き" form="calc">税抜</button></td>
<td><button type="submit" name="pushed" value="％" form="calc">％</button></td>
<td><button type="submit" name="pushed" value="C" form="calc">C</button></td>
</tr>
<tr class="row">
<td class="btops"><button class="command-bt" type="submit" name="pushed" value="1" form="calc">1</button></td>
<td class="btops"><button class="command-bt" type="submit" name="pushed" value="2" form="calc">2</button></td>
<td class="btops"><button class="command-bt" type="submit" name="pushed" value="3" form="calc">3</button></td>
<td class="btops"><button class="command-bt" type="submit" name="pushed" value="＋" form="calc">＋</button></td>
</tr>
<tr class="row">
<td><button type="submit" name="pushed" value="4" form="calc">4</button></td>
<td><button type="submit" name="pushed" value="5" form="calc">5</button></td>
<td><button type="submit" name="pushed" value="6" form="calc">6</button></td>
<td><button type="submit" name="pushed" value="－" form="calc">－</button></td>
</tr>
<tr class="row">
<td><button type="submit" name="pushed" value="7" form="calc">7</button></td>
<td><button type="submit" name="pushed" value="8" form="calc">8</button></td>
<td><button type="submit" name="pushed" value="9" form="calc">9</button></td>
<td><button type="submit" name="pushed" value="×" form="calc">×</button></td>
</tr>
<tr class="row">
<td><button type="submit" name="pushed" value="0" form="calc">0</button></td>
<td><button type="submit" name="pushed" value="00" form="calc">00</button></td>
<td><button type="submit" name="pushed" value="＝" form="calc">＝</button></td>
<td><button type="submit" name="pushed" value="÷" form="calc">÷</button></td>
<td><button type="submit" name="pushed" value="." form="calc">.</button></td>
</tr>
</table>
<input type="hidden" name="num" value="<?php echo $num; ?>">
<input  type="hidden" name="operator" value="<?php echo $operator; ?>">
<input  type="hidden" name="answer" value="<?php echo $answer; ?>">
<input  type="hidden" name="log" value="<?php echo $log; ?>">
</form>
<p>計算ログ:</p><br>
<p><?php echo $log; ?></p>
</body>
</html>
