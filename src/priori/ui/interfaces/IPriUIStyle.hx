package priori.ui.interfaces;

import priori.ui.style.PriUIDensity;
import priori.ui.style.PriUIType;
import priori.ui.style.PriUIStyle;

interface IPriUIStyle {

    public var style(get, set):PriUIStyle;
    public var styleType(get, set):PriUIType;
    public var styleDensity(get, set):PriUIDensity;
    
    public function isInsideContainerType():PriUIType;
    
}