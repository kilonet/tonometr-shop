using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using eshop.core.Dao;
using eshop.core.Domain;
using eshop.core.Domain.Validators;
using eshop.Filters;
using eshop.FrameworkExtensions;
using eshop.ViewModels;

namespace eshop.Controllers
{
    public class CategoryController : ControllerSupport
    {
        private ICategoryDao categoryDao;
        private ICommodityDao commodityDao;

        public ICategoryDao CategoryDao
        {
            set { categoryDao = value; }
        }

        public ICommodityDao CommodityDao
        {
            set { commodityDao = value; }
        }

        //
        // GET: /Category/

        public ActionResult Index()
        {
            return View("ListCategories", categoryDao.FindAll());
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [AttachCategories]
        public ActionResult Create(Category category)
        {
            if (!ModelState.IsValid)
            {
                return View("CreateCategory");
            }
            if (category.Parent == null || category.Parent.Id == 0)
            {
                category.Parent = null;
            }
            categoryDao.Save(category);
            return RedirectToAction("Edit", new {category.Id});
        }

        [AcceptVerbs(HttpVerbs.Get)]
        [AttachCategories]
        public ActionResult Create()
        {
            return View("CreateCategory");
        }

        [AcceptVerbs(HttpVerbs.Get)]
        [AttachCategories]
        public ActionResult Edit(long id)
        {
            Category category = categoryDao.FindById(id);
            CategoryView view =
                new CategoryView
                {
                    Category = category
                };
            if (category.Parent != null)
            {
                foreach (SelectListItem item in this.GetCategories())
                {
                    if (int.Parse(item.Value) == category.Parent.Id)
                    {
                        item.Selected = true;
                        break;
                    }
                }
            }
            return View("EditCategory", view);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(CategoryView categoryView)
        {
            Category categoryDto = categoryView.Category;
            if (categoryDto.Parent.Id == 0) categoryDto.Parent = null;
            Category category = categoryDao.FindById(categoryDto.Id);
            if (!ModelState.IsValid)
            {
                return View("EditCategory", new CategoryView {Category = category});
            }
            else
            {
                category.Update(categoryDto);
                categoryDao.Save(category);
                return View("EditCategory", new CategoryView {Category = category});
            }
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [AttachCategories]
        public ActionResult Delete(Category category)
        {
            category = categoryDao.Load(category);
            IList<Commodity> commodities = commodityDao.FindForCategory(category);
            if (commodities.Count > 0)
            {
                ModelState.AddModelError("non.empty.category", "Нельзя удалить категорию, т. к. есть товары относящиеся к данной категории");
                return View("EditCategory", new CategoryView(category));
            }
            IList<Category> subCategories = categoryDao.FindSubCategories(category);
            if(subCategories.Count > 0)
            {
                ModelState.AddModelError("has.subcategories", "Нельзя удалить категорию, т. к. она содержит дочерние категории");
                return View("EditCategory", new CategoryView(category));
            }
            categoryDao.Delete(category);
            return RedirectToAction("Index");
        }
    }
}
