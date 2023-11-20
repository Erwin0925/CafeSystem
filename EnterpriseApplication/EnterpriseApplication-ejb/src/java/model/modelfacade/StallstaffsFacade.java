/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.modelfacade;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import model.Stallstaffs;

/**
 *
 * @author Erwin_Yoga
 */
@Stateless
public class StallstaffsFacade extends AbstractFacade<Stallstaffs> {

    @PersistenceContext(unitName = "EnterpriseApplication-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public StallstaffsFacade() {
        super(Stallstaffs.class);
    }
    
}
