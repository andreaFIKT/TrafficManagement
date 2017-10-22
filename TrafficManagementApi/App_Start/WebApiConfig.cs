using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace TrafficManagementApi
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "Calculate",
                routeTemplate: "api/{controller}/{action}/{idStart}/{idEnd}",
                defaults: new { idStart = RouteParameter.Optional,
                idEnd = RouteParameter.Optional}
            );

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{action}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
    }
}
