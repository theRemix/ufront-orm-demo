import utest.Assert;
import sys.db.Connection;
import ufront.db.*;

class TestDemo
{
  var cnx:Connection;

  public function new( cnx: Connection )
  {
    this.cnx = cnx;
  }

  public function setup():Void
  {
    var manager = Page.manager;
    // var tableName = @:privateAccess manager.table_name;
    // try TableCreate.create( Page.manager ) catch(e:Dynamic) {}
  }
  public function teardown():Void
  {
    // var tableName = @:privateAccess Page.manager.table_name;
    // try cnx.request( 'DROP TABLE $tableName' ) catch(e:Dynamic) {}
  }

  public function test_saving_page(){
    var new_page = new Page();
    new_page.title = "a new page";
    new_page.save();

    Assert.notNull(new_page.id);
  }
}