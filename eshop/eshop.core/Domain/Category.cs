using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace eshop.core.Domain
{
    public partial class Category: DomainObject
    {
        private List<Category> subCategories = new List<Category>();
        
        [Required(ErrorMessage = "Введите название категории")]
        [StringLength(50, ErrorMessage = "Поле Название должно содержать не более 50 символов")]
        public virtual string Name { get; set; }
        public virtual Category Parent { get; set; }

        public virtual void Update(Category categoryDto)
        {
            Name = categoryDto.Name;
            Parent = categoryDto.Parent;
        }

        public virtual List<Category> SubCategories
        {
            get { return subCategories; }
            set { subCategories = value; }
        }

        public override string ToString()
        {
            return Name;
        }
    }
}
