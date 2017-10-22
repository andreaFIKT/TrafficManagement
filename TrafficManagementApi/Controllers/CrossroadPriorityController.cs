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
        public ResultCrossroad GetData()
        {
            var conn = ConfigurationManager.ConnectionStrings[ConnectionStringName()].ConnectionString;
            var crossroadPriority = new ResultCrossroad();
            var response = new ResultCrossroad
            {
                Status = ResponseStatus.Success,
            };
            try
            {
                using (var con = new SqlConnection(conn))
                {
                    var command = new SqlCommand("USP_CrossroadPriority_Select", con) { CommandType = CommandType.StoredProcedure };
                    con.Open();
                    var reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        var priority = new ResultCrossroad
                        {
                            Status = ResponseStatus.Success,
                            Id_Priority = Convert.ToInt32(reader["Value_priority"]),
                        };
                        response.Id_Priority = priority.Id_Priority;
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
