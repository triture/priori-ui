package priori.ui.container;

import priori.types.PriTransitionType;
import priori.ui.style.PriUIDisplayType;

class PriUIBoard extends PriUIContainer {
    
    public function new() {
        super();

        this.styleDisplayType = PriUIDisplayType.BOARD;
        this.z = 1;
        
        this.allowTransition(PriTransitionType.BACKGROUND_COLOR, 0.4);
    }

}