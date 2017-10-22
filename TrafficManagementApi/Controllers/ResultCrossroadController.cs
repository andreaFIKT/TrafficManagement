using System;
using System.Collections.Generic;
using System.Web.Http;
using TrafficManagementApi.Models;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace TrafficManagementApi.Controllers
{
    public class ResultCrossroadController : BaseController
    {
        [HttpPost]
        public ResultCrossroad AddResult (ResultCrossroad response)
        {
            var conn = ConfigurationManager.ConnectionStrings[ConnectionStringName()].ConnectionString;
            try
            {
                using (var con = new SqlConnection(conn))
                {
                    var command = new SqlCommand("USP_ResultCrossroad_Insert", con) { CommandType = CommandType.StoredProcedure };
                    command.Parameters.AddWithValue("@Id_crossroad", response.Id_Crossroad);
                    command.Parameters.AddWithValue("@Id_priority", response.Id_Priority);
                    command.Parameters.AddWithValue("@Date", response.Date);
                    con.Open();
                    command.ExecuteNonQuery();
                    con.Close();
                    return response;
                }
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
