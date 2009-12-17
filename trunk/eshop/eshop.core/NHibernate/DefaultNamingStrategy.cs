using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NHibernate.Cfg;

namespace eshop.core.NHibernate
{
    public class DefaultNamingStrategy : INamingStrategy
    {
        public string ClassToTableName(string className)
        {
            throw new System.NotImplementedException();
        }

        public string PropertyToColumnName(string propertyName)
        {
            throw new System.NotImplementedException();
        }

        public string TableName(string tableName)
        {
            throw new System.NotImplementedException();
        }

        public string ColumnName(string columnName)
        {
            throw new System.NotImplementedException();
        }

        public string PropertyToTableName(string className, string propertyName)
        {
            throw new System.NotImplementedException();
        }

        public string LogicalColumnName(string columnName, string propertyName)
        {
            throw new System.NotImplementedException();
        }
    }
}
