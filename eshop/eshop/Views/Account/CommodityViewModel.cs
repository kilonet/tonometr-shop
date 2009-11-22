using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using eshop.core.Domain;

namespace eshop.ViewModels
{
    public class CommodityViewModel
    {
        public Commodity Commodity { get; set; }
        public List<SelectListItem> Categories { get; set; }
    }
}
