using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Iesi.Collections.Generic;

namespace eshop.core.Domain
{
    public class Order: DomainObject
    {
        private DateTime dateAdded = DateTime.Now;
        private ISet<OrderLine> lines = new HashedSet<OrderLine>();
        public virtual User User { get; set; }

        public virtual ShippingDetails ShippingDetails { get; set; }

        public virtual DateTime DateAdded
        {
            get { return dateAdded; }
            set { dateAdded = value; }
        }

        public virtual ISet<OrderLine> Lines
        {
            get { return lines; }
            set { lines = value; }
        }
    }
}
