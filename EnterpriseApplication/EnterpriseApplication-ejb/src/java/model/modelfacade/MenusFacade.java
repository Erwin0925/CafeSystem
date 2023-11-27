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
import model.Menus;

/**
 *
 * @author Erwin_Yoga
 */
@Stateless
public class MenusFacade extends AbstractFacade<Menus> {

    @PersistenceContext(unitName = "EnterpriseApplication-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MenusFacade() {
        super(Menus.class);
    }

    public List<Menus> findsMenu(String stallName) {
        Query query = em.createNamedQuery("menu.details");
        query.setParameter("stallName", stallName);
        return query.getResultList();
    }
    
    public Menus findSpecificMenu(Long stallId) {
        Query query = em.createNamedQuery("specificmenu.details");
        query.setParameter("stallId", stallId);
        List<Menus> result = query.getResultList();
        if(result.size()>0){
            return result.get(0);
        }
        return null;
    }
    
    public List<Menus> findsMenuNames(String stallName) {
        Query query = em.createNamedQuery("Menus.findAllItemNames");
        query.setParameter("stallName", stallName);
        return query.getResultList();
    }
     
    public Menus findwithName(String name, String stallname) {
        Query query = em.createNamedQuery("Menu.findByName");
        query.setParameter("name", name);
        query.setParameter("stallname", stallname);
        List<Menus> result = query.getResultList();
        if(result.size()>0){
            return result.get(0);
        }
        return null;
    }

    
}
