using System;
using System.Net;
using System.Web;
using NLog;

namespace HoneyPot419
{
    public partial class _Default : System.Web.UI.Page
    {
        private static Logger _log = NLog.LogManager.GetCurrentClassLogger();

        protected void Page_Load(object sender, EventArgs e)
        {
            _log.Info("HTTP_X_FORWARDED_FOR : {0}", HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"]);

            try
            {
                string clientIp;
                if (String.IsNullOrEmpty(HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"]))
                {
                    clientIp = HttpContext.Current.Request.UserHostAddress;
                }
                else
                {
                    clientIp = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                }

                _log.Info("REVERSE DNS : {0}", Dns.GetHostEntry(clientIp).HostName);
            }
            catch (Exception ex)
            {
                _log.ErrorException("error during reverse dns resolution", ex);
            }

            _log.Info("HTTP_USER_AGENT : {0}", HttpContext.Current.Request.ServerVariables["HTTP_USER_AGENT"]);
            _log.Info("UrlReferrer : {0}",HttpContext.Current.Request.UrlReferrer);
        }
    }
}
