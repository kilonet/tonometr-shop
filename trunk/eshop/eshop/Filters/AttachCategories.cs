using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using eshop.core.Dao;
using eshop.FrameworkExtensions;

namespace eshop.Filters
{
    public class AttachCategories : ActionFilterAttribute
    {
        private ICategoryDao categoryDao;

        public ICategoryDao CategoryDao
        {
            set { categoryDao = value; }
        }
        
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            filterContext.Controller.SetCategories(categoryDao.FindAllForDropdown());
        }
    }
}
