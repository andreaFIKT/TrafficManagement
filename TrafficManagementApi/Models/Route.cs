using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TrafficManagementApi.Models
{
    public class Route: BaseResponse
    {
        public int Id { get; set; }
        public String Name{ get; set; }
        public decimal Id_Start { get; set; }
        public decimal Id_End { get; set; }
    }
}