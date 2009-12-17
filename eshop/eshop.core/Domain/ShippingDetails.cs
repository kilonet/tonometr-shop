using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace eshop.core.Domain
{
    public class ShippingDetails
    {
        private string name;
        private string phone;
        private string city;
        private string address;
        private string comment;

        [Required(ErrorMessage = "Введите имя")]
        [StringLength(60, ErrorMessage = "Поле Имя должно содержать не более 60 символов")]
        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        [Required(ErrorMessage = "Введите контактный телефон")]
        [StringLength(60, ErrorMessage = "Поле Телефон должно содержать не более 60 символов")]
        public virtual string Phone
        {
            get { return phone; }
            set { phone = value; }
        }

        [Required(ErrorMessage = "Введите город")]
        [StringLength(60, ErrorMessage = "Поле Город должно содержать не более 60 символов")]
        public virtual string City
        {
            get { return city; }
            set { city = value; }
        }

        [Required(ErrorMessage = "Введите адрес доставки")]
        [StringLength(250, ErrorMessage = "Поле Адрес должно содержать не более 250 символов")]
        public virtual string Address
        {
            get { return address; }
            set { address = value; }
        }


        [StringLength(500, ErrorMessage = "Поле Комментарий должно содержать не более 500 символов")]
        public virtual string Comment
        {
            get { return comment; }
            set { comment = value; }
        }
    }
}
