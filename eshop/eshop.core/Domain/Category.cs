using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace eshop.core.Domain
{
    public class Category: DomainObject
    {
        public virtual string Name { get; set; }
        public virtual Category Parent { get; set; }
    }
}
