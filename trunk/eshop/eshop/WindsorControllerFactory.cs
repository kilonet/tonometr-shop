﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using Castle.Core;
using Castle.Core.Resource;
using Castle.Windsor;
using Castle.Windsor.Configuration.Interpreters;

namespace eshop
{
    public class WindsorControllerFactory : DefaultControllerFactory
    {
        private WindsorContainer container;

        public WindsorControllerFactory()
        {
            // Instantiate a container, taking configuration from web.config
            container = new WindsorContainer(
                new XmlInterpreter(new ConfigResource("castle"))
            );
            // Also register all the controller types as transient
            var controllerTypes = from t in Assembly.GetExecutingAssembly().GetTypes()
                                  where typeof(IController).IsAssignableFrom(t)
                                  select t;
            foreach (Type t in controllerTypes)
                container.AddComponentLifeStyle(t.FullName, t,
                LifestyleType.Transient);
        }

        protected override IController GetControllerInstance(Type controllerType)
        {
            return (IController)container.Resolve(controllerType);
        }
    }
}
