using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Iesi.Collections.Generic;

namespace eshop.core.Domain
{
    public class Order: DomainObject
    {
        public virtual DateTime DateAdded { get; set; }
        public virtual ISet<OrderLine> Lines { get; set; }
        public virtual User User { get; set; }

    }
}
