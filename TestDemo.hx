import utest.Assert;
import sys.db.*;
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
    Manager.cnx = cnx;
    recreateTable( Page.manager );
  }
  public function teardown():Void
  {
    Manager.cnx = null;
  }

  private function recreateTable( manager:Manager<Dynamic> ):Void
  {
    var tableName = @:privateAccess manager.table_name;
    try cnx.request( 'DROP TABLE $tableName' ) catch(e:Dynamic) {}
    TableCreate.create( manager );
  }

  public function test_saving_page(){
    var new_page = new Page();
    new_page.title = "a new page";
    new_page.save();

    Assert.notNull(new_page.id);
  }
}