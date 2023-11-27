/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.ArrayList;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

/**
 *
 * @author Erwin_Yoga
 */
@Entity
@NamedQueries({
    @NamedQuery(name = "Stall.findAllNames", query = "SELECT s.stallname FROM Stalls s"),
})

public class Stalls implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String stallname;
    private String Category ;
    private String status;
    @OneToMany
    private ArrayList<Stallstaffs> Stallstaffs = new ArrayList<Stallstaffs>();

    public Stalls(String stallname, String Category, String status) {
        this.stallname = stallname;
        this.Category = Category;
        this.status = status;
    }

    public Stalls(String stallname) {
        this.stallname = stallname;
    }

    public String getStallname() {
        return stallname;
    }

    public void setStallname(String stallname) {
        this.stallname = stallname;
    }

    public String getCategory() {
        return Category;
    }

    public void setCategory(String Category) {
        this.Category = Category;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public ArrayList<Stallstaffs> getStallstaffs() {
        return Stallstaffs;
    }

    public void setStallstaffs(ArrayList<Stallstaffs> Stallstaffs) {
        this.Stallstaffs = Stallstaffs;
    }

    public Stalls() {
    }

    public String getId() {
        return stallname;
    }

    public void setId(String stallname) {
        this.stallname = stallname;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (stallname != null ? stallname.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the stallname fields are not set
        if (!(object instanceof Stalls)) {
            return false;
        }
        Stalls other = (Stalls) object;
        if ((this.stallname == null && other.stallname != null) || (this.stallname != null && !this.stallname.equals(other.stallname))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Stalls[ stallname=" + stallname + " ]";
    }
    
}
