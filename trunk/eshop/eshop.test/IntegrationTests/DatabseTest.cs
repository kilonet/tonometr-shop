using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using NHibernate.Cfg;
using NHibernate.Tool.hbm2ddl;
using NUnit.Framework;


namespace eshop.test.IntegrationTests
{
    [TestFixture]
    public class DatabseTest
    {
        [Test]
        public void CreateSchema()
        {
            Configuration configuration = new Configuration();
            configuration.Configure();
            SchemaExport schemaExport = new SchemaExport(configuration);
            using (TextWriter stringWriter = new StreamWriter("create.sql"))
            {
                schemaExport.Execute(true, true, false);
                
            }
        }
    }
}
