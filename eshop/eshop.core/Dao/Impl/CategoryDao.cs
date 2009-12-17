using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using eshop.core.Domain;

namespace eshop.core.Dao.Impl
{
    public class CategoryDao: AbstractNHibernateDao<Category>, ICategoryDao
    {
        public List<SelectListItem> FindAllForDropdown()
        {
            List<SelectListItem> categories = new List<SelectListItem>();
            foreach (Category category in FindAll())
            {
                categories.Add(new SelectListItem
                {
                    Text = category.Name,
                    Value = category.Id.ToString()
                });
            }
            return categories;
        }
    }
}
