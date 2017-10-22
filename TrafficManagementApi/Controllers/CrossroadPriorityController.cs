using System;
using System.Web.Http;
using TrafficManagementApi.Models;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;

namespace TrafficManagementApi.Controllers
{
    public class CrossroadPriorityController : BaseController
    {
        [HttpGet]
        public Priority GetData(String idTraffic, String idPollution)
        {
            var conn = ConfigurationManager.ConnectionStrings[ConnectionStringName()].ConnectionString;
            var crossroadPriority = new Priority();
            var response = new Priority
            {
                Status = ResponseStatus.Success,
            };
            try
            {
                using (var con = new SqlConnection(conn))
                {
                    var command = new SqlCommand("USP_CrossroadPriority_Select", con) { CommandType = CommandType.StoredProcedure };
                    command.Parameters.AddWithValue("@Id_traffic", idTraffic);
                    command.Parameters.AddWithValue("@Id_pollution", idPollution);
                    con.Open();
                    var reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        var priority = new Priority
                        {
                            Status = ResponseStatus.Success,
                            Id = Convert.ToInt32(reader["Id"]),
                            Id_Pollution = reader["Id_pollution"].ToString(),
                            Id_TrafficCongestion = reader["Id_traffic"].ToString(),
                            PriorityValue = Convert.ToInt32(reader["Value_priority"])
                        };
                        response.Id = priority.Id;
                        response.Id_Pollution = priority.Id_Pollution;
                        response.Id_TrafficCongestion = priority.Id_TrafficCongestion;
                        response.PriorityValue = priority.PriorityValue;

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
