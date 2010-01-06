using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;
using eshop.core.Dao;
using eshop.core.Dao.Impl;
using eshop.core.Domain;

namespace eshop.Utils.HtmlHelpers
{
    public static class TreeExtension
    {
        static bool firstTime;

        public static string CategoryTree(this HtmlHelper helper, List<Category> categories)
        {
            firstTime = true;
            // key - parent id; value - category
            Dictionary<Category, Category> map = new Dictionary<Category, Category>(categories.Count);
            Category root = null;
            foreach (var category in categories)
            {
                if (category.Parent != null)
                    map.Add(category, category.Parent);
                else
                    root = category;

            }

            foreach (KeyValuePair<Category, Category> pair in map)
            {
                pair.Value.SubCategories.Add(pair.Key);
            }

            string html = "";
            listChildren(ref html, root);
            return html;
        }

        private static void listChildren(ref string  html, Category category)
        {
            if (category.SubCategories.Count > 0)
            {
                html += firstTime ? "<ul class=\"nav\">" : "<ul>";
                firstTime = false;
            }
            else
                return;

            foreach (var subCategory in category.SubCategories)
            {
                if (subCategory.SubCategories.Count > 0)
                    html += string.Format("<li>{0}", subCategory.Name);
                else
                    html += string.Format("<li><a href=\"{0}\">{1}</a>", VirtualPathUtility.ToAbsolute("~/Commodity/Category/" + subCategory.Id), subCategory.Name);    

                listChildren(ref html, subCategory);
                html += "</li>";
            }

            if (category.SubCategories.Count > 0)
                html += "</ul>";
        }
    }
}
