using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CSWLibrary;

namespace CSWLibrary.Controllers
{
    public class BooksController : Controller
    {
        private LibraryEntities db = new LibraryEntities();

        // GET: Books
        public async Task<ActionResult> Index()
        {
            int idAuthor = 0;
            var book = db.Book.Include(b => b.Author).Include(b => b.Category);

            if (!String.IsNullOrEmpty(Request.QueryString["idAuthor"]))
            {
                idAuthor = Int32.Parse(Request.QueryString["idAuthor"]);
                book = db.Book.Include(b => b.Author).Include(b => b.Category).Where(b => b.IdAuthor == idAuthor);
                ViewBag.Autores = new SelectList(db.Author, "Id", "Name", idAuthor);
            }
            else
                ViewBag.Autores = new SelectList(db.Author, "Id", "Name", 0);
            
            return View(await book.ToListAsync());
        }

        // GET: Books/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Book book = await db.Book.FindAsync(id);
            if (book == null)
            {
                return HttpNotFound();
            }
            return View(book);
        }

        // GET: Books/Create
        public ActionResult Create()
        {
            ViewBag.IdAuthor = new SelectList(db.Author, "Id", "Name");
            ViewBag.IdCategory = new SelectList(db.Category, "Id", "Name");
            return View();
        }

        // POST: Books/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,IdAuthor,IdCategory,ISBN,Title,Publisher,Description")] Book book)
        {
            if (ModelState.IsValid)
            {
                db.Book.Add(book);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.IdAuthor = new SelectList(db.Author, "Id", "Name", book.IdAuthor);
            ViewBag.IdCategory = new SelectList(db.Category, "Id", "Name", book.IdCategory);
            return View(book);
        }

        // GET: Books/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Book book = await db.Book.FindAsync(id);
            if (book == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdAuthor = new SelectList(db.Author, "Id", "Name", book.IdAuthor);
            ViewBag.IdCategory = new SelectList(db.Category, "Id", "Name", book.IdCategory);
            return View(book);
        }

        // POST: Books/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,IdAuthor,IdCategory,ISBN,Title,Publisher,Description")] Book book)
        {
            if (ModelState.IsValid)
            {
                db.Entry(book).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.IdAuthor = new SelectList(db.Author, "Id", "Name", book.IdAuthor);
            ViewBag.IdCategory = new SelectList(db.Category, "Id", "Name", book.IdCategory);
            return View(book);
        }

        // GET: Books/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Book book = await db.Book.FindAsync(id);
            if (book == null)
            {
                return HttpNotFound();
            }
            return View(book);
        }

        // POST: Books/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Book book = await db.Book.FindAsync(id);
            db.Book.Remove(book);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        public ActionResult Search(string searchString)
        {
            var books = from m in db.Book
                             select m;

            if (!String.IsNullOrEmpty(searchString))
            {
                books = books.Where(s => s.Author.Name.Contains(searchString));
            }

            return View(books);
        }
    }
}
