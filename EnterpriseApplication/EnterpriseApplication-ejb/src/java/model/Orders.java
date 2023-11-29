/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 *
 * @author Erwin_Yoga
 */
@Entity
@NamedQueries({
    @NamedQuery(name = "Orders.findByUsername", query = "SELECT o FROM Orders o WHERE o.username = :username"),
    @NamedQuery(name = "Orders.findByUsername2", query = "SELECT o FROM Orders o WHERE o.stallstaffusername = :username"),
    @NamedQuery(name = "Orders.findBystall", query = "SELECT o FROM Orders o WHERE o.stallname = :stall"),
    @NamedQuery(name = "Orders.findByUsernameAndStatusNew", query = "SELECT o FROM Orders o WHERE o.username = :username AND o.status2 = 'new'"),
    @NamedQuery(name = "Order.findFilledOrders", query = "SELECT o FROM Orders o WHERE o.status = 'filled'"),
    @NamedQuery(name = "Orders.countOrdersByStall", query = "SELECT o.stallname, COUNT(o) FROM Orders o GROUP BY o.stallname ORDER BY COUNT(o) DESC"),
    @NamedQuery(name = "Orders.dailyReport", query = "SELECT o.id, o.mydate, o.totalprice FROM Orders o WHERE o.stallname = :stallName AND o.mydate >= :date"),
    @NamedQuery(name = "Orders.weeklyReport", query = "SELECT o.id, o.mydate, o.totalprice FROM Orders o WHERE o.stallname = :stallName AND o.mydate >= :startDate"),
    @NamedQuery(name = "Orders.monthlyReport",query = "SELECT o.id, o.mydate, o.totalprice FROM Orders o WHERE o.stallname = :stallName AND o.mydate >= :startDate"),
    @NamedQuery(name = "Order.calculateAverageScore",query = "SELECT AVG(o.rating) FROM Orders o WHERE o.stallname = :stallName AND o.status = 'filled'"),
    @NamedQuery(name = "Order.getOrdersWithCondition",query = "SELECT o FROM Orders o WHERE o.stallname = :stallName"),    
    
    
})
public class Orders implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Temporal(TemporalType.TIMESTAMP)
    private Date mydate;
    private int rating; 
    private String feedback;
    private String username;
    private double totalprice;
    private String status;
    private String status2;
    private String stallstaffusername;
    private Long cardno;
    private String stallname;
    @OneToMany
    private ArrayList<OrderDetails> OrderDetails = new ArrayList<OrderDetails>();

    public Orders() {
    }

    public Orders(Date mydate, int rating, String feedback, String username, double totalprice, String status, String status2, String stallstaffusername, Long cardno, String stallname) {
        this.mydate = mydate;
        this.rating = rating;
        this.feedback = feedback;
        this.username = username;
        this.totalprice = totalprice;
        this.status = status;
        this.status2 = status2;
        this.stallstaffusername = stallstaffusername;
        this.cardno = cardno;
        this.stallname = stallname;
    }
    
    public String getStallname() {
        return stallname;
    }

    public void setStallname(String stallname) {
        this.stallname = stallname;
    }


    public Long getCardno() {
        return cardno;
    }

    public void setCardno(Long cardno) {
        this.cardno = cardno;
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

    public Date getMydate() {
        return mydate;
    }

    public void setMydate(Date mydate) {
        this.mydate = mydate;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
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
