using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Iesi.Collections.Generic;

namespace eshop.core.Domain
{
    public class User: DomainObject
    {
        public virtual string Login { get; set; }
        public virtual byte[] PasswordHash { get; set; }
        public virtual string Email { get; set; }
        public virtual string Address { get; set; }
        public virtual string City { get; set; }
        public virtual string FirstName { get; set; }
        public virtual string LastName { get; set; }
        public virtual string MiddleName { get; set; }
        public virtual string Phone { get; set; }
        public virtual ISet<Order> Orders { get; set; }
    }
}
