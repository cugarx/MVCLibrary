using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using CSWLibrary;
using System.Web.Script.Serialization;

namespace CSWLibrary.Controllers
{
    public class BooksAPIController : ApiController
    {
        private LibraryEntities db = new LibraryEntities();

        // GET: api/BooksAPI
        public IQueryable<Book> GetBook()
        {
            return db.Book;
        }

        // GET: api/BooksAPI/5
        [ResponseType(typeof(Book))]
        public async Task<IHttpActionResult> GetBook(int id)
        {
            Book book = await db.Book.FindAsync(id);
            if (book == null)
            {
                return NotFound();
            }

            return Ok(book);
        }

        // PUT: api/BooksAPI/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutBook(int id, Book book)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != book.Id)
            {
                return BadRequest();
            }

            db.Entry(book).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BookExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/BooksAPI
        [ResponseType(typeof(Book))]
        public async Task<IHttpActionResult> PostBook(Book book)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Book.Add(book);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = book.Id }, book);
        }

        // DELETE: api/BooksAPI/5
        [ResponseType(typeof(Book))]
        public async Task<IHttpActionResult> DeleteBook(int id)
        {
            Book book = await db.Book.FindAsync(id);
            if (book == null)
            {
                return NotFound();
            }

            db.Book.Remove(book);
            await db.SaveChangesAsync();

            return Ok(book);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool BookExists(int id)
        {
            return db.Book.Count(e => e.Id == id) > 0;
        }

        // GET: api/BooksAPI/5
        public string GetBooks()
        {
            List<Book> books = (from u in db.Book select u).ToList();
            JavaScriptSerializer js = new JavaScriptSerializer();
            return js.Serialize(books);
        }


        [ResponseType(typeof(List<Book>))]
        public async Task<List<Book>> GetBookByAuthor(int idAuthor)
        {
            return  await db.Book.Where(c => c.IdAuthor == idAuthor).ToListAsync();
        }

        [ResponseType(typeof(List<Book>))]
        public async Task<IHttpActionResult> GetBookByCategory(int idCategory)
        {
            List<Book> books = await db.Book.Where(c => c.IdCategory == idCategory).ToListAsync();
            return Ok(books);
        }
    }
}