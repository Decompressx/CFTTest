namespace TestTaskCFT.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Application
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Application()
        {
            this.Requests = new HashSet<Request>();
        }

        [ScaffoldColumn(false)]
        public int Id { get; set; }

        [Display(Name = "Название приложения")]
        public string AppName { get; set; }

        [Display(Name = "Описание приложения")]
        public string DescriptionApp { get; set; }

        [Display(Name = "Приоритет")]
        public int Precedency { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Request> Requests { get; set; }
    }
}
