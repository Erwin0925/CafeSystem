/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

/**
 *
 * @author Erwin_Yoga
 */
@Entity
@NamedQueries({
    @NamedQuery(name = "customer.details",query = "SELECT u FROM Customers u WHERE u.username = :username"),
    @NamedQuery(name = "Customer.countTotal", query = "SELECT COUNT(c) FROM Customers c"),
    @NamedQuery(name = "Customer.countByGender", query = "SELECT c.gender, COUNT(c) FROM Customers c GROUP BY c.gender"),
    @NamedQuery(name = "Customer.countByAddress", query = "SELECT c.address, COUNT(c) FROM Customers c GROUP BY c.address"),    
})
public class Customers implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String username;
    private String email;
    private String hp;
    private String address;
    private String gender;

    public Customers() {
    }

    public Customers(String username, String email, String hp, String address) {
        this.username = username;
        this.email = email;
        this.hp = hp;
        this.address = address;
    }

    public Customers(String username, String email, String hp, String address, String gender) {
        this.username = username;
        this.email = email;
        this.hp = hp;
        this.address = address;
        this.gender = gender;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
    

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHp() {
        return hp;
    }

    public void setHp(String hp) {
        this.hp = hp;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Customers)) {
            return false;
        }
        Customers other = (Customers) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Customers[ id=" + id + " ]";
    }
    
}
