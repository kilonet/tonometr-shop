using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using eshop.core.Domain.Validators;

namespace eshop.core.Domain
{
    partial class Commodity
    {
        public virtual bool IsValid
        {
            get { return (GetRuleViolations().Count() == 0); }
        }

        public virtual IEnumerable<RuleViolation> GetRuleViolations()
        {
            if (string.IsNullOrEmpty(Name))
                yield return new RuleViolation("Введите название", "CommodityForm.Name");
            yield break;
        }
    }
}