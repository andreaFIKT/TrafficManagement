using System;
using System.Collections.Generic;
using System.Web.Http;
using TrafficManagementApi.Models;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace TrafficManagementApi.Controllers
{
    public class ResultRouteController : BaseController
    {
        [HttpPost]
        public ResultRoute AddResult (ResultRoute response)
        {
            var conn = ConfigurationManager.ConnectionStrings[ConnectionStringName()].ConnectionString;
            try
            {
                using (var con = new SqlConnection(conn))
                {
                    var command = new SqlCommand("USP_ResultRoute_Insert", con) { CommandType = CommandType.StoredProcedure };
                    command.Parameters.AddWithValue("@Id_route", response.Id_Route);
                    command.Parameters.AddWithValue("@Route_priority", response.Route_Priority);
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
                response.Message = ex.Data.ToString();
                return response;
            }
        }
    }
}
