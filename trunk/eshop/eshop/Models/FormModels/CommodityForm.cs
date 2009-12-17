using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using eshop.core.Domain;
using eshop.FormModels;

namespace eshop.Models.FormModels
{
    class CommodityForm: AbstractFormModel
    {
        public string Name { get; set; }
        public decimal Price { get; set; }
        public bool Deleted { get; set; }
        public string Description { get; set; }
        public string ShortDescription { get; set; }
        public long CategoryId { get; set; }
        public virtual string PictureFileName { get; set; }
        public virtual string SmallPictureFileName { get; set; }

        private static CommodityForm valueOf(Commodity commodity)
        {
            return new CommodityForm
                       {
                           CategoryId = commodity.Category.Id,
                           Deleted = commodity.Deleted,
                           Description = commodity.Description,
                           Id = commodity.Id,
                           Name = commodity.Name,
                           Price = commodity.Price,
                           ShortDescription = commodity.ShortDescription,
                           PictureFileName = commodity.PictureFileName,
                           SmallPictureFileName = commodity.SmallPictureFileName
                       };
        }
    }
}