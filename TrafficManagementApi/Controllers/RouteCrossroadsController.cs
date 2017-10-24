using System;
using System.Collections.Generic;
using System.Web.Mvc;
using TrafficManagementApi.Models;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace TrafficManagementApi.Controllers
{
    public class RouteCrossroadsController : BaseController
    {
        [HttpGet]
        public List<RouteCrossroad> GetData(Route route)
        {
            List<RouteCrossroad> routeCrossroadList = new List<RouteCrossroad>();
            var conn = ConfigurationManager.ConnectionStrings[ConnectionStringName()].ConnectionString;
            var response = new RouteCrossroad
            {
                Status = ResponseStatus.Success,
            };
            try
            {
                using (var con = new SqlConnection(conn))
                {
                    var command = new SqlCommand("USP_RouteCrosroads_Select", con) { CommandType = CommandType.StoredProcedure };
                    command.Parameters.AddWithValue("@Id_route", route.Id);
                    con.Open();
                   
                    var reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        var routeCrossroad = new RouteCrossroad
                        {
                            Status = ResponseStatus.Success,
                            Id_Crossroad = Convert.ToDecimal(reader["Id_crossroad"]),
                            Id_Route = Convert.ToInt32(reader["Id_route"]),
                            Crossroad_Order = Convert.ToInt32(reader["Crossroad_order"])

                        };
                        response.Id_Crossroad = routeCrossroad.Id_Crossroad;
                        response.Id_Route = routeCrossroad.Id_Route;
                        response.Crossroad_Order = routeCrossroad.Crossroad_Order;
                        routeCrossroadList.Add(routeCrossroad);
                    }
                    con.Close();
                }
                return routeCrossroadList;
            }
            catch (Exception ex)
            {
                response.Status = ResponseStatus.Error;
                response.Message = "RequestFailed";
                routeCrossroadList.Add(response);
                return routeCrossroadList;
            }
        }
    }

}
