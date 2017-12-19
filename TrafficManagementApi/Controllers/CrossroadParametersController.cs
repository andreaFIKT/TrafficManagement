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
        public CrossroadParameters GetData(decimal idCrossroad, int markerValue, decimal latitude, decimal longitude)
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
                    var command = new SqlCommand("USP_CrossroadParameters_Select", con) { CommandType = CommandType.StoredProcedure };
                    command.Parameters.AddWithValue("@Id_crossroad", idCrossroad);
                    command.Parameters.AddWithValue("@Marker_value", markerValue);
                    command.Parameters.AddWithValue("@Latitude", latitude);
                    command.Parameters.AddWithValue("@Longitude", longitude);
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
                            Id_traffic = reader["Id_traffic"].ToString(),
                            Marker_value = Convert.ToInt32(reader["Marker_value"]),
                            Latitude = Convert.ToDecimal(reader["Latitude"]),
                            Longitude = Convert.ToDecimal(reader["Longitude"])
                        };
                        response.Id = crossroad.Id;
                        response.Id_crossroad = crossroad.Id_crossroad;
                        response.Id_pollution = crossroad.Id_pollution;
                        response.Id_traffic = crossroad.Id_traffic;
                        response.Marker_value = crossroad.Marker_value;
                        response.Latitude = crossroad.Latitude;
                        response.Longitude = crossroad.Longitude;
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
