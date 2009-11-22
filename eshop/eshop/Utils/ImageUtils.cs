using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;

namespace eshop.Utils
{
    public class ImageUtils
    {
        private const int THUMB_SIZE = 200;
        

        public static Image ResizeImage(string imageFileToResize)
        {
            Size size = Size.Empty;
            Image imgToResize = Image.FromFile(imageFileToResize);
            float scaleFactor = (float)Math.Max(imgToResize.Width, imgToResize.Height) / THUMB_SIZE;
            size.Height = (int)(imgToResize.Height / scaleFactor);
            size.Width = (int)(imgToResize.Width / scaleFactor);
//            if (imgToResize.Height > imgToResize.Width)
//            {
//                size.Height = THUMB_HEIGHT;
//                size.Width = (int)(imgToResize.Width / ((float)imgToResize.Height / THUMB_HEIGHT));
//            } 
//            else
//            {
//                size.Width = THUMB_WIDTH;
//                size.Height = (int)(imgToResize.Height / ((float)imgToResize.Width / THUMB_WIDTH));
//            }
            //int sourceWidth = imgToResize.Width;
            //int sourceHeight = imgToResize.Height;

            //float nPercent;

            //float nPercentW = size.Width / (float)sourceWidth;
            //float nPercentH = size.Height / (float)sourceHeight;

            //if (nPercentH < nPercentW)
            //    nPercent = nPercentH;
            //else
            //    nPercent = nPercentW;

            int destWidth = size.Width;//(int)(sourceWidth * nPercent);
            int destHeight = size.Height;// (int)(sourceHeight * nPercent);

            Bitmap b = new Bitmap(destWidth, destHeight);
            Graphics g = Graphics.FromImage(b);
            g.InterpolationMode = InterpolationMode.HighQualityBicubic;

            g.DrawImage(imgToResize, 0, 0, destWidth, destHeight);
            g.Dispose();

            return b;
        }

        public static void SaveImageToFile(Image image, string path)
        {
            // Encoder parameter for image quality
            EncoderParameter qualityParam = new EncoderParameter(Encoder.Quality, 100L);

            // Jpeg image codec
            ImageCodecInfo jpegCodec = getEncoderInfo("image/jpeg");

            if (jpegCodec == null)
                return;

            EncoderParameters encoderParams = new EncoderParameters(1);
            encoderParams.Param[0] = qualityParam;

            image.Save(path, jpegCodec, encoderParams);
        }

        private static ImageCodecInfo getEncoderInfo(string mimeType)
        {
            // Get image codecs for all image formats
            ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();

            // Find the correct image codec
            for (int i = 0; i < codecs.Length; i++)
                if (codecs[i].MimeType == mimeType)
                    return codecs[i];
            return null;
        }
    }
}
