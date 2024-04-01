# Water Shader in 2D (Godot 3.5)
In this post I'll expplain how I did this 2D water shader. This is a tutorial based project.

<h2>Tiling Texture</h2>
UV mapping is really important thing to do if we want to create responsible shaders. That's why we have to do the normalization. For example someone has a different ascect ratio monitor, if we not normalizing it, our shader will break. But in this case not just that. We use shaders to tile a texture. Why do we do this?<br>
Textures most of the time is just a simple image like this:<br><br>
<img src = "https://github.com/martonban/GraphicsDemos/blob/master/Pictures/WaterShader/water_diffuse.png?raw=true"></img>
<br>
Most of the time if we texture someting we use the texture multiple time. Like this:<br><br>
<img src = "https://github.com/martonban/GraphicsDemos/blob/master/Pictures/WaterShader/Tiling%20TextureShow.png?raw=true"></img><br>

This is not neutral in computer graphics that's why we have to do ourselves. It's not that complicated let's the code:

```
shader_type canvas_item;

uniform vec2 tiled_factor = vec2(5.0, 5.0);

void fragment() {
	vec2 tiled_uvs = UV  * tiled_factor;
	COLOR = texture(TEXTURE, tiled_uvs);
}
```
This is a fregment shader. Frament shader is a type of shader where the GPU 


<h2>Resources</h2>
If you want to know more about those topics I touched in this post:
<ul>
    <li><a href="https://www.youtube.com/watch?v=xoyk_A0RSpI&list=PLhqJJNjsQ7KHqNMYmTwtsYTeTrqrRP_fP&index=1">Tutorial Series</a></li>
    <li><a href="https://www.khronos.org/opengl/wiki/Fragment_Shader">Fragment Shader</a></li>
	    
</ul>
