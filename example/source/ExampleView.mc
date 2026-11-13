using Toybox.Graphics;
using Toybox.WatchUi;

// Minimal watch face that shows the FITT Score from the FittScore barrel and its four parts.
class ExampleView extends WatchUi.WatchFace {
    function initialize() {
        WatchFace.initialize();
    }

    function onUpdate(dc) {
        var w = dc.getWidth();
        var h = dc.getHeight();
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(w / 2, h * 0.22, Graphics.FONT_SMALL, "FITT SCORE", Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(w / 2, h * 0.42, Graphics.FONT_NUMBER_HOT, FittScore.getScore().toString(), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

        var parts = FittScore.getComponents();
        if (parts != null) {
            var line1 = "Steps " + parts["steps"] + "  Active " + parts["activeMinutes"];
            var line2 = "Stress " + parts["stress"] + "  Recovery " + parts["recovery"];
            dc.drawText(w / 2, h * 0.64, Graphics.FONT_XTINY, line1, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
            dc.drawText(w / 2, h * 0.74, Graphics.FONT_XTINY, line2, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        }
    }
}
