/**
 * Handles the creation and life cycle of a web view
 */
module components.userinterface;
import core;
import components, utility, graphics.graphics;
import std.string, gl3n.linalg;

/**
 * TODO
 */
shared class UserInterface
{
private:
    uint _height;
    uint _width;
    shared mat4 _scaleMat;
    WebView _view;
    // TODO: Handle JS

public:
    /// TODO
    mixin( Property!(_view, AccessModifier.Public) );
    /// TODO
    mixin( Property!(_scaleMat, AccessModifier.Public) );

    this( uint w, uint h, string filePath )
    {
        _scaleMat = mat4.identity;
        _scaleMat[0][0] = cast(float)w/2.0f;
        _scaleMat[1][1] = cast(float)h/2.0f;
        _height = h;
        _width = w;
        _view = new shared WebView( w, h, filePath, null );
        logDebug( "UI File: ", filePath );
    }

    void update()
    {
        // Check for mouse & keyboard input

        _view.update();

        return;
    }

    void draw()
    {
        Graphics.addUI( this );
    }

    void shutdown()
    {
        // Clean up mesh, material, and view
    }

    void keyPress(int key)
    {

    }
}

shared class WebView : Texture, IComponent
{
private:
    ubyte[] glBuffer;

public:
    this( uint w, uint h, string filePath, shared GameObject owner, bool localFilePath = true )
    {
        _width = w;
        _height = h;
        glBuffer = new ubyte[_width*_height*4];
        this.owner = owner;

        super( cast(ubyte*)null );
    }

    override void update()
    {

    }

    override void shutdown()
    {
        
    }
}
