/**
 * Defines the GameObjectCollection class, which manages game objects and allows for batch operations on them.
 */
module core.gameobjectcollection;
import core.gameobject;
import graphics.shaders.shader;
import utility.filepath, utility.config;

import yaml;

import std.path;

class GameObjectCollection
{
public:
	alias objects this;

	/**
	 * Load all objects inside the specified folder in FilePath.Objects.
	 */
	void loadObjects( string objectPath = "" )
	{
		Config.processYamlDirectory(
			buildNormalizedPath( FilePath.Resources.Objects, objectPath ),
			( Node object )
			{
				auto name = object[ "Name" ].as!string;

				objects[ name ] = GameObject.createFromYaml( object );
			} );
	}

	/**
	 * Remove all objects from the collection.
	 */
	void clearObjects()
	{
		foreach( key; objects.keys )
			objects.remove( key );
	}

	/**
	 * Call the given function on each game object.
	 * 
	 * Examples:
	 * ---
	 * goc.apply( go => go.update() );
	 * ---
	 */
	void apply( void function( GameObject ) func )
	{
		foreach( value; objects.values )
			func( value );
	}

	/**
	 * Update all game objects.
	 */
	void update()
	{
		apply( go => go.update() );
	}

	/**
	 * Draw all game objects.
	 */
	void draw()
	{
		apply( go => go.draw() );
	}

private:
	GameObject[string] objects;
}
