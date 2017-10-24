using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TrafficManagementApi.Models
{
    public class Crossroad: BaseResponse 
    {
        public decimal Id { get; set; }
        public String Name { get; set; }
    }
}