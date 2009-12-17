using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using eshop.core.Domain;
using NHibernate.Criterion;

namespace eshop.core.Dao.Impl
{
    public class CommodityDao: AbstractNHibernateDao<Commodity>, ICommodityDao
    {
        public IList<Commodity> FindForCategory(Category category)
        {
            return CreateCriteria()
                .Add(Restrictions.Eq("Category", category))
                .List<Commodity>();
        }
    }
}
