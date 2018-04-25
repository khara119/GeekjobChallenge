/*
 *  Copyright © 2018 University of Aizu
 */
package jums;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Kohei Hara
 */
public class UserDataBeans {
    private String name;
    private int year;
    private int month;
    private int date;
    private int type;
    private String tel;
    private String comment;
    
    public UserDataBeans() {
        name = "";
        year = 0;
        month = 0;
        date = 0;
        type = 1;
        tel = "";
        comment = "";
    }
    
    public static UserDataBeans getInstance() {
        return new UserDataBeans();
    }
    
    public ArrayList<String> getIncorrectFormMessages() {
        ArrayList<String> messages = new ArrayList<String>();
        if (name.equals("")) {
            messages.add("名前が入力されていません。");
        }
        
        if (year < 1950 || year > 2010 || month < 1 || month > 12 || date < 1 || date > 31) {
            messages.add("誕生日に正しくない値が使われています。");
        }
        
        if (tel.equals("")) {
            messages.add("電話番号が入力されていません。");
        }
        
        if (comment.equals("")) {
            messages.add("コメントが入力されていません。");
        }
        
        return messages;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
    
    public String getTypeString() {        
        switch(type) {
            case 1:
                return "エンジニア";
            case 2:
                return "営業";
            default:
                return "その他";
        }
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getDate() {
        return date;
    }

    public void setDate(int date) {
        this.date = date;
    }
    
}
