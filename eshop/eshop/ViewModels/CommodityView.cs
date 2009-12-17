using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using eshop.core.Domain;
using eshop.Models.FormModels;

namespace eshop.Views.Account
{
    public class CommodityView
    {
        public Commodity Commodity { get; set; }
        public List<SelectListItem> Categories { get; set; }
    }
}