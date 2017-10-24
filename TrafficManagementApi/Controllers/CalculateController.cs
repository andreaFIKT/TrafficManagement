using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using TrafficManagementApi.Models;
using System.Data;

namespace TrafficManagementApi.Controllers
{
    public class CalculateController : BaseController
    {

        [HttpGet]

        public Route calculateRoute(decimal idStart, decimal idEnd)
        {
            Route insert = new Route();
            insert.Id_Start = idStart;
            insert.Id_End = idEnd;
            //controller instance
            RouteController routeInstance = new RouteController();
            RouteCrossroadsController routeCrossroadInstance = new RouteCrossroadsController();
            CrossroadParametersController crossroadParametersInstance = new CrossroadParametersController();
            CrossroadPriorityController crossroadPriorityInstance = new CrossroadPriorityController();
            ResultCrossroadController resultCrossroadInstance = new ResultCrossroadController();
            ResultRouteController resultRouteInstance = new ResultRouteController();
            //result route lists
            List<Route> calculatedRoute = new List<Route>();          
            List<ResultRoute> allRoutesPriorities = new List<ResultRoute>();
            calculatedRoute = routeInstance.GetRoute(insert);
            foreach (Route ruta in calculatedRoute)
            {
                //result crossroad lists
                List<RouteCrossroad> routeCrossroadList = new List<RouteCrossroad>();
                List<int> routePriorityList = new List<int>();
                routeCrossroadList = routeCrossroadInstance.GetData(ruta);                
                foreach (var item in routeCrossroadList)
                {
                    var parameters = crossroadParametersInstance.GetData(item.Id_Crossroad);
                    var priority = crossroadPriorityInstance.GetData(parameters.Id_traffic, parameters.Id_pollution);
                    routePriorityList.Add(priority.PriorityValue);
                    ResultCrossroad res = new ResultCrossroad();
                    res.Id_Crossroad = item.Id_Crossroad;
                    res.Id_Priority = priority.Id;
                    res.Date = DateTime.Now;
                    resultCrossroadInstance.AddResult(res);
                }
                var sum = 0;
                foreach (var item in routePriorityList)
                {
                    sum = sum + item;
                }
                ResultRoute resRoute = new ResultRoute();
                resRoute.Id_Route = ruta.Id;
                resRoute.Route_Priority = sum;
                resRoute.Date = DateTime.Now;
                resultRouteInstance.AddResult(resRoute);
                allRoutesPriorities.Add(resRoute);
            }
            allRoutesPriorities.OrderBy(o => o.Route_Priority);
            var route = allRoutesPriorities.ElementAt(0);
            Route bestRoute = new Route();
            bestRoute = routeInstance.GetRouteById(route.Id_Route);
          
            return bestRoute;
        }

    }
}
