#version 450

#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.1415926
#define TwoPI (2.0 * PI)

uniform sampler2D envmap;

in vec3 normal;

vec2 envMapEquirect(vec3 normal) {
	float phi = acos(normal.z);
	float theta = atan(-normal.y, normal.x) + PI;
	return vec2(theta / TwoPI, phi / PI);
}

void main() {
	vec3 n = normalize(normal);
	gl_FragColor = texture(envmap, envMapEquirect(n));
	// gl_FragData[0] = texture(envmap, envMapEquirect(n));
}
