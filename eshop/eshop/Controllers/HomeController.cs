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
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewData["Message"] = "Welcome to ASP.NET MVC!";

            return View();
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Upload()
        {
            foreach (string inputTagName in Request.Files)
            {
                HttpPostedFileBase file = Request.Files[inputTagName];
                string fileName = DateTime.Now.Ticks.ToString();
                string thumbFileName = fileName + "_min";

                if (file.ContentLength > 0)
                {
                    string filePath = Path.Combine(HttpContext.Server.MapPath("../Uploads"),
                        fileName + ".jpg");
                    string thumbFilePath = Path.Combine(HttpContext.Server.MapPath("../Uploads"),
                        thumbFileName + ".jpg");
                    file.SaveAs(filePath);

                    ImageUtils.SaveImageToFile(ImageUtils.ResizeImage(filePath), thumbFilePath);
                }

            }
            return View();
        }
    }
}
