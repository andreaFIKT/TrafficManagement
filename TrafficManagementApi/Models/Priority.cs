using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TrafficManagementApi.Models
{
    public class Priority: BaseResponse
    {
        public int Id { get; set; }
        public string Id_Pollution { get; set; }

        public string Id_TrafficCongestion { get; set; }

        public int PriorityValue { get; set; }
    }
}