/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.modelfacade;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import model.Users;

/**
 *
 * @author Erwin_Yoga
 */
@Stateless
public class UsersFacade extends AbstractFacade<Users> {

    @PersistenceContext(unitName = "EnterpriseApplication-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsersFacade() {
        super(Users.class);
    }
    
    public Users findUserRole(String username, String password) {
        Query query = em.createNamedQuery("Users.details");
        query.setParameter("username", username);
        query.setParameter("password", password); // Remember to use hashed passwords in a real application
        List<Users> result = query.getResultList();
        if(result.size()>0){
            return result.get(0);
        }
        return null;
    }
    
}
