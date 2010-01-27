using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using eshop.Binders;
using eshop.core.Dao;
using eshop.core.Domain;
using NHibernate;

namespace eshop.Controllers
{
    public abstract class ControllerSupport: Controller
    {
        protected ControllerSupport()
        {
            ViewData["categories"] = NHibernateSessionManager.Instance.GetSession().CreateQuery("from Category").List<Category>();    
            NHibernateSessionManager.Instance.GetSession().Clear();
        }


    }
}
