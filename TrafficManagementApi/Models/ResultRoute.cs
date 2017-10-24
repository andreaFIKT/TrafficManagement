using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TrafficManagementApi.Models
{
    public class ResultRoute: BaseResponse
    {
        public int Id { get; set; }
        public int Id_Route { get; set; }
        public int Route_Priority { get; set; }
        public DateTime Date { get; set; }
    }
}