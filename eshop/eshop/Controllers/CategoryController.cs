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

        public ICategoryDao CategoryDao
        {
            set { categoryDao = value; }
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
            //List<Category> parentCategories = categoryDao.FindAll();
            //List<SelectListItem> parentCategoriesForView =
            //    parentCategories.ConvertAll(x => new SelectListItem {Text = x.Name, Value = x.Id.ToString()});
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
        [AttachCategories]
        public ActionResult Edit(CategoryView categoryView)
        {
            Category categoryDto = categoryView.Category;
            if (categoryDto.Parent.Id == 0) categoryDto.Parent = null;
            Category category = categoryDao.FindById(categoryDto.Id);
            if (!categoryDto.IsValid)
            {
                foreach (RuleViolation issue in categoryDto.GetRuleViolations())
                {
                    ModelState.AddModelError(issue.PropertyName, issue.ErrorMessage);
                    ModelState.SetModelValue(issue.PropertyName, ValueProvider[issue.PropertyName]);
                }
            }
            else
            {
                category.Update(categoryDto);
                categoryDao.Save(category);
            }
           
            return View("EditCategory", new CategoryView {Category = category});
        }

        

        //private CategoryView getCategoryView(Category category)
        //{
        //    // parent categories 
        //    // selected category
        //    // category to display
            
        //    List<SelectListItem> parentCategories = getCategories();

        //    if (category.Parent != null)
        //    {
        //        foreach (SelectListItem item in parentCategories)
        //        {
        //            if (item.Value == category.Parent.Id.ToString())
        //            {
        //                item.Selected = true;
        //                break;
        //            }
        //        }
        //    }
        //    return new CategoryView
        //               {
        //                   Category = category,
        //                   ParentCategories = parentCategories
        //               };
        //}

        //private List<SelectListItem> getCategories()
        //{
        //    List<SelectListItem> items = new List<SelectListItem> {new SelectListItem {Text = "пусто", Value = ""}};
        //    items.AddRange(categoryDao.FindAll().ConvertAll
        //        (x => new SelectListItem
        //                  {
        //                      Text = x.Name,
        //                      Value = x.Id.ToString()
        //                  }));
        //    return items;
        //}
    }
}
