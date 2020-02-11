package priori.ui.container;

import priori.ui.style.PriUIContainerType;
import priori.types.PriTransitionType;

class PriUIBoard extends PriUIContainer {
    
    public function new() {
        super();

        this.styleContainerType = PriUIContainerType.BOARD;
        this.z = 1;
        
        this.allowTransition(PriTransitionType.BACKGROUND_COLOR, 0.4);
    }

}