using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Security.Cryptography;
using System.Security.Principal;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Web.UI;
using eshop.core.Dao;
using eshop.core.Domain;

namespace eshop.Controllers
{
    [HandleError]
    public class AccountController : ControllerSupport
    {
        private IUserDao userDao;

        public IUserDao UserDao
        {
            set { userDao = value;}
        }

        private bool ValidateUser(string userName, string password)
        {
            User user = userDao.FindByName(userName);
            byte[] inputHash = GetHash(password);
            return user != null && core.Utils.Array.Equals(inputHash, user.PasswordHash);
        }

        private byte[] GetHash(string password)
        {
            return HashAlgorithm.Create().ComputeHash(Encoding.Unicode.GetBytes(password));
        }

        public ActionResult LogOn()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult LogOn(string userName, string password, bool rememberMe, string returnUrl)
        {

            if (!ValidateUser(userName, password))
            {
                ModelState.AddModelError("loginFail", "Неверная комбинация логин - пароль");
                return View();
            }

            FormsAuthentication.SetAuthCookie(userName, rememberMe);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                return Redirect(returnUrl);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Home");
        }
    }
}
