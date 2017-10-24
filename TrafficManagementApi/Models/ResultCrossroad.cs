using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TrafficManagementApi.Models
{
    public class ResultCrossroad: BaseResponse
    {
        public int Id { get; set; }
        public decimal Id_Crossroad { get; set; }
        public int Id_Priority { get; set; }
        public DateTime Date { get; set; }

    }
}