using System;
using System.Collections.Generic;
using System.Web.Http;
using TrafficManagementApi.Models;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace TrafficManagementApi.Controllers
{
    public class CrossroadParametersController : BaseController
    {
        [HttpGet]
        public CrossroadParameters GetData()
        {
            var conn = ConfigurationManager.ConnectionStrings[ConnectionStringName()].ConnectionString;
            var response = new CrossroadParameters
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
                        var crossroad = new CrossroadParameters
                        {
                            Status = ResponseStatus.Success,
                            Id = Convert.ToInt32(reader["Id"]),
                            Id_crossroad = Convert.ToDecimal(reader["Id_crossroad"]),
                            Id_pollution = reader["Id_polultion"].ToString(),
                            Id_traffic = reader["Id_traffic"].ToString()
                        };
                        response.Id = crossroad.Id;
                        response.Id_crossroad = crossroad.Id_crossroad;
                        response.Id_pollution = crossroad.Id_pollution;
                        response.Id_traffic = crossroad.Id_traffic;
                    }
                    con.Close();
                }
                return response;
            }
            catch (Exception ex)
            {
                response.Status = ResponseStatus.Error;
                response.Message = "RequestFailed";
                return response;
            }
        }
    }
}
