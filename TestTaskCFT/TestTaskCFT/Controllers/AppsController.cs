using System.Linq;
using System.Web.Mvc;
using TestTaskCFT.Models;

namespace TestTaskCFT.Controllers
{
    public class AppsController : Controller
    {
        RequestsDBEntities db = new RequestsDBEntities();
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
    }
}