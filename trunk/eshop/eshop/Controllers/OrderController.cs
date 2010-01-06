using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using eshop.core.Dao;

namespace eshop.Controllers
{
    public class OrderController : ControllerSupport
    {
        private IOrderDao orderDao;

        public IOrderDao OrderDao
        {
            set{ orderDao = value; }
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            return View("ListOrders", orderDao.FindAll());
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Details(long id)
        {
            return View("OrderDetails", orderDao.FindById(id));
        }

    }
}
