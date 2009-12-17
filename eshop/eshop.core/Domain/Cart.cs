using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace eshop.core.Domain
{
    public class Cart
    {
        [Required][StringLength(150, MinimumLength = 5)]
        public string Na11me { get; set; }

        private List<OrderLine> lines = new List<OrderLine>();
        public IList<OrderLine> Lines { get { return lines; } }
        private ShippingDetails shippingDetails = new ShippingDetails();
        public ShippingDetails ShippingDetails
        {
            get { return shippingDetails; }
            set { shippingDetails = value; }
        }

        public void AddItem(Commodity commodity, int quantity)
        {
            // FirstOrDefault() is a LINQ extension method on IEnumerable
            var line = lines
                .FirstOrDefault(l => l.Name == commodity.Name);
            if (line == null)
                lines.Add(new OrderLine { Name = commodity.Name, Price = commodity.Price, Quantity = quantity });
            else
                line.Quantity += quantity;
        }
        public decimal ComputeTotalValue()
        {
            // Sum() is a LINQ extension method on IEnumerable
            return lines.Sum(l => l.Price * l.Quantity);
        }
        public void Clear()
        {
            lines.Clear();
        }

        public void RemoveLine(Commodity commodity)
        {
            lines.RemoveAll(l => l.Name == commodity.Name);
        }
    }

}
