using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace eshop.core.Domain
{
    public abstract class DomainObject
    {
        public virtual long Id { get; set; }
    }
}
