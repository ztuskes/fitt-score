using Toybox.Application;
using Toybox.WatchUi;

class ExampleApp extends Application.AppBase {
    function initialize() {
        AppBase.initialize();
    }

    function getInitialView() {
        return [new ExampleView()];
    }
}
