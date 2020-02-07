package priori.ui.interfaces;

import priori.ui.style.PriUIDensity;
import priori.ui.style.PriUIType;
import priori.ui.style.PriUIStyle;

interface IPriUIStyle {

    public var style(get, set):PriUIStyle;
    public var type(get, set):PriUIType;
    public var density(get, set):PriUIDensity;
    
    public function isInsideContainerType():PriUIType;
    
}