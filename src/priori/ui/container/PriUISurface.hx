package priori.ui.container;

import priori.ui.container.PriUIContainerType;
import priori.types.PriTransitionType;

class PriUISurface extends PriUIContainer {
    
    public function new() {
        super();

        this.type = PriUIContainerType.SURFACE;
        this.z = 1;

        this.allowTransition(PriTransitionType.BACKGROUND_COLOR, 0.4);
    }

}