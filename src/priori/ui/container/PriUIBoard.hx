package priori.ui.container;

import priori.ui.container.PriUIContainerType;
import priori.types.PriTransitionType;

class PriUIBoard extends PriUIContainer {
    
    public function new() {
        super();

        this.type = PriUIContainerType.BOARD;
        this.z = 1;
        
        this.allowTransition(PriTransitionType.BACKGROUND_COLOR, 0.4);
    }

}