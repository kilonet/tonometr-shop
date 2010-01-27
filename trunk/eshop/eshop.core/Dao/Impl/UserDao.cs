using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using eshop.core.Domain;
using NHibernate.Criterion;

namespace eshop.core.Dao.Impl
{
    public class UserDao: AbstractNHibernateDao<User>, IUserDao
    {
        public User FindByName(string userName)
        {
            return CreateCriteria().Add(Expression.Eq("Login", userName)).UniqueResult<User>();
        }
    }
}
