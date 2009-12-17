using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using eshop.core.Domain.Validators;

namespace eshop.core.Domain
{
    partial class Category
    {
        public virtual bool IsValid
        {
            get { return (GetRuleViolations().Count() == 0); }
        }

        public virtual IEnumerable<RuleViolation> GetRuleViolations()
        {
            if (string.IsNullOrEmpty(Name))
                yield return new RuleViolation("Введите название", "Category.Name");
            if (!string.IsNullOrEmpty(Name) && (Name.Length > 255 || Name.Length < 4))
                yield return new RuleViolation("Название должно содержать от 4 до 255 символов", "Category.Name");
            
            yield break;
        }
	}
}
