using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using eshop.core.Domain;

namespace eshop.core.Services
{
    public interface IOrderSubmitter
    {
        void SubmitOrder(Cart cart);
    }
}
