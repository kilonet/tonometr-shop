using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Castle.Core.Resource;
using Castle.Windsor;
using Castle.Windsor.Configuration.Interpreters;

namespace eshop.FrameworkExtensions
{
    public class Container
    {
        private static WindsorContainer windsorContainer;
        private static object syncRoot = new Object();
        
        public static WindsorContainer Instance
        {
            get
            {
                if (windsorContainer == null)
                {
                    lock(syncRoot)
                    {
                        windsorContainer = new WindsorContainer(new XmlInterpreter(new ConfigResource("castle")));    
                    }
                }
                return windsorContainer;
            }
        }

    }
}
