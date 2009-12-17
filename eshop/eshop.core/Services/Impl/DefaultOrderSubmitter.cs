using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using eshop.core.Dao;
using eshop.core.Domain;

namespace eshop.core.Services.Impl
{
    public class DefaultOrderSubmitter: IOrderSubmitter
    {
        private IOrderDao orderDao;

        public IOrderDao OrderDao
        {
            set { orderDao = value; }
        }

        public void SubmitOrder(Cart cart)
        {
            Order order = new Order();
            order.ShippingDetails = cart.ShippingDetails;
            order.Lines.AddAll(cart.Lines);
            orderDao.Save(order);
        }
    }
}
