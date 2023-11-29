/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.modelfacade;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import model.Orders;

/**
 *
 * @author Erwin_Yoga
 */
@Stateless
public class OrdersFacade extends AbstractFacade<Orders> {

    @PersistenceContext(unitName = "EnterpriseApplication-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public OrdersFacade() {
        super(Orders.class);
    }
    
    public Orders findByUsernameAndStatusNew(String username) {
        Query query = em.createNamedQuery("Orders.findByUsernameAndStatusNew");
        query.setParameter("username", username);
        List<Orders> result = query.getResultList();
        if(result.size()>0){
            return result.get(0);
        }
        return null;
    }
    
    public List<Orders> findByUsername(String username) {
        Query query = em.createNamedQuery("Orders.findByUsername");
        query.setParameter("username", username);
        return query.getResultList();
    }
    
    public List<Orders> findByUsername2(String username) {
        Query query = em.createNamedQuery("Orders.findByUsername2");
        query.setParameter("username", username);
        return query.getResultList();
    }
    
    public List<Orders> findByStall(String stall) {
        Query query = em.createNamedQuery("Orders.findBystall");
        query.setParameter("stall", stall);
        return query.getResultList();
    }
    
    public Map<String, Double> getAverageRatingsByStall() {
        List<Orders> filledOrders = em.createNamedQuery("Order.findFilledOrders", Orders.class).getResultList();

        Map<String, Double> averageRatings = new HashMap<>();
        Map<String, List<Integer>> ratings = new HashMap<>();

        for (Orders order : filledOrders) {
            ratings.computeIfAbsent(order.getStallname(), k -> new ArrayList<>()).add(order.getRating());
        }

        for (Map.Entry<String, List<Integer>> entry : ratings.entrySet()) {
            double average = entry.getValue().stream().mapToInt(Integer::intValue).average().orElse(0.0);
            averageRatings.put(entry.getKey(), average);
        }
        return averageRatings;
    }    

    public List<Object[]> countOrdersByStall() {
        return em.createNamedQuery("Orders.countOrdersByStall", Object[].class).getResultList();
    }
    
    public List<Object[]> getDailyReport(String stallName, Date date) {
        return em.createNamedQuery("Orders.dailyReport", Object[].class)
                 .setParameter("stallName", stallName)
                 .setParameter("date", date)
                 .getResultList();
    }
    public List<Object[]> getWeeklyReport(String stallName, Date date) {
        
        Date mydate = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(mydate);
        calendar.add(Calendar.DAY_OF_MONTH, -7);
        Date sevenDaysBefore = calendar.getTime();
        return em.createNamedQuery("Orders.weeklyReport", Object[].class)
                 .setParameter("stallName", stallName)
                 .setParameter("startDate", sevenDaysBefore)
                 .getResultList();
    }
    
    public List<Object[]> getMonthlyReport(String stallName, Date date) {
        Date mydate2 = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(mydate2);
        calendar.add(Calendar.DAY_OF_MONTH, -30);
        Date thirtyDaysBefore = calendar.getTime();
        return em.createNamedQuery("Orders.monthlyReport", Object[].class)
                 .setParameter("stallName", stallName)
                 .setParameter("startDate", thirtyDaysBefore)
                 .getResultList();
    }
}
