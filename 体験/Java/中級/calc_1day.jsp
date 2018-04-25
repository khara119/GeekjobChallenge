<%@ page pageEncoding="UTF-8" %>
<%
//ページが保持している様々な値を受け取って、各種変数に代入
request.setCharacterEncoding("UTF-8");
String pushed   = (request.getParameter("pushed")==null)? "":request.getParameter("pushed"); 	//押されたボタンの値がそのまま入る
String operator = (request.getParameter("operator")==null)? "":request.getParameter("operator");//計算記号が保持される
String num      = (request.getParameter("num")==null)? "":request.getParameter("num");		//一時的な値の保持用
String answer   = (request.getParameter("answer")==null)? "0":request.getParameter("answer");   	//確定した値の保持用
String log      = (request.getParameter("log")==null)? "":request.getParameter("log");	//計算ログが保持される。ロジックには全く関係がない
String output   = "0";//画面に表示するための変数
java.util.regex.Pattern sujipattern = java.util.regex.Pattern.compile("^[0-9]*$");//数字判別用のパターン素材

//数字か文字かで判別。『使用するパターン.matcher(ここに変数).matches()』は対象の変数の中身が数値かを判別する。
if(sujipattern.matcher(pushed).matches() || pushed.equals(".")){//課題6　小数点を、17行目の処理における「次の桁」と考え適切な分岐をしよう

    // 小数点が最初に押されたら頭に0をつける
    if (num.equals("") && pushed.equals(".")) {
        num = "0";
    }

    //もし数字が続けて押されたら、その数字を次の桁にする
    num = num + pushed;

    //計算記号が入力済みでないならば、numに格納された数字をそのまま表示。そうでないなら計算記号とくっつけて表示
    if(operator.equals("")){
        output = num;
    }else{
        output = answer+operator+num;
    }
}else{
    if(pushed.equals("C")){
        //課題4 変数への代入操作のみで可能です。
        num = "";
        operator = "";
        answer = "0";
        output = "0";
        
    }else if(!num.equals("")){//課題5「true」と記述されているところの条件を、適切な条件に変えよう。

        //最初に計算記号が入力された『後』、何かしらの文字(=や×、税込みなど)が入力された瞬間に計算を実行。
        //「1+2-」や「1+2=」となった時点で「3-」や「3」といった結果にする。または「1+2税込み」でも3*1.08が実行される
        //計算記号が初めて入力された際には、52行目の処理にだけ分岐しする。
        Double calc_ans=Double.valueOf(answer);//計算用の型に変換
        Double calc_num=Double.valueOf(num);//計算用の型に変換
        if(operator.equals("＋")) {
            calc_ans = calc_ans + calc_num;
        } else if (operator.equals("－")) {
            calc_ans = calc_ans - calc_num;
        }else if(operator.equals("×")) {
            calc_ans = calc_ans * calc_num;
        } else if(operator.equals("÷")) {
            //0で割ることのないように判別
            if(calc_num != 0) {
                calc_ans = calc_ans / calc_num;
            } else {
                answer = "error";
            }
        }else {
            //初めて計算記号が押された際はここに分岐。一時保存用のnumからanswerに値を移す
            calc_ans = calc_num;
        }
        
        //記号計算の結果、もしくは素のままの数字に対し最終的なボタン処理を実行
        if(pushed.equals("＝")){
            log = log + answer + operator + num + "＝" + calc_ans + "<br>";
        }
        if(pushed.equals("税込み")){
            //課題1 税抜きの処理を参考にcalc_ansへどんな操作をするべきか考えよう
            calc_ans = calc_ans * 1.08;
            log += "税抜き" + calc_ans + "<br>";
        }
        if(pushed.equals("税抜き")){
            calc_ans = calc_ans / 1.08;
            log = log + "税抜き" + calc_ans + "<br>";
        }
        //課題2　税込や税抜きの処理を参考に操作が「%」の時の分岐を考えよう
        if(pushed.equals("%")) {
            log += calc_ans + "% → ";
            calc_ans = calc_ans / 100.0;
            log += calc_ans + "<br>";
        }
        
        
        
        answer = Double.toString(calc_ans);//計算用の値から画面表示用の型に変換。
        
        //計算記号を押したかどうかの分岐。推している場合はここでoperatorに計算記号が格納される
        if(pushed.equals("＋") || pushed.equals("－") || pushed.equals("×") || pushed.equals("÷")){
            operator 	=   pushed;//押されたボタンの記号を保持。これによりもう一度計算記号が出現したときに計算が実行できる
            output 	=   answer+pushed;
            num 	=   "";
        }else{//計算記号じゃない文字(＝や税込み)が押されたときはこっち
            operator   =   "";
            output     =   answer;
            num        =   "";
        }
    }else {
        //数値の事前入力なしに文字などを押した際はここに分岐
        output 	=   answer+operator+num;
        log = log+"数値を入力してください<br>";
    }
}

%>



<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!-- <link rel="stylesheet" type="text/css" href="style.css" media="all">-->
    <style type="text/css"><!-- button{width:50px;} --></style>
    <title>WEB電卓</title>
  </head>
  <body>
    <h3>電卓</h3>
    <form action="" method="post" id="calc">
        <% out.print(output); %>
      <table>
        <tr class="row">
          <td><button type="submit" name="pushed" value="税込み" form="calc">税込</button></td>
          <td><button type="submit" name="pushed" value="税抜き" form="calc">税抜</button></td>
          <td><button type="submit" name="pushed" value="%" form="calc">%</button></td>
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
      <input  type="hidden" name="num" value="<%out.print(num);%>">
      <input  type="hidden" name="operator" value="<%out.print(operator);%>">
      <input  type="hidden" name="answer" value="<%out.print(answer);%>">
      <input  type="hidden" name="log" value="<%out.print(log);%>">
    </form>
    <p>計算ログ:</p><br>
    <p><%out.print(log);%></p>
  </body>
</html>
