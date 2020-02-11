package priori.ui.interfaces;

import priori.ui.style.PriUIDensity;
import priori.ui.style.PriUIContainerType;
import priori.ui.style.PriUIStyle;

interface IPriUIStyle {

    public var style(get, set):PriUIStyle;
    public var styleContainerType(get, set):PriUIContainerType;
    public var styleDensity(get, set):PriUIDensity;
    
    public function isInsideContainerType():PriUIContainerType;
    
}