#include <QApplication>
#include <QPushButton>

import my_lib;

auto main(int argc, char *argv[]) -> int
{
  QApplication app(argc, argv);
  QPushButton button("Click me!");

  button.connect(&button, &QPushButton::clicked, &app, [&] {
    button.setText(my_lib::hello());
  });

  button.show();
  return app.exec();
}
