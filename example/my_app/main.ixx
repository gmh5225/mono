#include <QApplication>
#include <QPushButton>

#pragma warning(suppress:5050) // https://developercommunity.visualstudio.com/t/warning-c5050-when-using-stl-modules-and-one-of-md/873364
import lib;

auto main(int argc, char *argv[]) -> int
{
  QApplication app(argc, argv);
  QPushButton button("Click me!");

  button.connect(&button, &QPushButton::clicked, &app, [&] {
	  button.setText("hello, world!");
  });

  button.show();
  return app.exec();
}
