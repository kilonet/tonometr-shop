using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using eshop.Utils;

namespace eshop.Controllers
{
    [HandleError]
    public class HomeController : ControllerSupport
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}
