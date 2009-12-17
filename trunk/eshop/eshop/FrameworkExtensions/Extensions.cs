using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace eshop.FrameworkExtensions
{
    public static class Extensions
    {
        public static void SetCategories(this ControllerBase controller, IEnumerable<SelectListItem> categories)
        {
            controller.ViewData[ViewDataKeys.Categories] = categories;
        }

        public static IEnumerable<SelectListItem> GetCategories(this ViewPage viewUserControl)
        {
            return viewUserControl.ViewData[ViewDataKeys.Categories] as IEnumerable<SelectListItem>;
        }

        public static IEnumerable<SelectListItem> GetCategories(this ControllerBase controller)
        {
            return controller.ViewData[ViewDataKeys.Categories] as IEnumerable<SelectListItem>;
        }
    }
}
