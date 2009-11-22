using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using eshop.core.Dao;
using eshop.core.Domain;
using eshop.ViewModels;

namespace eshop.Controllers
{
    public class CategoryController : Controller
    {
        private ICategoryDao categoryDao;

        public ICategoryDao CategoryDao
        {
            set { categoryDao = value; }
        }

        //
        // GET: /Category/

        public ActionResult Index()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(Category category)
        {
            if (category.Parent.Id == 0)
            {
                category.Parent = null;
            }
            categoryDao.Save(category);
            return RedirectToAction("Edit", new {category.Id});
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Create()
        {
            CategoryViewModel viewModel = new CategoryViewModel();
            viewModel.ParentCategories = categoryDao.FindAllForDropdown();
            viewModel.Category = new Category();
            return View(viewModel);
        }

    }
}
