package priori.ui.interfaces;

import priori.ui.container.PriUIContainerType;
import priori.ui.style.PriUIStyle;

interface IPriUIStyle {
    public var style(get, set):PriUIStyle;
    public var type(get, set):PriUIContainerType;
    
    public function isInsideContainerType():PriUIContainerType;
}