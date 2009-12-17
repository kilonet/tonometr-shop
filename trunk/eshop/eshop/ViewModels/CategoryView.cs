using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using eshop.core.Domain;
using System.Web.Mvc;

namespace eshop.ViewModels
{
    public class CategoryView
    {
        public Category Category { get; set; }
        public List<SelectListItem> ParentCategories { get; set; }
    }
}
