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
import model.Stalls;

/**
 *
 * @author Erwin_Yoga
 */
@Stateless
public class StallsFacade extends AbstractFacade<Stalls> {

    @PersistenceContext(unitName = "EnterpriseApplication-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public StallsFacade() {
        super(Stalls.class);
    }
    
    public List<Stalls> findAllStallNames() {
        Query query = em.createNamedQuery("Stall.findAllNames");
        return query.getResultList();
    }
    
    public List<Stalls> findAllStallNames2() {
        Query query = em.createNamedQuery("Stall.findAllNames2");
        return query.getResultList();
    }

    public List<Stalls> findStallNames3(String stallname) {
        Query query = em.createNamedQuery("Stall.findNames3");
        query.setParameter("stallname", stallname);
        return query.getResultList();
    }
    
}
