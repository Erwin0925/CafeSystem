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
    @NamedQuery(name = "Stall.findAllNames", query = "SELECT s.stallname FROM Stalls s WHERE s.status = 'approved'"),
    @NamedQuery(name = "Stall.findAllNames2", query = "SELECT s FROM Stalls s "),
    @NamedQuery(name = "Stall.findNames3", query = "SELECT s FROM Stalls s WHERE s.stallname = :stallname"),
    @NamedQuery(name = "Stall.findAllNames4", query = "SELECT s.stallname FROM Stalls s "),
    @NamedQuery(name = "Stalls.countTotal", query = "SELECT COUNT(s) FROM Stalls s"),
    @NamedQuery(name = "Stalls.countByCategory", query = "SELECT s.category, COUNT(s) FROM Stalls s GROUP BY s.category"),    
    
})

public class Stalls implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String stallname;
    private String category ;
    private String status;
    @OneToMany
    private ArrayList<Stallstaffs> Stallstaffs = new ArrayList<Stallstaffs>();
    @OneToMany
    private ArrayList<Menus> Menus = new ArrayList<Menus>();
    
    public Stalls(String stallname, String category, String status) {
        this.stallname = stallname;
        this.category = category;
        this.status = status;
    }

    public ArrayList<Menus> getMenus() {
        return Menus;
    }

    public void setMenus(ArrayList<Menus> Menus) {
        this.Menus = Menus;
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
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
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
