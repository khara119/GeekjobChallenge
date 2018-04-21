/*
 *  Copyright © 2018 University of Aizu
 */
package org.camp.stockmanagement;

import java.sql.Date;

/**
 *
 * @author Kohei Hara
 */
public class Item {
    private int id;
    private String name;
    private int stock;
    private Date lastUpdated;
    private String lastUpdatedBy;
    
    public Item(int id, String name, int stock, Date lastUpdated, String lastUpdatedBy) {
        this.id = id;
        this.name = name;
        this.stock = stock;
        this.lastUpdated = lastUpdated;
        this.lastUpdatedBy = lastUpdatedBy;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Date getLastUpdated() {
        return lastUpdated;
    }

    public String getLastUpdatedBy() {
        return lastUpdatedBy;
    }

    public int getStock() {
        return stock;
    }
    
    
}
