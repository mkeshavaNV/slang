// Test that binding attributes on uniforms that get packed into the default uniform buffer trigger a warning
// GH: 4251
// Test Vulkan binding syntax
[[vk::binding(1, 2)]]
uniform float4 g_position;  // This should trigger a warning since it's a uniform that will be packed

[[vk::binding(3, 1)]]
uniform float4x4 g_transform; // This should also trigger a warning

// This won't trigger a warning because it's a texture (not packed into default uniform buffer)
[[vk::binding(0, 0)]]
Texture2D g_texture;

[shader("vertex")]
float4 main(float4 pos : POSITION) : SV_POSITION
{
    return g_position;
} 