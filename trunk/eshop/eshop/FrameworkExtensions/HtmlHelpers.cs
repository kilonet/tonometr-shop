using System.Collections.Generic;
using System.Web.Mvc;

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
    }

}