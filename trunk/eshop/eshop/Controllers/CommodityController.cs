using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using eshop.core.Dao;
using eshop.core.Domain;
using eshop.Models.FormModels;
using eshop.Utils;
using eshop.Views.Account;
using Category=eshop.core.Domain.Category;


namespace eshop.Controllers
{
    public class CommodityController : ControllerSupport
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

        public ActionResult Index(long? id)
        {
            return id.HasValue
                       ? View("ListCommodities", commodityDao.FindForCategory(categoryDao.FindById(id.Value)))
                       : View("ListCommodities", commodityDao.FindAll());
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
            return View("CreateCommodity", new CommodityView
                            {
                                Commodity = new Commodity(),
                                Categories = categoryDao.FindAllForDropdown()
                            });
        } 

        //
        // POST: /Commodity/Create

        [AcceptVerbs(HttpVerbs.Post)]
        [ValidateInput(false)]
        public ActionResult Create(CommodityView commodityView)
        {
            Commodity commodityDto = commodityView.Commodity;
            try
            {
                Commodity commodity = new Commodity();
                commodity.update(commodityDto);
                if (!ModelState.IsValid)
                    return View("CreateCommodity",
                        new CommodityView
                        {
                            Commodity = new Commodity(),
                            Categories = categoryDao.FindAllForDropdown()
                        });

                if (!commodity.IsValid)
                {
                    foreach (var issue in commodity.GetRuleViolations())
                    {
                        ModelState.AddModelError(issue.PropertyName, issue.ErrorMessage);
                    }
                    return View("CreateCommodity", 
                        new CommodityView
                        {
                            Commodity = new Commodity(),
                            Categories = categoryDao.FindAllForDropdown()
                        });
                }
                commodityDao.Save(commodity);
                return RedirectToAction("Edit", new {commodity.Id});
            }
            catch
            {
                return View("CreateCommodity");
            }
        }

        //
        // GET: /Commodity/Edit/5
 
        public ActionResult Edit(long id)
        {
            Commodity commodity = commodityDao.FindById(id);
            CommodityView view = new CommodityView
                                               {
                                                   Categories = categoryDao.FindAllForDropdown(),
                                                   Commodity = commodity
                                               };
            foreach (SelectListItem item in view.Categories)
            {
                if (int.Parse(item.Value) == commodity.Category.Id)
                {
                    item.Selected = true;
                    break;
                }
            }
            return View("EditCommodity", view);
        }

        //
        // POST: /Commodity/Edit/5
        [ValidateInput(false)]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(CommodityView commodityView)
        {
            Commodity commodityDto = commodityView.Commodity;
            Commodity commodity = commodityDao.FindById(commodityDto.Id);
            commodity.update(commodityDto);
            try
            {
                commodityDao.Save(commodity);
                return RedirectToAction("Index");
            }
            catch
            {
                return View("EditCommodity");
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
                    string filePath = Path.Combine(HttpContext.Server.MapPath("../Content/Uploads"),
                        fileName + ".jpg");
                    string thumbFilePath = Path.Combine(HttpContext.Server.MapPath("../Content/Uploads"),
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

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Details(long id)
        {
            return View("CommodityDetails", commodityDao.FindById(id));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public RedirectToRouteResult AddToBasket(FormCollection form, Cart cart)
        {
            long commodityId = (long)form.GetValue("Id").ConvertTo(typeof (long));
            int quantity = (int) form.GetValue("Quantity").ConvertTo(typeof (int));
            string returnUrl = (string) form.GetValue("returnUrl").ConvertTo(typeof (string));

            Commodity commodity = commodityDao.FindById(commodityId);
            cart.AddItem(commodity, quantity);

            return RedirectToAction("Index", new { returnUrl });
        }
    }
}
