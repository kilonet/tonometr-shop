using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace eshop.core.Utils
{
    public static class Array
    {
        public static bool Equals(byte[] a, byte[] b)
        {
            if (a == b) // Also expression as 'a == null && b == null' is True
                return true;

            if (a == null)
                return false;

            if (b == null)
                return false;

            if (a.Length != b.Length)
                return false;


            for (int i = 0; i < a.Length; i++)
            {
                if (a[i] != b[i])
                    return false;
            }

            return true;
        }
    }
}
