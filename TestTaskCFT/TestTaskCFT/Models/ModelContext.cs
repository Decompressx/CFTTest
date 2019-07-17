using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;

namespace TestTaskCFT.Models
{
    public class ModelContext : DbContext
    {
        public ModelContext() : base("name=ModelContext")
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
        }

        public virtual DbSet<Application> Applications { get; set; }
        public virtual DbSet<Request> Requests { get; set; }
    }
}