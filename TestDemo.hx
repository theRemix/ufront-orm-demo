import utest.Assert;
import sys.db.Connection;

class TestDemo
{
  var cnx:Connection;

  public function new( cnx: Connection )
  {
    this.cnx = cnx;
  }

  public function test_saving_page(){
    var new_page = new Page();
    new_page.title = "a new page";
    new_page.save();
    
    Assert.notNull(new_page.id);
  }
}