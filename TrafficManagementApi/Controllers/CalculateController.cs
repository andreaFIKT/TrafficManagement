using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using TrafficManagementApi.Models;
using TrafficManagementApi.Controllers;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace TrafficManagementApi.Controllers
{
    public class CalculateController : BaseController
    { 
        
        [HttpGet]
        [Route ("api/calculate/calculateRoute/{idStart}/{idEnd}")]
        public Route calculateRoute(decimal idStart, decimal idEnd)
        {
            RouteController routeInstance = new RouteController();
            RouteCrossroadsController routeCrossroadInstance = new RouteCrossroadsController();
            CrossroadParametersController crossroadParametersInstance = new CrossroadParametersController();
            CrossroadPriorityController crossroadPriorityInstance = new CrossroadPriorityController();
            ResultCrossroadController resultCrossroadInstance = new ResultCrossroadController();
            ResultRouteController resultRouteInstance = new ResultRouteController();
            Route insert = new Route();
            insert.Id_Start = idStart;
            insert.Id_End = idEnd;
            List<Route> calculatedRoute = new List<Route>();
            calculatedRoute = routeInstance.GetRoute(insert);
            List<RouteCrossroad> routeCrossroadList = new List<RouteCrossroad>();
            List<ResultRoute> allRoutesPriorities = new List<ResultRoute>();
            foreach(Route ruta in calculatedRoute)
            {
                routeCrossroadList = routeCrossroadInstance.GetData(ruta);
                List<int> routePriorityList = new List<int>();
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

        [HttpGet]
        public List<Crossroad> GetData()
        {
            var conn = ConfigurationManager.ConnectionStrings[ConnectionStringName()].ConnectionString;
            var crossroadList = new List<Crossroad>();
            var response = new Crossroad
            {
                Status = ResponseStatus.Success,
            };

            try
            {
                using (var con = new SqlConnection(conn))
                {
                    var command = new SqlCommand("USP_Crossroad_SelectAll", con) { CommandType = CommandType.StoredProcedure };
                    con.Open();
                    var reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        var crossroad = new Crossroad
                        {
                            Status = ResponseStatus.Success,
                            Id = Convert.ToDecimal(reader["Id"]),
                            Name = reader["Name_crossroad"].ToString(),
                        };
                        response.Id = crossroad.Id;
                        response.Name = crossroad.Name;
                        crossroadList.Add(crossroad);
                    }
                    con.Close();
                }
                return crossroadList;
            }
            catch (Exception ex)
            {
                response.Status = ResponseStatus.Error;
                response.Message = "RequestFailed";
                crossroadList.Add(response);
                return crossroadList;
            }
        }

    }
}
