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


}
