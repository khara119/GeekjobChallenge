/*
 *  Copyright © 2018 University of Aizu
 */
package org.camp.servlet;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author Kohei Hara
 */
public class ResultData implements Serializable {
    private Date date;
    private String luck;
    
    public ResultData() {
    }
    
    public Date getDate() {
        return date;
    }
    
    public void setDate(Date date) {
        this.date = date;
    }
    
    public String getLuck() {
        return luck;
    }
    
    public void setLuck(String luck) {
        this.luck = luck;
    }
    
}
