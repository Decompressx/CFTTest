using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace TestTaskCFT.Models
{
    public class Application
    {
        public Application()
        {
            Requests = new List<Request>();
        }

        [ScaffoldColumn(false)]
        public int Id { get; set; }

        [Display(Name = "Название приложения")]
        public string AppName { get; set; }

        [Display(Name = "Описание приложения")]
        public string DescriptionApp { get; set; }

        [Display(Name = "Приоритет")]
        public int Precedency { get; set; }

        public virtual ICollection<Request> Requests { get; set; }
    }
}