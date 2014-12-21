import utest.Runner;
import utest.ui.Report;
import sys.db.*;

class Main
{
  public function new()
  {

    var cnx = Sqlite.open("test.db3");
    var runner = new Runner();
    runner.addCase( new TestDemo(cnx) );
    Report.create(runner);
    runner.run();
  }

  static public function main()
  {
    var app = new Main();
  }
}