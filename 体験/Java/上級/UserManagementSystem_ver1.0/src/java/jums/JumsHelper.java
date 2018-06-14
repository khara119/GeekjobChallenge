package jums;

/**
 * 画面系の処理や表示を簡略化するためのヘルパークラスです。定数なども保存されます
 * @author hayashi-s
 */
public class JumsHelper {
    
    //トップへのリンクを定数として設定
    private final String homeURL = "index.jsp";
    
    public static JumsHelper getInstance(){
        return new JumsHelper();
    }
    
    public String convertTypeNumToString(int type) {
        switch(type) {
            case 1:
                return "エンジニア";
            case 2:
                return "営業";
            case 3:
                return "その他";
        }
        
        return "未選択";
    }
    
    public int convertInteger(String str) {
        try {
            return Integer.parseInt(str);
        } catch(NumberFormatException e) {
            return -1;
        }
    }
    
    //トップへのリンクを返却
    public String home(){
        return "<a href=\""+homeURL+"\">トップへ戻る</a>";
    }
}
