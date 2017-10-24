﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TrafficManagementApi.Models
{
    public class CrossroadParameters: BaseResponse
    {
        public int Id { get; set; }
        public decimal Id_crossroad { get; set; }
        public String Id_pollution { get; set; }
        public String Id_traffic { get; set; }
    }
}