using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace TestTaskCFT.Models
{
    public class Request
    {
        [ScaffoldColumn(false)]
        public int Id { get; set; }

        [Display(Name = "Название заявки")]
        public string RequestName { get; set; }

        [Display(Name = "Дата окончания разработки")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd.MM.yyyy}")]
        [DataType(DataType.Date)]
        public System.DateTime EndTime { get; set; }

        [Display(Name = "Описание заявки")]
        public string DescriptionRequest { get; set; }

        [Display(Name = "Email")]
        [Required(ErrorMessage = "The email address is required")]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        public string Email { get; set; }
        public int? ApplicationId { get; set; }
        public Application Application { get; set; }
    }
}