using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using TestTaskCFT.Models;

namespace TestTaskCFT.Controllers
{
    public class RequestsController : Controller
    {
        RequestsDBEntities db = new RequestsDBEntities();

        public ActionResult Index()
        {
            return View(db.Requests.ToList());
        }

        public ActionResult Create()
        {
            ViewBag.IdApp = new SelectList(db.Applications, "Id", "AppName");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,RequestName,EndTime,DescriptionRequest,Email,IdApp")] Request request)
        {
            if (ModelState.IsValid)
            {
                db.Requests.Add(request);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdApp = new SelectList(db.Applications, "Id", "AppName", request.IdApp);
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
            ViewBag.IdApp = new SelectList(db.Applications, "Id", "AppName", request.IdApp);
            return View(request);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,RequestName,EndTime,DescriptionRequest,Email,IdApp")] Request request)
        {
            if (ModelState.IsValid)
            {
                db.Entry(request).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdApp = new SelectList(db.Applications, "Id", "AppName", request.IdApp);
            return View(request);
        }

    }
}