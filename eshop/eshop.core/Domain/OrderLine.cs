using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace eshop.core.Domain
{
    public class OrderLine: DomainObject
    {
        public virtual string Name { get; set; }
        public virtual decimal Price { get; set; }
        public virtual int Quantity { get; set; }
    }
}
