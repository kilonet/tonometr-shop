using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using eshop.core.Dao;
using eshop.core.Domain;
using eshop.Utils;
using eshop.ViewModels;


namespace eshop.Controllers
{
    public class CommodityController : Controller
    {
        private ICommodityDao commodityDao;
        private ICategoryDao categoryDao;

        public ICategoryDao CategoryDao
        {
            set { categoryDao = value; }
        }

        public ICommodityDao CommodityDao
        {
            set { commodityDao = value; }
        }

        //
        // GET: /Commodity/

        public ActionResult Index()
        {
            return View(commodityDao.FindAll());
        }

        //
        // GET: /Commodity/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Commodity/Create

        public ActionResult Create()
        {
            return View(new CommodityViewModel
                            {
                                Commodity = new Commodity(),
                                Categories = categoryDao.FindAllForDropdown()
                            });
        } 

        //
        // POST: /Commodity/Create

        [AcceptVerbs(HttpVerbs.Post)]
        [ValidateInput(false)]
        public ActionResult Create(Commodity commodity)
        {
            try
            {
                commodityDao.Save(commodity);
                return RedirectToAction("Edit", new {commodity.Id});
            }
            catch(Exception e)
            {
                return View();
            }
        }

        //
        // GET: /Commodity/Edit/5
 
        public ActionResult Edit(long id)
        {
            CommodityViewModel viewModel = new CommodityViewModel
                                               {
                                                   Categories = categoryDao.FindAllForDropdown(),
                                                   Commodity = commodityDao.FindById(id)
                                               };
            return View(viewModel);
        }

        //
        // POST: /Commodity/Edit/5
        [ValidateInput(false)]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(Commodity commodity)
        {
            try
            {
                Commodity fromDb = commodityDao.FindById(commodity.Id);
                fromDb.Price = commodity.Price;
                commodityDao.Update(fromDb);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult UploadPicture(long commodityId)
        {
            foreach (string inputTagName in Request.Files)
            {
                HttpPostedFileBase file = Request.Files[inputTagName];
                string fileName = DateTime.Now.Ticks.ToString();
                string thumbFileName = fileName + "_min";
                // TODO check for mime type
                // TODO add support for GIF, PNG
                if (file.ContentLength > 0)
                {
                    string filePath = Path.Combine(HttpContext.Server.MapPath("../Uploads"),
                        fileName + ".jpg");
                    string thumbFilePath = Path.Combine(HttpContext.Server.MapPath("../Uploads"),
                        thumbFileName + ".jpg");
                    file.SaveAs(filePath);

                    ImageUtils.SaveImageToFile(ImageUtils.ResizeImage(filePath), thumbFilePath);
                }
                Commodity commodity = commodityDao.FindById(commodityId);
                commodity.PictureFileName = fileName + ".jpg";
                commodity.SmallPictureFileName = thumbFileName + ".jpg";
                commodityDao.Save(commodity);
                break;
            }
            
            return RedirectToAction("Edit", new {Id = commodityId});
        }
    }
}
