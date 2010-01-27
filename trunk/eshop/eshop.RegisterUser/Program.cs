using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using eshop.core.Dao;
using eshop.core.Domain;
using NHibernate;
using NHibernate.Cfg;

namespace eshop.RegisterUser
{
    class Program
    {
        static void Main(string[] args)
        {
            if (args.Length != 2) return;
            using (ISession session = new Configuration().Configure().BuildSessionFactory().OpenSession())
            {
                string userName = args[0];
                IQuery query = session.CreateQuery("from User u where u.Login = :name");
                query.SetString("name", userName);
                User user = query.UniqueResult<User>();
                user.PasswordHash = GetHash(args[1]);
                session.Save(user);
                session.Flush();
            }
        }

        private static byte[] GetHash(string password)
        {
            return HashAlgorithm.Create().ComputeHash(Encoding.Unicode.GetBytes(password));
        }
    }
}
