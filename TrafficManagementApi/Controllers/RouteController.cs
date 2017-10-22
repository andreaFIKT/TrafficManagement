using System;
using System.Web.Http;
using TrafficManagementApi.Models;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;

namespace TrafficManagementApi.Controllers
{
    public class RouteController : BaseController
    {
        [HttpGet]
        public List<Route> GetRoutes()
        {
            var conn = ConfigurationManager.ConnectionStrings[ConnectionStringName()].ConnectionString;
            var routeList = new List<Route>();
            var response = new Route
            {
                Status = ResponseStatus.Success,
            };
            try
            {
                using (var con = new SqlConnection(conn))
                {
                    var command = new SqlCommand("USP_Route_SelectAll", con) { CommandType = CommandType.StoredProcedure };
                    con.Open();
                    var reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        var route = new Route
                        {
                            Status = ResponseStatus.Success,
                            Id = Convert.ToInt32(reader["Id"]),
                            Name = reader["Name_route"].ToString(),
                            Id_Start =Convert.ToDecimal(reader["Id_start"]),
                            Id_End = Convert.ToDecimal(reader["Id_end"])
                        };
                        response.Id = route.Id;
                        response.Name = route.Name;
                        response.Id_Start = route.Id_Start;
                        response.Id_End = route.Id_End;
                        routeList.Add(route);
                    }
                    con.Close();
                }
                return routeList;
            }
            catch (Exception ex)
            {
                response.Status = ResponseStatus.Error;
                response.Message = "RequestFailed";
                routeList.Add(response);
                return routeList;
            }
        }

        [HttpGet]
        public Route GetRoute()
        {
            var conn = ConfigurationManager.ConnectionStrings[ConnectionStringName()].ConnectionString;
            var routeList = new List<Route>();
            var response = new Route
            {
                Status = ResponseStatus.Success,
            };
            try
            {
                using (var con = new SqlConnection(conn))
                {
                    var command = new SqlCommand("USP_Route_Select", con) { CommandType = CommandType.StoredProcedure };
                    con.Open();
                    var reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        var route = new Route
                        {
                            Status = ResponseStatus.Success,
                            Id = Convert.ToInt32(reader["Id"]),
                            Name = reader["Name_route"].ToString(),
                            Id_Start = Convert.ToDecimal(reader["Id_start"]),
                            Id_End = Convert.ToDecimal(reader["Id_end"])
                        };
                        response.Id = route.Id;
                        response.Name = route.Name;
                        response.Id_Start = route.Id_Start;
                        response.Id_End = route.Id_End;
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
        } //USP_Route_SelectAllEnds

        [HttpGet]
        public List<Route> GetEnds()
        {
            var conn = ConfigurationManager.ConnectionStrings[ConnectionStringName()].ConnectionString;
            var endsList = new List<Route>();
            var response = new Route
            {
                Status = ResponseStatus.Success,
            };
            try
            {
                using (var con = new SqlConnection(conn))
                {
                    var command = new SqlCommand("USP_Route_SelectAllEnds", con) { CommandType = CommandType.StoredProcedure };
                    con.Open();
                    var reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        var route = new Route
                        {
                            Status = ResponseStatus.Success,
                            Id_End = Convert.ToDecimal(reader["Id_end"])
                        };
                        response.Id_End = route.Id_End;
                        endsList.Add(response);
                    }
                    con.Close();
                }
                return endsList;
            }
            catch (Exception ex)
            {
                response.Status = ResponseStatus.Error;
                response.Message = "RequestFailed";
                endsList.Add(response);
                return endsList;
            }
        }

        [HttpGet]
        public List<Route> GetStarts()
        {
            var conn = ConfigurationManager.ConnectionStrings[ConnectionStringName()].ConnectionString;
            var startsList = new List<Route>();
            var response = new Route
            {
                Status = ResponseStatus.Success,
            };
            try
            {
                using (var con = new SqlConnection(conn))
                {
                    var command = new SqlCommand("USP_Route_SelectAllStarts", con) { CommandType = CommandType.StoredProcedure };
                    con.Open();
                    var reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        var route = new Route
                        {
                            Status = ResponseStatus.Success,
                            Id_Start = Convert.ToDecimal(reader["Id_start"])
                        };
                        response.Id_Start = route.Id_Start;
                        startsList.Add(response);
                    }
                    con.Close();
                }
                return startsList;
            }
            catch (Exception ex)
            {
                response.Status = ResponseStatus.Error;
                response.Message = "RequestFailed";
                startsList.Add(response);
                return startsList;
            }
        }

    }
}
