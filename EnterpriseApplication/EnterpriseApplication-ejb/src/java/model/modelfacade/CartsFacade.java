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
import model.Carts;
import model.Menus;

/**
 *
 * @author Erwin_Yoga
 */
@Stateless
public class CartsFacade extends AbstractFacade<Carts> {

    @PersistenceContext(unitName = "EnterpriseApplication-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CartsFacade() {
        super(Carts.class);
    }
    
    public List<Carts> findByUsername(String username) {
        Query query = em.createNamedQuery("Carts.findByUsername");
        query.setParameter("username", username);
        return query.getResultList();
    }   
}
