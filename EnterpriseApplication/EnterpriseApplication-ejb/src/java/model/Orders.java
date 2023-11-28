/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
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
    @NamedQuery(name = "Orders.findByUsernameAndStatusNew", query = "SELECT o FROM Orders o WHERE o.username = :username AND o.status2 = 'new'"),
})
public class Orders implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private LocalDate mydate;
    private int rating; 
    private String Feedback;
    private String username;
    private double totalprice;
    private String status;
    private String status2;
    private String stallstaffusername;
    @OneToMany
    private ArrayList<OrderDetails> OrderDetails = new ArrayList<OrderDetails>();

    public Orders() {
    }

    public Orders(LocalDate mydate, int rating, String Feedback, String username, double totalprice, String status, String status2, String stallstaffusername) {
        this.mydate = mydate;
        this.rating = rating;
        this.Feedback = Feedback;
        this.username = username;
        this.totalprice = totalprice;
        this.status = status;
        this.status2 = status2;
        this.stallstaffusername = stallstaffusername;
    }

    public String getStatus2() {
        return status2;
    }

    public void setStatus2(String status2) {
        this.status2 = status2;
    }

    public String getStallstaffusername() {
        return stallstaffusername;
    }

    public void setStallstaffusername(String stallstaffusername) {
        this.stallstaffusername = stallstaffusername;
    }

    public LocalDate getMydate() {
        return mydate;
    }

    public void setMydate(LocalDate mydate) {
        this.mydate = mydate;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getFeedback() {
        return Feedback;
    }

    public void setFeedback(String Feedback) {
        this.Feedback = Feedback;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(double totalprice) {
        this.totalprice = totalprice;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public ArrayList<OrderDetails> getOrderDetails() {
        return OrderDetails;
    }

    public void setOrderDetails(ArrayList<OrderDetails> OrderDetails) {
        this.OrderDetails = OrderDetails;
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
        if (!(object instanceof Orders)) {
            return false;
        }
        Orders other = (Orders) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Orders[ id=" + id + " ]";
    }
    
}
