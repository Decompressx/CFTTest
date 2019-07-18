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
        [Required(ErrorMessage = "Поле должо быть установлено")]
        public string RequestName { get; set; }

        [Display(Name = "Дата окончания разработки")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd.MM.yyyy}")]
        [DataType(DataType.Date)]
        [Required(ErrorMessage = "Поле должо быть установлено")]
        public System.DateTime EndTime { get; set; }

        [Display(Name = "Описание заявки")]
        [Required]
        public string DescriptionRequest { get; set; }

        [Display(Name = "Email")]
        [Required(ErrorMessage = "Поле должо быть установлено")]
        [EmailAddress(ErrorMessage = "Неверный адресс")]
        public string Email { get; set; }
        public int? ApplicationId { get; set; }
        public Application Application { get; set; }
    }
}