package priori.ui.interfaces;

import priori.ui.style.PriUIEmphasis;
import priori.ui.style.PriUIShade;
import priori.ui.style.PriUIDensity;
import priori.ui.style.PriUIContainerType;
import priori.ui.style.PriUIStyle;
import priori.ui.style.PriUIIntent;
import priori.ui.style.PriUISize;

interface IPriUIStyle {

    public var style(get, set):PriUIStyle;
    public var styleContainerType(get, set):PriUIContainerType;
    public var styleDensity(get, set):PriUIDensity;
    public var styleIntent(get, set):PriUIIntent;
    public var styleSize(get, set):PriUISize;
    public var styleShade(get, set):PriUIShade;
    public var styleEmphasis(get, set):PriUIEmphasis;
    
}