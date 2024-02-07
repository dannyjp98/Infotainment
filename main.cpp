#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <Controllers/system.h>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    System m_systemHandler;

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/TeslaInfotainment/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    QQmlContext * context( engine.rootContext());
    context->setContextProperty("systemHandler", &m_systemHandler);

    return app.exec();
}
