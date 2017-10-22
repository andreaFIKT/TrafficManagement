using System;
using System.Collections.Generic;
using System.Web.Http;
using TrafficManagementApi.Models;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace TrafficManagementApi.Controllers
{
    public class CrossroadController : BaseController
    {
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
