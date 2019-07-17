using System.Linq;
using System.Web.Mvc;
using TestTaskCFT.Models;

namespace TestTaskCFT.Controllers
{
    public class AppsController : Controller
    {
        ModelContext db = new ModelContext();
        public ActionResult Index()
        {
            return View(db.Applications.ToList());
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,AppName,DescriptionApp,Precedency")] Application application)
        {
            if (ModelState.IsValid)
            {
                db.Applications.Add(application);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(application);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}