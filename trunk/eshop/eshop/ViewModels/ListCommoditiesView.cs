using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using eshop.core.Domain;

namespace eshop.ViewModels
{
    public class ListCommoditiesView
    {
        public Category Category;
        public IList<Commodity> Commodities;
    }
}
