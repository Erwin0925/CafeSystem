/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.modelfacade;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import model.OrderDetails;

/**
 *
 * @author Erwin_Yoga
 */
@Stateless
public class OrderDetailsFacade extends AbstractFacade<OrderDetails> {

    @PersistenceContext(unitName = "EnterpriseApplication-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public OrderDetailsFacade() {
        super(OrderDetails.class);
    }
    
    public List<OrderDetails> findByUsername(String username) {
        Query query = em.createNamedQuery("Orderdetails.findByUsername");
        query.setParameter("username", username);
        return query.getResultList();
    }
    
    public List<Object[]> countMenuItemsByStallName(String stallName) {
        return em.createNamedQuery("MenuItem.countByMenuId", Object[].class)
                 .setParameter("stallname", stallName)
                 .getResultList();
    } 
}
