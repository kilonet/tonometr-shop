using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace eshop.core.Domain
{
    public class Commodity: DomainObject
    {
        public virtual string Name { get; set; }
        public virtual decimal Price { get; set; }
        public virtual Category Category { get; set; }
        public virtual bool Deleted { get; set; }
        public virtual string Description { get; set; }
        public virtual string ShortDescription { get; set; }
        public virtual string PictureFileName { get; set; }
        public virtual string SmallPictureFileName { get; set; }
    }
}
