using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using eshop.core.Domain;

namespace eshop.core.Dao
{
    public interface ICategoryDao: IDao<Category>
    {
        List<SelectListItem> FindAllForDropdown();
        
    }
}
