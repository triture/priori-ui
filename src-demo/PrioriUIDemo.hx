package;

import priori.ui.app.PriUIApp;

@priori('
<priori>
    <includes>
        <image id="logo" path="logo/logo.png" />
    </includes>
    <routes>
        <route scene="scenes.HomeScene" route="home" />
        <route scene="scenes.ColorScene" route="color" />
        <route scene="scenes.ButtonScene" route="button" />
    </routes>
</priori>
')
class PrioriUIDemo extends PriUIApp {

    static public function main() new PrioriUIDemo();

    public function new() {
        super();
    }

}