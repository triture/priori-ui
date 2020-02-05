package priori.ui.macros;

import haxe.macro.PositionTools;
import haxe.xml.Parser.XmlParserException;
import haxe.macro.TypeTools;
import haxe.macro.ComplexTypeTools;
import haxe.macro.Type;
import haxe.ds.StringMap;
import haxe.macro.ExprTools;
import haxe.macro.Expr.Catch;
import haxe.macro.Expr.FieldType;
import haxe.macro.Expr.Access;
import haxe.macro.Expr.Field;
import haxe.macro.Context;
import haxe.macro.Expr;

class PriMacroUIApp {
    static public function build():Array<Field> {
        var fields:Array<Field> = Context.getBuildFields();

        var xml:Xml = priori.view.builder.PriBuilderMacros.loadPrioriXML();

        if (xml != null) {
            try {

                var xmlBase:Xml = xml.firstElement();
                var access = new XmlAccessHelper(xmlBase);

                if (access.hasNode('routes')) {
                    var routes:Array<Expr> = [];

                    var starRoute:String = null;

                    for (item in access.getElementsFromNode('routes')) {
                        if (item.nodeName == 'route') {
                            if (item.exists('scene') && StringTools.trim(item.get('scene')).length > 0 &&
                                item.exists('route') && StringTools.trim(item.get('route')).length > 0                                
                            ) {
                                var scene:String = item.get('scene');
                                var route:String = item.get('route');
                                var scope:String = item.get('scope');

                                var code:String = 'priori.scene.PriSceneManager.use().addRoute("${route}", ${scene}, ${scope == null ? 'null' : scope})';
                                
                                if (starRoute == null) {
                                    starRoute = 'priori.scene.PriSceneManager.use().addRoute("**", ${scene}, ${scope == null ? 'null' : scope})';
                                }

                                if (route == "**") starRoute = '';

                                var e:Expr = Context.parse(
                                    code,
                                    Context.currentPos()
                                );

                                routes.push(e);
                            }
                        }
                    }

                    if (starRoute != null && starRoute.length > 0) {
                        var e:Expr = Context.parse(
                            starRoute,
                            Context.currentPos()
                        );
                        routes.push(e);
                    }

                    if (routes.length > 0) {
                        fields.push(
                            {
                                name : '__priAppRoutes',
                                pos: Context.currentPos(),
                                access: [Access.APrivate, Access.AOverride],
                                kind : FieldType.FFun(
                                    {
                                        args : [],
                                        ret : null,
                                        expr: macro {
                                            super.__priAppRoutes();
                                            $b{routes}
                                        }
                                    }
                                )
                            }
                        );
                    }
                }

                if (access.hasNode('includes')) {
                    
                    var medias:Array<Expr> = [];

                    for (item in access.getElementsFromNode("includes")) {
                        if (item.nodeName == "image") {
                            if (item.exists('path') && StringTools.trim(item.get('path')).length > 0 &&
                                item.exists('id') && StringTools.trim(item.get('id')).length > 0) {
                                    
                                    var id:String = item.get('id');
                                    var path:String = item.get('path');

                                    var e:Expr = macro priori.assets.AssetManager.g().addToQueue(new priori.assets.AssetImage($v{id}, $v{path}));

                                    medias.push(e);
                            }
                        }
                    }

                    if (medias.length > 0) {
                        fields.push(
                            {
                                name : '__priAppInclude',
                                pos: Context.currentPos(),
                                access: [Access.APrivate, Access.AOverride],
                                kind : FieldType.FFun(
                                    {
                                        args : [],
                                        ret : null,
                                        expr: macro {
                                            super.__priAppInclude();
                                            $b{medias}
                                        }
                                    }
                                )
                            }
                        );
                    }

                }

            } catch(e:Dynamic) {
                Sys.println("       ERROR - " + e);
                Context.fatalError(Std.string(e), Context.currentPos());
            }
        }

        return fields;
    }

}

private class XmlAccessHelper {

    private var node:Xml;

    public function new(node:Xml) {
        this.node = node;
    }

    public function hasNode(nodeName:String):Bool {
        for (el in this.node.elements()) if (el.nodeName == nodeName) return true;
        return false;
    }

    public function getElementsFromNode(nodeName:String):Array<Xml> {
        var result:Array<Xml> = [];

        for (el in this.node.elementsNamed(nodeName)) {
            for (cel in el.elements()) {
                result.push(cel);
            }
        }

        return result;
    }
}