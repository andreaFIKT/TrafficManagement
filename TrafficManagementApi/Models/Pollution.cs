using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TrafficManagementApi.Models
{
    public class Pollution: BaseResponse
    {
        public String Id { get; set; }
        public String Description { get; set; }
        public decimal Minimum { get; set; }
        public decimal Maximum { get; set; }
    }
}