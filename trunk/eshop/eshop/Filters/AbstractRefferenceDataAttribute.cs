using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using eshop.Exceptions;

namespace eshop.Filters
{
    public abstract class AbstractRefferenceDataAttribute : ActionFilterAttribute
    {
        public abstract string Key { get; } 
        public abstract object GetData();

        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            if (Key.Length == 0)
                throw new KeyIsNotDefinedException();
            filterContext.Controller.ViewData[Key] = GetData();
        }

    

    }
}
