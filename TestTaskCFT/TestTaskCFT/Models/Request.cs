namespace TestTaskCFT.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Request
    {
        [ScaffoldColumn(false)]
        public int Id { get; set; }

        [Display(Name = "Название заявки")]
        public string RequestName { get; set; }

        [Display(Name = "Дата окончания разработки")]
        [DataType(DataType.Date)]
        public System.DateTime EndTime { get; set; }

        [Display(Name = "Описание заявки")]
        public string DescriptionRequest { get; set; }

        [Display(Name = "Email")]
        [Required(ErrorMessage = "The email address is required")]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        public string Email { get; set; }
        public Nullable<int> IdApp { get; set; }
    
        public virtual Application Application { get; set; }
    }
}
