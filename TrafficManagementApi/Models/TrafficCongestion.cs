using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TrafficManagementApi.Models
{
    public class TrafficCongestion
    {
        public string Id { get; set; }

        public string Description { get; set; }

        public float Minimum { get; set; }

        public float Maximum { get; set; }
    }
}