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
import model.Managers;

/**
 *
 * @author Erwin_Yoga
 */
@Stateless
public class ManagersFacade extends AbstractFacade<Managers> {

    @PersistenceContext(unitName = "EnterpriseApplication-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ManagersFacade() {
        super(Managers.class);
    }
    
    public Managers findmanagerdetails(String username) {
        Query query = em.createNamedQuery("manager.details");
        query.setParameter("username", username);
        List<Managers> result = query.getResultList();
        if(result.size()>0){
            return result.get(0);
        }
        return null;
    }
    
}
