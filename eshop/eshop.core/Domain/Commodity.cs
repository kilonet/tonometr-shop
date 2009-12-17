using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace eshop.core.Domain
{
    public partial class Commodity: DomainObject
    {
        [Required(ErrorMessage = "Введите название товара")]
        [StringLength(100, ErrorMessage = "Поле Название должно содержать не более 50 символов")]
        public virtual string Name { get; set; }

        [Required(ErrorMessage = "Введите цену товара")]
        public virtual decimal Price { get; set; }

        public virtual Category Category { get; set; }
        public virtual bool Deleted { get; set; }

        [Required(ErrorMessage = "Введите полное описание товара")]
        [StringLength(2000, ErrorMessage = "Поле Описание должно содержать не более 2000 символов")]
        public virtual string Description { get; set; }

        [Required(ErrorMessage = "Введите краткое описание товара")]
        [StringLength(50, ErrorMessage = "Поле Краткое Описание должно содержать не более 50 символов")]
        public virtual string ShortDescription { get; set; }

        public virtual string PictureFileName { get; set; }
        public virtual string SmallPictureFileName { get; set; }
        
        public virtual void update(Commodity commodityDto)
        {
            Name = commodityDto.Name;
            Price = commodityDto.Price;
            Category = commodityDto.Category;
            Deleted = commodityDto.Deleted;
            Description = commodityDto.Description;
            ShortDescription = commodityDto.ShortDescription;
        }
    }
}