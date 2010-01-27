using System.Collections.Generic;
using System.Web.Mvc;
using eshop.core.Domain;

namespace eshop.FrameworkExtensions
{
    public static class HtmlHelpers
    {
        public static string PageTitle(this HtmlHelper htmlHelper, params string[] sections)
        {
            string[] tokens = new string[sections.Length + 1];
            tokens[0] = "Интернет-магазин медтехники OMRON";
            sections.CopyTo(tokens, 1);
            return  string.Join(" - ", tokens);
        }

        public static string CommodityListPageTitle(this HtmlHelper htmlHelper, Category category)
        {
            if (category.Parent.Name == "root")
            {
                return category.Name;
            }
            return category.Parent.Name + " - " + category.Name;
        }
    }

}