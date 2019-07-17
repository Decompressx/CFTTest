using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using TestTaskCFT.Models;

namespace TestTaskCFT.Controllers
{
    public class RequestsController : Controller
    {
        ModelContext db = new ModelContext();

        public ActionResult Index()
        {
            return View(db.Requests.Include(app=>app.Application).ToList());
        }

        public ActionResult Create()
        {
            ViewBag.ApplicationId = new SelectList(db.Applications, "Id", "AppName");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,RequestName,EndTime,DescriptionRequest,Email,ApplicationId")] Request request)
        {
            if (ModelState.IsValid)
            {
                db.Requests.Add(request);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ApplicationId = new SelectList(db.Applications, "Id", "AppName", request.ApplicationId);
            return View(request);
        }

        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Request request = db.Requests.Find(id);
            if (request == null)
            {
                return HttpNotFound();
            }
            ViewBag.ApplicationId = new SelectList(db.Applications, "Id", "AppName", request.ApplicationId);
            return View(request);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,RequestName,EndTime,DescriptionRequest,Email,ApplicationId")] Request request)
        {
            if (ModelState.IsValid)
            {
                db.Entry(request).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ApplicationId = new SelectList(db.Applications, "Id", "AppName", request.ApplicationId);
            return View(request);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }

    }
}