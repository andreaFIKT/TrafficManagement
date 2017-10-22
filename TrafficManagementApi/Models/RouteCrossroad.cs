using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TrafficManagementApi.Models
{
    public class RouteCrossroad: BaseResponse
    {
        public int Id { get; set; }

        public int Id_Route { get; set; }

        public float Id_Crossroad { get; set; }

        public string Crossroad_Order { get; set; }
    }
}