package priori.ui.dialog;

import priori.ui.style.PriUIIntent;
import priori.ui.style.PriUIStyle;
import priori.ui.container.layout.PriUIHorizontalAlignmentType;
import priori.ui.container.layout.PriUIAutoSizeType;
import priori.ui.container.layout.PriUIRow;
import priori.ui.style.PriUIEmphasis;
import priori.ui.style.PriUIDisplayType;
import priori.ui.button.PriUIButton;
import priori.ui.text.PriUILabel;
import priori.ui.overlay.PriUIOverlay;

class AlertOverlay extends AskOverlay {

    public function new(message:String, buttonLabel:String = "OK") {
        super();

        this.width = 320;
        this.text = message;
        this.addButton(buttonLabel, this.close);

        this.open();
    }

}
