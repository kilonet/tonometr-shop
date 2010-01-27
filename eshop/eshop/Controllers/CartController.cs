using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using eshop.core.Dao;
using eshop.core.Domain;
using eshop.core.Services;

namespace eshop.Controllers
{
    public class CartController : ControllerSupport
    {
        private IOrderDao orderDao;
        private IOrderSubmitter orderSubmitter;

        public IOrderDao OrderDao
        {
            set { orderDao = value; }
        }

        public IOrderSubmitter OrderSubmitter
        {
            set { orderSubmitter = value; }
        }

        public ActionResult Index(Cart cart)
        {
            return View("ViewCart", cart);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Remove(string name, Cart cart)
        {
            int indexToRemove = -1;
            for (int i = 0; i < cart.Lines.Count; i++ )
            {
                if (cart.Lines[i].Name == name)
                {
                    indexToRemove = i;
                    break;
                }
            }
            cart.Lines.RemoveAt(indexToRemove);
            return RedirectToAction("Index");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CheckOut(Cart cart, ShippingDetails shippingDetails)
        {
            if (cart.Lines.Count < 1) 
            {
                ModelState.AddModelError("Cart", "Извините, Ваша корзина пуста");
                return View("ViewCart", cart);
            }

            if (!ModelState.IsValid)
            {
                return View("ViewCart", cart);
            }

            cart.ShippingDetails = shippingDetails;
            orderSubmitter.SubmitOrder(cart);
            cart.Clear();
            return View("CompletedView");
            

            return View("ViewCart");

        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult FillShippingDetails()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult PreviewOrder(Cart cart, FormCollection form)
        {
            return View();
        }

    }
}
