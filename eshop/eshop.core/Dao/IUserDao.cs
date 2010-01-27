using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using eshop.core.Domain;

namespace eshop.core.Dao
{
    public interface IUserDao: IDao<User>
    {
        User FindByName(string userName);
    }
}
