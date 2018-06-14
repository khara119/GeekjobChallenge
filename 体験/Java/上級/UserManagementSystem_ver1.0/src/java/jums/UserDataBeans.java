/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jums;

import java.util.ArrayList;

/**
 *
 * @author hara
 */
public class UserDataBeans {
    private String name;
    private int year;
    private int month;
    private int date;
    private int type;
    private String tel;
    private String comment;

    public UserDataBeans(String name, String year, String month, String date, String type, String tel, String comment) {
        JumsHelper helper = JumsHelper.getInstance();
        this.name = name;
        this.year = helper.convertInteger(year);
        this.month = helper.convertInteger(month);
        this.date = helper.convertInteger(date);
        this.type = helper.convertInteger(type);
        this.tel = tel;
        this.comment = comment;
        
        System.out.println(this);
    }
    
    public boolean isAcceptInput() {
        return (this.name != null || this.name.isEmpty()) && (year >= 1950 && year <= 2010) && (month >= 1 && month <= 12) &&
                (date >= 1 && date <= 31) && (type >= 1 && type <= 3) && (tel != null || this.tel.isEmpty()) && (comment != null || comment.isEmpty());
    }
    
    public ArrayList<String> getInvalidInputList() {
        ArrayList<String> forms = new ArrayList<>();
        if (name == null || name.isEmpty()) {
            forms.add("名前");
        }
        
        if (year < 1950 || year > 2010) {
            forms.add("年");
        }
        
        if (month < 1 || month > 12) {
            forms.add("月");
        }
        
        if (date < 1 || date > 31) {
            forms.add("日");
        }
        
        if (type < 1 || type > 3) {
            forms.add("種別");
        }
        
        if (tel == null || tel.isEmpty()) {
            forms.add("電話番号");
        }
        
        if (comment == null || comment.isEmpty()) {
            forms.add("自己紹介");
        }
        
        return forms;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name != null ? name : "";
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the year
     */
    public int getYear() {
        return year;
    }

    /**
     * @param year the year to set
     */
    public void setYear(String year) {
        this.year = Integer.parseInt(year);
    }

    /**
     * @return the month
     */
    public int getMonth() {
        return month;
    }

    /**
     * @param month the month to set
     */
    public void setMonth(String month) {
        this.month = Integer.parseInt(month);
    }

    /**
     * @return the date
     */
    public int getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(String date) {
        this.date = Integer.parseInt(date);
    }

    /**
     * @return the type
     */
    public int getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = Integer.parseInt(type);
    }

    /**
     * @return the tel
     */
    public String getTel() {
        return tel != null ? tel : "";
    }

    /**
     * @param tel the tel to set
     */
    public void setTel(String tel) {
        this.tel = tel;
    }

    /**
     * @return the comment
     */
    public String getComment() {
        return comment != null ? comment : "";
    }

    /**
     * @param comment the comment to set
     */
    public void setComment(String comment) {
        this.comment = comment;
    }
    
    public String toString() {
        return "Name: " + name + "\n" +
            "Year: " + year + "\n" +
            "Month: " + month + "\n" +
            "Date: " + date + "\n" +
            "Type: " + type + "\n" +
            "Tel: " + tel + "\n" +
            "Comment: " + comment + "\n";
    }
}
