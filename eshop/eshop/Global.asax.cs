﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using eshop.Binders;
using eshop.core.Domain;
using eshop.FrameworkExtensions;
using Microsoft.Web.Mvc.DataAnnotations;

namespace eshop
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            
            routes.MapRoute(
                null,
                "Commodity/Category/{id}",
                new { controller = "Commodity", action = "Index", id = "" });

            routes.MapRoute(
                "Default",                                              // Route name
                "{controller}/{action}/{id}",                           // URL with parameters
                new { controller = "Home", action = "Index", id = "" }  // Parameter defaults
            );
        }

        protected void Application_Start()
        {
            RegisterRoutes(RouteTable.Routes);
            ControllerBuilder.Current.SetControllerFactory(new WindsorControllerFactory());
            ModelBinders.Binders.Add(typeof(Cart), new CartModelBinder());
            ModelBinders.Binders.DefaultBinder = new DataAnnotationsModelBinder();
        }
    }
}