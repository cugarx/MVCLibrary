﻿using System;
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
    public class AuthorsController : Controller
    {
        private LibraryEntities db = new LibraryEntities();

        // GET: Authors
        public async Task<ActionResult> Index()
        {
            var author = db.Author.Include(a => a.Country);
            return View(await author.ToListAsync());
        }

        // GET: Authors/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Author author = await db.Author.FindAsync(id);
            if (author == null)
            {
                return HttpNotFound();
            }
            return View(author);
        }

        // GET: Authors/Create
        public ActionResult Create()
        {
            ViewBag.IdCountry = new SelectList(db.Country, "Id", "Name");
            return View();
        }

        // POST: Authors/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,IdCountry,Name,LastName")] Author author)
        {
            if (ModelState.IsValid)
            {
                db.Author.Add(author);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.IdCountry = new SelectList(db.Country, "Id", "Name", author.IdCountry);
            return View(author);
        }

        // GET: Authors/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Author author = await db.Author.FindAsync(id);
            if (author == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdCountry = new SelectList(db.Country, "Id", "Name", author.IdCountry);
            return View(author);
        }

        // POST: Authors/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,IdCountry,Name,LastName")] Author author)
        {
            if (ModelState.IsValid)
            {
                db.Entry(author).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.IdCountry = new SelectList(db.Country, "Id", "Name", author.IdCountry);
            return View(author);
        }

        // GET: Authors/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Author author = await db.Author.FindAsync(id);
            if (author == null)
            {
                return HttpNotFound();
            }
            return View(author);
        }

        // POST: Authors/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Author author = await db.Author.FindAsync(id);
            Book book = await db.Book.FirstOrDefaultAsync(b => b.IdAuthor == id);
            if (book == null)
            {
                db.Author.Remove(author);
                ViewData["Message"] = "";
                await db.SaveChangesAsync();
            }
            else
            {
                ViewData["Message"] = "The item is used for a book, it cannot be deleted";
                return View(author);
            }

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
    }
}
