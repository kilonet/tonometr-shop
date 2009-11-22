using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using eshop.core.Domain;

namespace eshop.core.Dao.Impl
{
    public class OrderDao: AbstractNHibernateDao<Order>, IOrderDao
    {
    }
}
