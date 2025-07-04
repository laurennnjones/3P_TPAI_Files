// Made with Amplify Shader Editor v1.9.2.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SyntyStudios/VegitationShader"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		_AlphaClip("AlphaClip", Float) = 0.5
		[Header(Leaves)]_LeafTex("LeafTex", 2D) = "white" {}
		_LeafNormalMap("LeafNormalMap", 2D) = "bump" {}
		_LeafNormalAmount("LeafNormalAmount", Range( 0 , 1)) = 0.5
		_LeafMetallic("LeafMetallic", Range( 0 , 1)) = 0.13
		_LeafSmoothness("LeafSmoothness", Range( 0 , 1)) = 0.5
		[Header(Trunk)]_TunkTex("TunkTex", 2D) = "white" {}
		_TrunkNormalMap("TrunkNormalMap", 2D) = "bump" {}
		_TrunkNormalAmount("TrunkNormalAmount", Range( 0 , 1)) = 0.5
		_TrunkMetallic("TrunkMetallic", Range( 0 , 1)) = 0
		_TrunkSmoothness("TrunkSmoothness", Range( 0 , 1)) = 0.2
		[Header(Colour Tinting)]_LeafBaseColour("LeafBaseColour", Color) = (0.07843138,0.02015968,0,0)
		_LeafNoiseColour("LeafNoiseColour", Color) = (0.07843138,0.02015968,0,0)
		_LeafNoiseLargeColour("LeafNoiseLargeColour", Color) = (0.07843138,0.02015968,0,0)
		[ToggleUI]_LeafFlatColourSwitch("LeafFlatColourSwitch", Float) = 0
		_TrunkBaseColour("TrunkBaseColour", Color) = (0.07843138,0.02015968,0,0)
		_TrunkNoiseColour("TrunkNoiseColour", Color) = (0.07843138,0.02015968,0,0)
		[ToggleUI]_TrunkFlatColourSwitch("TrunkFlatColourSwitch", Float) = 0
		_ColourNoiseSmallScale("ColourNoiseSmallScale", Range( 0 , 1)) = 0
		_ColourNoiseLargeScale("ColourNoiseLargeScale", Range( 0 , 1)) = 0
		[Header(Emissive)]_EmissiveAmount("EmissiveAmount", Range( 0 , 2)) = 0
		_EmissiveMask("EmissiveMask", 2D) = "white" {}
		_EmissiveColour("EmissiveColour", Color) = (0,0,0,0)
		_Emissive2Mask("Emissive2Mask", 2D) = "white" {}
		_Emissive2Colour("Emissive2Colour", Color) = (0,0,0,0)
		_TrunkEmissiveColour("TrunkEmissiveColour", Color) = (0,0,0,0)
		_TrunkEmissiveMask("TrunkEmissiveMask", 2D) = "white" {}
		_EmissivePulseMap("EmissivePulseMap", 2D) = "white" {}
		_PulseTiling("PulseTiling", Float) = 0.03
		_PulseSpeed("PulseSpeed", Float) = 0.04
		[Header(Main Wind)]_TotalWindAmount("TotalWindAmount", Range( 0 , 1)) = 0.5
		_WindDirection("WindDirection", Range( 0 , 1)) = 0
		_WindBaseline("WindBaseline", Range( 0 , 3)) = 0
		_Y_multiplier("Y_multiplier", Range( -2 , 2)) = 0.2
		_GustAmount("GustAmount", Range( 0 , 1)) = 0.5
		_GustSmallFreq("GustSmallFreq", Range( 0 , 1)) = 1
		_GustLargeFreq("GustLargeFreq", Range( 0 , 1)) = 0.5
		_GustNoiseMap("GustNoiseMap", 2D) = "white" {}
		_GustScale("GustScale", Range( 0 , 1)) = 0.5
		_GustHighlight("GustHighlight", Color) = (0,0,0,0)
		[Header(LeafSway)]_LeafBigNoiseScale("LeafBigNoiseScale", Range( 0 , 10)) = 1
		_LeafBigNoiseAmount("LeafBigNoiseAmount", Range( 0 , 1)) = 0.5
		[Header(LeafJitter)]_JitterFreq("JitterFreq", Range( 0 , 1)) = 0
		_JitterAmount("JitterAmount", Range( 0 , 1)) = 0.5
		_Leaves_NoiseTexture2("LeafJitterMap", 2D) = "white" {}
		[Header(Frosting)]_FrostingColour("FrostingColour", Color) = (1,1,1,0)
		[ToggleUI]_FrostingSwitch("FrostingSwitch", Float) = 0
		_FrostingHeight("FrostingHeight", Float) = 1
		_FrostingFalloff("FrostingFalloff", Float) = 1
		[ToggleUI]_FrostingWorldObjectSwitch2("FrostingWorldObjectSwitch", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}


		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector][ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
		[HideInInspector][ToggleOff] _EnvironmentReflections("Environment Reflections", Float) = 1.0
		[HideInInspector][ToggleOff] _ReceiveShadows("Receive Shadows", Float) = 1.0

		[HideInInspector] _QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl("_QueueControl", Float) = -1

        [HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" "UniversalMaterialType"="Lit" }

		Cull Off
		ZWrite On
		ZTest LEqual
		Offset 0 , 0
		AlphaToMask Off

		

		HLSLINCLUDE
		#pragma target 4.5
		#pragma prefer_hlslcc gles
		// ensure rendering platforms toggle list is visible

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForward" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007


			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			
			#pragma multi_compile_fragment _ _SHADOWS_SOFT
		
			
			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _LIGHT_LAYERS
			#pragma multi_compile_fragment _ _LIGHT_COOKIES
			#pragma multi_compile _ _FORWARD_PLUS

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY
			#pragma multi_compile_fragment _ _WRITE_RENDERING_LAYERS

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_FORWARD

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_NORMAL


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float4 lightmapUVOrVertexSH : TEXCOORD1;
				half4 fogFactorAndVertexLight : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					float4 shadowCoord : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
					float2 dynamicLightmapUV : TEXCOORD7;
				#endif
				float4 ase_color : COLOR;
				float4 ase_texcoord8 : TEXCOORD8;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _TunkTex_ST;
			float4 _LeafNormalMap_ST;
			float4 _FrostingColour;
			float4 _GustHighlight;
			float4 _TrunkNormalMap_ST;
			float4 _LeafNoiseLargeColour;
			float4 _EmissiveColour;
			float4 _LeafBaseColour;
			float4 _LeafNoiseColour;
			float4 _TrunkBaseColour;
			float4 _LeafTex_ST;
			float4 _TrunkNoiseColour;
			float4 _Emissive2Colour;
			float4 _Emissive2Mask_ST;
			float4 _TrunkEmissiveColour;
			float4 _TrunkEmissiveMask_ST;
			float4 _EmissiveMask_ST;
			float _EmissiveAmount;
			float _PulseTiling;
			float _TrunkNormalAmount;
			float _PulseSpeed;
			float _LeafMetallic;
			float _TrunkMetallic;
			float _LeafNormalAmount;
			float _LeafSmoothness;
			float _TrunkFlatColourSwitch;
			float _JitterAmount;
			float _FrostingHeight;
			float _FrostingFalloff;
			float _JitterFreq;
			float _LeafBigNoiseAmount;
			float _LeafBigNoiseScale;
			float _WindDirection;
			float _GustAmount;
			float _GustScale;
			float _GustSmallFreq;
			float _FrostingSwitch;
			float _GustLargeFreq;
			float _TotalWindAmount;
			float _Y_multiplier;
			float _ColourNoiseSmallScale;
			float _ColourNoiseLargeScale;
			float _LeafFlatColourSwitch;
			float _FrostingWorldObjectSwitch2;
			float _TrunkSmoothness;
			float _WindBaseline;
			float _AlphaClip;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _Leaves_NoiseTexture2;
			sampler2D _GustNoiseMap;
			sampler2D _LeafTex;
			sampler2D _TunkTex;
			sampler2D _LeafNormalMap;
			sampler2D _TrunkNormalMap;
			sampler2D _EmissiveMask;
			sampler2D _Emissive2Mask;
			sampler2D _TrunkEmissiveMask;
			sampler2D _EmissivePulseMap;


			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
			float3 mod3D289( float3 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 mod3D289( float4 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 permute( float4 x ) { return mod3D289( ( x * 34.0 + 1.0 ) * x ); }
			float4 taylorInvSqrt( float4 r ) { return 1.79284291400159 - r * 0.85373472095314; }
			float snoise( float3 v )
			{
				const float2 C = float2( 1.0 / 6.0, 1.0 / 3.0 );
				float3 i = floor( v + dot( v, C.yyy ) );
				float3 x0 = v - i + dot( i, C.xxx );
				float3 g = step( x0.yzx, x0.xyz );
				float3 l = 1.0 - g;
				float3 i1 = min( g.xyz, l.zxy );
				float3 i2 = max( g.xyz, l.zxy );
				float3 x1 = x0 - i1 + C.xxx;
				float3 x2 = x0 - i2 + C.yyy;
				float3 x3 = x0 - 0.5;
				i = mod3D289( i);
				float4 p = permute( permute( permute( i.z + float4( 0.0, i1.z, i2.z, 1.0 ) ) + i.y + float4( 0.0, i1.y, i2.y, 1.0 ) ) + i.x + float4( 0.0, i1.x, i2.x, 1.0 ) );
				float4 j = p - 49.0 * floor( p / 49.0 );  // mod(p,7*7)
				float4 x_ = floor( j / 7.0 );
				float4 y_ = floor( j - 7.0 * x_ );  // mod(j,N)
				float4 x = ( x_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 y = ( y_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 h = 1.0 - abs( x ) - abs( y );
				float4 b0 = float4( x.xy, y.xy );
				float4 b1 = float4( x.zw, y.zw );
				float4 s0 = floor( b0 ) * 2.0 + 1.0;
				float4 s1 = floor( b1 ) * 2.0 + 1.0;
				float4 sh = -step( h, 0.0 );
				float4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
				float4 a1 = b1.xzyw + s1.xzyw * sh.zzww;
				float3 g0 = float3( a0.xy, h.x );
				float3 g1 = float3( a0.zw, h.y );
				float3 g2 = float3( a1.xy, h.z );
				float3 g3 = float3( a1.zw, h.w );
				float4 norm = taylorInvSqrt( float4( dot( g0, g0 ), dot( g1, g1 ), dot( g2, g2 ), dot( g3, g3 ) ) );
				g0 *= norm.x;
				g1 *= norm.y;
				g2 *= norm.z;
				g3 *= norm.w;
				float4 m = max( 0.6 - float4( dot( x0, x0 ), dot( x1, x1 ), dot( x2, x2 ), dot( x3, x3 ) ), 0.0 );
				m = m* m;
				m = m* m;
				float4 px = float4( dot( x0, g0 ), dot( x1, g1 ), dot( x2, g2 ), dot( x3, g3 ) );
				return 42.0 * dot( m, px);
			}
			
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float mulTime28 = _TimeParameters.x * (0.0 + (_JitterFreq - 0.0) * (0.06 - 0.0) / (1.0 - 0.0));
				float2 temp_cast_0 = (( v.positionOS.xyz.x + mulTime28 )).xx;
				float lerpResult50 = lerp( tex2Dlod( _Leaves_NoiseTexture2, float4( temp_cast_0, 0, 0.0) ).r , 0.0 , ( 1.0 - v.ase_color.g ));
				float3 appendResult55 = (float3(lerpResult50 , 0.0 , 0.0));
				float4 Jitter68 = CalculateContrast((0.0 + (_JitterAmount - 0.0) * (0.3 - 0.0) / (1.0 - 0.0)),float4( (appendResult55).xz, 0.0 , 0.0 ));
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float grayscale304 = Luminance(ase_worldPos);
				float3 temp_cast_2 = (grayscale304).xxx;
				float simplePerlin3D117 = snoise( temp_cast_2 );
				simplePerlin3D117 = simplePerlin3D117*0.5 + 0.5;
				float lerpResult130 = lerp( ( simplePerlin3D117 * sin( ( _LeafBigNoiseScale * ( grayscale304 + _TimeParameters.x ) ) ) ) , 0.0 , ( 1.0 - v.ase_color.g ));
				float cos103 = cos( (0.0 + (_WindDirection - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float sin103 = sin( (0.0 + (_WindDirection - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float2 rotator103 = mul( float2( 1,1 ) - float2( 0,0 ) , float2x2( cos103 , -sin103 , sin103 , cos103 )) + float2( 0,0 );
				float2 temp_output_362_0 = (ase_worldPos).xz;
				float simplePerlin2D368 = snoise( temp_output_362_0*0.05 );
				simplePerlin2D368 = simplePerlin2D368*0.5 + 0.5;
				float cos361 = cos( (0.0 + (( 1.0 - _WindDirection ) - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float sin361 = sin( (0.0 + (( 1.0 - _WindDirection ) - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float2 rotator361 = mul( temp_output_362_0 - float2( 0,0 ) , float2x2( cos361 , -sin361 , sin361 , cos361 )) + float2( 0,0 );
				float grayscale346 = Luminance(float3( rotator361 ,  0.0 ));
				float2 temp_cast_4 = (( sin( _TimeParameters.x * 0.25 ) * (0.0 + (_GustLargeFreq - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) )).xx;
				float temp_output_177_0 = ( (0.0 + (_GustAmount - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( ( ( simplePerlin2D368 * sin( ( ( grayscale346 * _GustScale ) + ( _TimeParameters.x * -(0.0 + (_GustSmallFreq - 0.0) * (10.0 - 0.0) / (1.0 - 0.0)) ) ) ) ) + 0.5 ) / 2.0 ) * ( ( tex2Dlod( _GustNoiseMap, float4( temp_cast_4, 0, 0.0) ).r + 0.5 ) / 2.0 ) );
				float lerpResult101 = lerp( ( temp_output_177_0 + _WindBaseline ) , 0.0 , ( 1.0 - v.ase_color.r ));
				float2 break99 = ( rotator103 * lerpResult101 );
				float3 appendResult100 = (float3(break99.x , 0.0 , break99.y));
				float temp_output_293_0 = (0.0 + (_TotalWindAmount - 0.0) * (2.0 - 0.0) / (1.0 - 0.0));
				float3 break169 = ( ( _LeafBigNoiseAmount * lerpResult130 ) + ( appendResult100 * temp_output_293_0 ) );
				float smoothstepResult167 = smoothstep( 0.0 , 2.0 , abs( lerpResult101 ));
				float3 appendResult168 = (float3(break169.x , ( smoothstepResult167 * _Y_multiplier * temp_output_293_0 ) , break169.z));
				float3 worldToObjDir239 = mul( GetWorldToObjectMatrix(), float4( appendResult168, 0 ) ).xyz;
				float3 Wind201 = worldToObjDir239;
				
				o.ase_color = v.ase_color;
				o.ase_texcoord8.xy = v.texcoord.xy;
				o.ase_normal = v.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( Jitter68 + float4( Wind201 , 0.0 ) ).rgb;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif
				v.normalOS = v.normalOS;
				v.tangentOS = v.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( v.normalOS, v.tangentOS );

				o.tSpace0 = float4( normalInput.normalWS, vertexInput.positionWS.x );
				o.tSpace1 = float4( normalInput.tangentWS, vertexInput.positionWS.y );
				o.tSpace2 = float4( normalInput.bitangentWS, vertexInput.positionWS.z );

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				#endif

				#if !defined(LIGHTMAP_ON)
					OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord.xy;
					o.lightmapUVOrVertexSH.xy = v.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( vertexInput.positionWS, normalInput.normalWS );

				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( vertexInput.positionCS.z );
				#else
					half fogFactor = 0;
				#endif

				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag ( VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif

				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				float2 NormalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.positionCS);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float2 uv_LeafTex = IN.ase_texcoord8.xy * _LeafTex_ST.xy + _LeafTex_ST.zw;
				float2 uv_TunkTex = IN.ase_texcoord8.xy * _TunkTex_ST.xy + _TunkTex_ST.zw;
				float4 temp_output_551_0 = ( IN.ase_color.b > 0.5 ? tex2D( _LeafTex, uv_LeafTex ) : tex2D( _TunkTex, uv_TunkTex ) );
				float3 temp_output_51_0 = ( WorldPosition * 0.5 );
				float simplePerlin3D57 = snoise( temp_output_51_0*_ColourNoiseSmallScale );
				simplePerlin3D57 = simplePerlin3D57*0.5 + 0.5;
				float3 temp_cast_0 = (simplePerlin3D57).xxx;
				float3 lerpResult60 = lerp( temp_cast_0 , sin( temp_output_51_0 ) , float3( 0,0,0 ));
				float grayscale66 = Luminance(lerpResult60);
				float4 lerpResult71 = lerp( _LeafNoiseColour , _LeafBaseColour , grayscale66);
				float4 lerpResult508 = lerp( _LeafNoiseLargeColour , float4( 0,0,0,0 ) , float4( 0,0,0,0 ));
				float3 temp_output_502_0 = ( WorldPosition * 0.5 );
				float simplePerlin3D500 = snoise( temp_output_502_0*(0.0 + (_ColourNoiseLargeScale - 0.0) * (0.2 - 0.0) / (1.0 - 0.0)) );
				simplePerlin3D500 = simplePerlin3D500*0.5 + 0.5;
				float3 temp_cast_1 = (simplePerlin3D500).xxx;
				float3 lerpResult499 = lerp( temp_cast_1 , sin( temp_output_502_0 ) , float3( 0,0,0 ));
				float grayscale498 = Luminance(lerpResult499);
				float4 lerpResult497 = lerp( lerpResult71 , lerpResult508 , grayscale498);
				float4 blendOpSrc73 = temp_output_551_0;
				float4 blendOpDest73 = lerpResult497;
				float4 lerpResult600 = lerp( max( blendOpSrc73, blendOpDest73 ) , lerpResult497 , _LeafFlatColourSwitch);
				float2 temp_output_362_0 = (WorldPosition).xz;
				float simplePerlin2D368 = snoise( temp_output_362_0*0.05 );
				simplePerlin2D368 = simplePerlin2D368*0.5 + 0.5;
				float cos361 = cos( (0.0 + (( 1.0 - _WindDirection ) - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float sin361 = sin( (0.0 + (( 1.0 - _WindDirection ) - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float2 rotator361 = mul( temp_output_362_0 - float2( 0,0 ) , float2x2( cos361 , -sin361 , sin361 , cos361 )) + float2( 0,0 );
				float grayscale346 = Luminance(float3( rotator361 ,  0.0 ));
				float2 temp_cast_3 = (( sin( _TimeParameters.x * 0.25 ) * (0.0 + (_GustLargeFreq - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) )).xx;
				float temp_output_177_0 = ( (0.0 + (_GustAmount - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( ( ( simplePerlin2D368 * sin( ( ( grayscale346 * _GustScale ) + ( _TimeParameters.x * -(0.0 + (_GustSmallFreq - 0.0) * (10.0 - 0.0) / (1.0 - 0.0)) ) ) ) ) + 0.5 ) / 2.0 ) * ( ( tex2D( _GustNoiseMap, temp_cast_3 ).r + 0.5 ) / 2.0 ) );
				float gustValue373 = temp_output_177_0;
				float4 lerpResult378 = lerp( ( _GustHighlight * gustValue373 ) , float4( 0,0,0,0 ) , ( 1.0 - IN.ase_color.g ));
				float4 temp_output_379_0 = ( lerpResult600 + lerpResult378 );
				float lerpResult659 = lerp( WorldNormal.y , IN.ase_normal.y , _FrostingWorldObjectSwitch2);
				float4 lerpResult461 = lerp(temp_output_379_0, _FrostingColour, saturate(pow(abs(lerpResult659), _FrostingHeight) * _FrostingFalloff));
				float4 lerpResult605 = lerp( temp_output_379_0 , lerpResult461 , _FrostingSwitch);
				float4 lerpResult570 = lerp( _TrunkNoiseColour , _TrunkBaseColour , grayscale66);
				float4 blendOpSrc575 = temp_output_551_0;
				float4 blendOpDest575 = lerpResult570;
				float4 lerpResult603 = lerp( max( blendOpSrc575, blendOpDest575 ) , lerpResult570 , _TrunkFlatColourSwitch);
				float4 Albedo78 = ( IN.ase_color.b > 0.5 ? lerpResult605 : lerpResult603 );
				
				float2 uv_LeafNormalMap = IN.ase_texcoord8.xy * _LeafNormalMap_ST.xy + _LeafNormalMap_ST.zw;
				float3 unpack81 = UnpackNormalScale( tex2D( _LeafNormalMap, uv_LeafNormalMap ), _LeafNormalAmount );
				unpack81.z = lerp( 1, unpack81.z, saturate(_LeafNormalAmount) );
				float2 uv_TrunkNormalMap = IN.ase_texcoord8.xy * _TrunkNormalMap_ST.xy + _TrunkNormalMap_ST.zw;
				float3 unpack562 = UnpackNormalScale( tex2D( _TrunkNormalMap, uv_TrunkNormalMap ), _TrunkNormalAmount );
				unpack562.z = lerp( 1, unpack562.z, saturate(_TrunkNormalAmount) );
				
				float2 uv_EmissiveMask = IN.ase_texcoord8.xy * _EmissiveMask_ST.xy + _EmissiveMask_ST.zw;
				float4 lerpResult417 = lerp( _EmissiveColour , float4( 0,0,0,0 ) , ( 1.0 - tex2D( _EmissiveMask, uv_EmissiveMask ).r ));
				float2 uv_Emissive2Mask = IN.ase_texcoord8.xy * _Emissive2Mask_ST.xy + _Emissive2Mask_ST.zw;
				float4 lerpResult457 = lerp( _Emissive2Colour , float4( 0,0,0,0 ) , ( 1.0 - tex2D( _Emissive2Mask, uv_Emissive2Mask ).r ));
				float2 uv_TrunkEmissiveMask = IN.ase_texcoord8.xy * _TrunkEmissiveMask_ST.xy + _TrunkEmissiveMask_ST.zw;
				float4 lerpResult569 = lerp( _TrunkEmissiveColour , float4( 0,0,0,0 ) , ( 1.0 - tex2D( _TrunkEmissiveMask, uv_TrunkEmissiveMask ).r ));
				float2 temp_cast_5 = (_PulseTiling).xx;
				float mulTime436 = _TimeParameters.x * _PulseSpeed;
				float2 temp_cast_6 = (mulTime436).xx;
				float2 texCoord435 = IN.ase_texcoord8.xy * temp_cast_5 + temp_cast_6;
				float4 appendResult441 = (float4(WorldPosition.x , 0.0 , WorldPosition.z , 0.0));
				float mulTime430 = _TimeParameters.x * 4.0;
				float grayscale432 = Luminance(sin( ( ( appendResult441 * 0.5 ) + mulTime430 ) ).xyz);
				float clampResult444 = clamp( max( tex2D( _EmissivePulseMap, texCoord435 ).r , grayscale432 ) , 0.0 , 1.0 );
				float4 Emissive420 = ( ( IN.ase_color.b > 0.5 ? ( lerpResult417 + lerpResult457 ) : lerpResult569 ) * _EmissiveAmount * (0.5 + (clampResult444 - 0.0) * (1.0 - 0.5) / (1.0 - 0.0)) );
				
				float temp_output_189_0 = ( 1.0 - IN.ase_color.b );
				float lerpResult188 = lerp( _LeafMetallic , 0.0 , temp_output_189_0);
				float lerpResult195 = lerp( _TrunkMetallic , 0.0 , IN.ase_color.b);
				
				float lerpResult191 = lerp( _LeafSmoothness , 0.0 , temp_output_189_0);
				float lerpResult190 = lerp( _TrunkSmoothness , 0.0 , IN.ase_color.b);
				
				float Alpha77 = temp_output_551_0.a;
				

				float3 BaseColor = Albedo78.rgb;
				float3 Normal = ( IN.ase_color.b > 0.5 ? unpack81 : unpack562 );
				float3 Emission = Emissive420.rgb;
				float3 Specular = 0.5;
				float Metallic = ( lerpResult188 + lerpResult195 );
				float Smoothness = ( lerpResult191 + lerpResult190 );
				float Occlusion = 1;
				float Alpha = Alpha77;
				float AlphaClipThreshold = _AlphaClip;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _CLEARCOAT
					float CoatMask = 0;
					float CoatSmoothness = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.viewDirectionWS = WorldViewDirection;

				#ifdef _NORMALMAP
						#if _NORMAL_DROPOFF_TS
							inputData.normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent, WorldBiTangent, WorldNormal));
						#elif _NORMAL_DROPOFF_OS
							inputData.normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							inputData.normalWS = Normal;
						#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = WorldNormal;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					inputData.shadowCoord = ShadowCoords;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					inputData.shadowCoord = TransformWorldToShadowCoord(inputData.positionWS);
				#else
					inputData.shadowCoord = float4(0, 0, 0, 0);
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif
					inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
				#else
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS);
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif

				inputData.normalizedScreenSpaceUV = NormalizedScreenSpaceUV;
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = IN.dynamicLightmapUV.xy;
					#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = IN.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				SurfaceData surfaceData;
				surfaceData.albedo              = BaseColor;
				surfaceData.metallic            = saturate(Metallic);
				surfaceData.specular            = Specular;
				surfaceData.smoothness          = saturate(Smoothness),
				surfaceData.occlusion           = Occlusion,
				surfaceData.emission            = Emission,
				surfaceData.alpha               = saturate(Alpha);
				surfaceData.normalTS            = Normal;
				surfaceData.clearCoatMask       = 0;
				surfaceData.clearCoatSmoothness = 1;

				#ifdef _CLEARCOAT
					surfaceData.clearCoatMask       = saturate(CoatMask);
					surfaceData.clearCoatSmoothness = saturate(CoatSmoothness);
				#endif

				#ifdef _DBUFFER
					ApplyDecalToSurfaceData(IN.positionCS, surfaceData, inputData);
				#endif

				half4 color = UniversalFragmentPBR( inputData, surfaceData);

				#ifdef ASE_TRANSMISSION
				{
					float shadow = _TransmissionShadow;

					#define SUM_LIGHT_TRANSMISSION(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 transmission = max( 0, -dot( inputData.normalWS, Light.direction ) ) * atten * Transmission;\
						color.rgb += BaseColor * transmission;

					SUM_LIGHT_TRANSMISSION( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSMISSION( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSMISSION( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_TRANSLUCENCY
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					#define SUM_LIGHT_TRANSLUCENCY(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 lightDir = Light.direction + inputData.normalWS * normal;\
						half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );\
						half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;\
						color.rgb += BaseColor * translucency * strength;

					SUM_LIGHT_TRANSLUCENCY( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSLUCENCY( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSLUCENCY( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_REFRACTION
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, float4( WorldNormal,0 ) ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos.xy ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif

				return color;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off
			ColorMask 0

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#define ASE_FOG 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007


			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW

			#define SHADERPASS SHADERPASS_SHADOWCASTER

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_VERT_POSITION


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD2;
				#endif				
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _TunkTex_ST;
			float4 _LeafNormalMap_ST;
			float4 _FrostingColour;
			float4 _GustHighlight;
			float4 _TrunkNormalMap_ST;
			float4 _LeafNoiseLargeColour;
			float4 _EmissiveColour;
			float4 _LeafBaseColour;
			float4 _LeafNoiseColour;
			float4 _TrunkBaseColour;
			float4 _LeafTex_ST;
			float4 _TrunkNoiseColour;
			float4 _Emissive2Colour;
			float4 _Emissive2Mask_ST;
			float4 _TrunkEmissiveColour;
			float4 _TrunkEmissiveMask_ST;
			float4 _EmissiveMask_ST;
			float _EmissiveAmount;
			float _PulseTiling;
			float _TrunkNormalAmount;
			float _PulseSpeed;
			float _LeafMetallic;
			float _TrunkMetallic;
			float _LeafNormalAmount;
			float _LeafSmoothness;
			float _TrunkFlatColourSwitch;
			float _JitterAmount;
			float _FrostingHeight;
			float _FrostingFalloff;
			float _JitterFreq;
			float _LeafBigNoiseAmount;
			float _LeafBigNoiseScale;
			float _WindDirection;
			float _GustAmount;
			float _GustScale;
			float _GustSmallFreq;
			float _FrostingSwitch;
			float _GustLargeFreq;
			float _TotalWindAmount;
			float _Y_multiplier;
			float _ColourNoiseSmallScale;
			float _ColourNoiseLargeScale;
			float _LeafFlatColourSwitch;
			float _FrostingWorldObjectSwitch2;
			float _TrunkSmoothness;
			float _WindBaseline;
			float _AlphaClip;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _Leaves_NoiseTexture2;
			sampler2D _GustNoiseMap;
			sampler2D _LeafTex;
			sampler2D _TunkTex;


			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
			float3 mod3D289( float3 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 mod3D289( float4 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 permute( float4 x ) { return mod3D289( ( x * 34.0 + 1.0 ) * x ); }
			float4 taylorInvSqrt( float4 r ) { return 1.79284291400159 - r * 0.85373472095314; }
			float snoise( float3 v )
			{
				const float2 C = float2( 1.0 / 6.0, 1.0 / 3.0 );
				float3 i = floor( v + dot( v, C.yyy ) );
				float3 x0 = v - i + dot( i, C.xxx );
				float3 g = step( x0.yzx, x0.xyz );
				float3 l = 1.0 - g;
				float3 i1 = min( g.xyz, l.zxy );
				float3 i2 = max( g.xyz, l.zxy );
				float3 x1 = x0 - i1 + C.xxx;
				float3 x2 = x0 - i2 + C.yyy;
				float3 x3 = x0 - 0.5;
				i = mod3D289( i);
				float4 p = permute( permute( permute( i.z + float4( 0.0, i1.z, i2.z, 1.0 ) ) + i.y + float4( 0.0, i1.y, i2.y, 1.0 ) ) + i.x + float4( 0.0, i1.x, i2.x, 1.0 ) );
				float4 j = p - 49.0 * floor( p / 49.0 );  // mod(p,7*7)
				float4 x_ = floor( j / 7.0 );
				float4 y_ = floor( j - 7.0 * x_ );  // mod(j,N)
				float4 x = ( x_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 y = ( y_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 h = 1.0 - abs( x ) - abs( y );
				float4 b0 = float4( x.xy, y.xy );
				float4 b1 = float4( x.zw, y.zw );
				float4 s0 = floor( b0 ) * 2.0 + 1.0;
				float4 s1 = floor( b1 ) * 2.0 + 1.0;
				float4 sh = -step( h, 0.0 );
				float4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
				float4 a1 = b1.xzyw + s1.xzyw * sh.zzww;
				float3 g0 = float3( a0.xy, h.x );
				float3 g1 = float3( a0.zw, h.y );
				float3 g2 = float3( a1.xy, h.z );
				float3 g3 = float3( a1.zw, h.w );
				float4 norm = taylorInvSqrt( float4( dot( g0, g0 ), dot( g1, g1 ), dot( g2, g2 ), dot( g3, g3 ) ) );
				g0 *= norm.x;
				g1 *= norm.y;
				g2 *= norm.z;
				g3 *= norm.w;
				float4 m = max( 0.6 - float4( dot( x0, x0 ), dot( x1, x1 ), dot( x2, x2 ), dot( x3, x3 ) ), 0.0 );
				m = m* m;
				m = m* m;
				float4 px = float4( dot( x0, g0 ), dot( x1, g1 ), dot( x2, g2 ), dot( x3, g3 ) );
				return 42.0 * dot( m, px);
			}
			
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			

			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float mulTime28 = _TimeParameters.x * (0.0 + (_JitterFreq - 0.0) * (0.06 - 0.0) / (1.0 - 0.0));
				float2 temp_cast_0 = (( v.positionOS.xyz.x + mulTime28 )).xx;
				float lerpResult50 = lerp( tex2Dlod( _Leaves_NoiseTexture2, float4( temp_cast_0, 0, 0.0) ).r , 0.0 , ( 1.0 - v.ase_color.g ));
				float3 appendResult55 = (float3(lerpResult50 , 0.0 , 0.0));
				float4 Jitter68 = CalculateContrast((0.0 + (_JitterAmount - 0.0) * (0.3 - 0.0) / (1.0 - 0.0)),float4( (appendResult55).xz, 0.0 , 0.0 ));
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float grayscale304 = Luminance(ase_worldPos);
				float3 temp_cast_2 = (grayscale304).xxx;
				float simplePerlin3D117 = snoise( temp_cast_2 );
				simplePerlin3D117 = simplePerlin3D117*0.5 + 0.5;
				float lerpResult130 = lerp( ( simplePerlin3D117 * sin( ( _LeafBigNoiseScale * ( grayscale304 + _TimeParameters.x ) ) ) ) , 0.0 , ( 1.0 - v.ase_color.g ));
				float cos103 = cos( (0.0 + (_WindDirection - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float sin103 = sin( (0.0 + (_WindDirection - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float2 rotator103 = mul( float2( 1,1 ) - float2( 0,0 ) , float2x2( cos103 , -sin103 , sin103 , cos103 )) + float2( 0,0 );
				float2 temp_output_362_0 = (ase_worldPos).xz;
				float simplePerlin2D368 = snoise( temp_output_362_0*0.05 );
				simplePerlin2D368 = simplePerlin2D368*0.5 + 0.5;
				float cos361 = cos( (0.0 + (( 1.0 - _WindDirection ) - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float sin361 = sin( (0.0 + (( 1.0 - _WindDirection ) - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float2 rotator361 = mul( temp_output_362_0 - float2( 0,0 ) , float2x2( cos361 , -sin361 , sin361 , cos361 )) + float2( 0,0 );
				float grayscale346 = Luminance(float3( rotator361 ,  0.0 ));
				float2 temp_cast_4 = (( sin( _TimeParameters.x * 0.25 ) * (0.0 + (_GustLargeFreq - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) )).xx;
				float temp_output_177_0 = ( (0.0 + (_GustAmount - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( ( ( simplePerlin2D368 * sin( ( ( grayscale346 * _GustScale ) + ( _TimeParameters.x * -(0.0 + (_GustSmallFreq - 0.0) * (10.0 - 0.0) / (1.0 - 0.0)) ) ) ) ) + 0.5 ) / 2.0 ) * ( ( tex2Dlod( _GustNoiseMap, float4( temp_cast_4, 0, 0.0) ).r + 0.5 ) / 2.0 ) );
				float lerpResult101 = lerp( ( temp_output_177_0 + _WindBaseline ) , 0.0 , ( 1.0 - v.ase_color.r ));
				float2 break99 = ( rotator103 * lerpResult101 );
				float3 appendResult100 = (float3(break99.x , 0.0 , break99.y));
				float temp_output_293_0 = (0.0 + (_TotalWindAmount - 0.0) * (2.0 - 0.0) / (1.0 - 0.0));
				float3 break169 = ( ( _LeafBigNoiseAmount * lerpResult130 ) + ( appendResult100 * temp_output_293_0 ) );
				float smoothstepResult167 = smoothstep( 0.0 , 2.0 , abs( lerpResult101 ));
				float3 appendResult168 = (float3(break169.x , ( smoothstepResult167 * _Y_multiplier * temp_output_293_0 ) , break169.z));
				float3 worldToObjDir239 = mul( GetWorldToObjectMatrix(), float4( appendResult168, 0 ) ).xyz;
				float3 Wind201 = worldToObjDir239;
				
				o.ase_color = v.ase_color;
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( Jitter68 + float4( Wind201 , 0.0 ) ).rgb;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = positionWS;
				#endif

				float3 normalWS = TransformObjectToWorldDir(v.normalOS);

				#if _CASTING_PUNCTUAL_LIGHT_SHADOW
					float3 lightDirectionWS = normalize(_LightPosition - positionWS);
				#else
					float3 lightDirectionWS = _LightDirection;
				#endif

				float4 positionCS = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, lightDirectionWS));

				#if UNITY_REVERSED_Z
					positionCS.z = min(positionCS.z, UNITY_NEAR_CLIP_VALUE);
				#else
					positionCS.z = max(positionCS.z, UNITY_NEAR_CLIP_VALUE);
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = positionCS;
				o.clipPosV = positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 uv_LeafTex = IN.ase_texcoord3.xy * _LeafTex_ST.xy + _LeafTex_ST.zw;
				float2 uv_TunkTex = IN.ase_texcoord3.xy * _TunkTex_ST.xy + _TunkTex_ST.zw;
				float4 temp_output_551_0 = ( IN.ase_color.b > 0.5 ? tex2D( _LeafTex, uv_LeafTex ) : tex2D( _TunkTex, uv_TunkTex ) );
				float Alpha77 = temp_output_551_0.a;
				

				float Alpha = Alpha77;
				float AlphaClipThreshold = _AlphaClip;
				float AlphaClipThresholdShadow = 0.5;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#define ASE_FOG 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007


			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_VERT_POSITION


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 positionWS : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD2;
				#endif
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _TunkTex_ST;
			float4 _LeafNormalMap_ST;
			float4 _FrostingColour;
			float4 _GustHighlight;
			float4 _TrunkNormalMap_ST;
			float4 _LeafNoiseLargeColour;
			float4 _EmissiveColour;
			float4 _LeafBaseColour;
			float4 _LeafNoiseColour;
			float4 _TrunkBaseColour;
			float4 _LeafTex_ST;
			float4 _TrunkNoiseColour;
			float4 _Emissive2Colour;
			float4 _Emissive2Mask_ST;
			float4 _TrunkEmissiveColour;
			float4 _TrunkEmissiveMask_ST;
			float4 _EmissiveMask_ST;
			float _EmissiveAmount;
			float _PulseTiling;
			float _TrunkNormalAmount;
			float _PulseSpeed;
			float _LeafMetallic;
			float _TrunkMetallic;
			float _LeafNormalAmount;
			float _LeafSmoothness;
			float _TrunkFlatColourSwitch;
			float _JitterAmount;
			float _FrostingHeight;
			float _FrostingFalloff;
			float _JitterFreq;
			float _LeafBigNoiseAmount;
			float _LeafBigNoiseScale;
			float _WindDirection;
			float _GustAmount;
			float _GustScale;
			float _GustSmallFreq;
			float _FrostingSwitch;
			float _GustLargeFreq;
			float _TotalWindAmount;
			float _Y_multiplier;
			float _ColourNoiseSmallScale;
			float _ColourNoiseLargeScale;
			float _LeafFlatColourSwitch;
			float _FrostingWorldObjectSwitch2;
			float _TrunkSmoothness;
			float _WindBaseline;
			float _AlphaClip;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _Leaves_NoiseTexture2;
			sampler2D _GustNoiseMap;
			sampler2D _LeafTex;
			sampler2D _TunkTex;


			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
			float3 mod3D289( float3 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 mod3D289( float4 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 permute( float4 x ) { return mod3D289( ( x * 34.0 + 1.0 ) * x ); }
			float4 taylorInvSqrt( float4 r ) { return 1.79284291400159 - r * 0.85373472095314; }
			float snoise( float3 v )
			{
				const float2 C = float2( 1.0 / 6.0, 1.0 / 3.0 );
				float3 i = floor( v + dot( v, C.yyy ) );
				float3 x0 = v - i + dot( i, C.xxx );
				float3 g = step( x0.yzx, x0.xyz );
				float3 l = 1.0 - g;
				float3 i1 = min( g.xyz, l.zxy );
				float3 i2 = max( g.xyz, l.zxy );
				float3 x1 = x0 - i1 + C.xxx;
				float3 x2 = x0 - i2 + C.yyy;
				float3 x3 = x0 - 0.5;
				i = mod3D289( i);
				float4 p = permute( permute( permute( i.z + float4( 0.0, i1.z, i2.z, 1.0 ) ) + i.y + float4( 0.0, i1.y, i2.y, 1.0 ) ) + i.x + float4( 0.0, i1.x, i2.x, 1.0 ) );
				float4 j = p - 49.0 * floor( p / 49.0 );  // mod(p,7*7)
				float4 x_ = floor( j / 7.0 );
				float4 y_ = floor( j - 7.0 * x_ );  // mod(j,N)
				float4 x = ( x_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 y = ( y_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 h = 1.0 - abs( x ) - abs( y );
				float4 b0 = float4( x.xy, y.xy );
				float4 b1 = float4( x.zw, y.zw );
				float4 s0 = floor( b0 ) * 2.0 + 1.0;
				float4 s1 = floor( b1 ) * 2.0 + 1.0;
				float4 sh = -step( h, 0.0 );
				float4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
				float4 a1 = b1.xzyw + s1.xzyw * sh.zzww;
				float3 g0 = float3( a0.xy, h.x );
				float3 g1 = float3( a0.zw, h.y );
				float3 g2 = float3( a1.xy, h.z );
				float3 g3 = float3( a1.zw, h.w );
				float4 norm = taylorInvSqrt( float4( dot( g0, g0 ), dot( g1, g1 ), dot( g2, g2 ), dot( g3, g3 ) ) );
				g0 *= norm.x;
				g1 *= norm.y;
				g2 *= norm.z;
				g3 *= norm.w;
				float4 m = max( 0.6 - float4( dot( x0, x0 ), dot( x1, x1 ), dot( x2, x2 ), dot( x3, x3 ) ), 0.0 );
				m = m* m;
				m = m* m;
				float4 px = float4( dot( x0, g0 ), dot( x1, g1 ), dot( x2, g2 ), dot( x3, g3 ) );
				return 42.0 * dot( m, px);
			}
			
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float mulTime28 = _TimeParameters.x * (0.0 + (_JitterFreq - 0.0) * (0.06 - 0.0) / (1.0 - 0.0));
				float2 temp_cast_0 = (( v.positionOS.xyz.x + mulTime28 )).xx;
				float lerpResult50 = lerp( tex2Dlod( _Leaves_NoiseTexture2, float4( temp_cast_0, 0, 0.0) ).r , 0.0 , ( 1.0 - v.ase_color.g ));
				float3 appendResult55 = (float3(lerpResult50 , 0.0 , 0.0));
				float4 Jitter68 = CalculateContrast((0.0 + (_JitterAmount - 0.0) * (0.3 - 0.0) / (1.0 - 0.0)),float4( (appendResult55).xz, 0.0 , 0.0 ));
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float grayscale304 = Luminance(ase_worldPos);
				float3 temp_cast_2 = (grayscale304).xxx;
				float simplePerlin3D117 = snoise( temp_cast_2 );
				simplePerlin3D117 = simplePerlin3D117*0.5 + 0.5;
				float lerpResult130 = lerp( ( simplePerlin3D117 * sin( ( _LeafBigNoiseScale * ( grayscale304 + _TimeParameters.x ) ) ) ) , 0.0 , ( 1.0 - v.ase_color.g ));
				float cos103 = cos( (0.0 + (_WindDirection - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float sin103 = sin( (0.0 + (_WindDirection - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float2 rotator103 = mul( float2( 1,1 ) - float2( 0,0 ) , float2x2( cos103 , -sin103 , sin103 , cos103 )) + float2( 0,0 );
				float2 temp_output_362_0 = (ase_worldPos).xz;
				float simplePerlin2D368 = snoise( temp_output_362_0*0.05 );
				simplePerlin2D368 = simplePerlin2D368*0.5 + 0.5;
				float cos361 = cos( (0.0 + (( 1.0 - _WindDirection ) - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float sin361 = sin( (0.0 + (( 1.0 - _WindDirection ) - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float2 rotator361 = mul( temp_output_362_0 - float2( 0,0 ) , float2x2( cos361 , -sin361 , sin361 , cos361 )) + float2( 0,0 );
				float grayscale346 = Luminance(float3( rotator361 ,  0.0 ));
				float2 temp_cast_4 = (( sin( _TimeParameters.x * 0.25 ) * (0.0 + (_GustLargeFreq - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) )).xx;
				float temp_output_177_0 = ( (0.0 + (_GustAmount - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( ( ( simplePerlin2D368 * sin( ( ( grayscale346 * _GustScale ) + ( _TimeParameters.x * -(0.0 + (_GustSmallFreq - 0.0) * (10.0 - 0.0) / (1.0 - 0.0)) ) ) ) ) + 0.5 ) / 2.0 ) * ( ( tex2Dlod( _GustNoiseMap, float4( temp_cast_4, 0, 0.0) ).r + 0.5 ) / 2.0 ) );
				float lerpResult101 = lerp( ( temp_output_177_0 + _WindBaseline ) , 0.0 , ( 1.0 - v.ase_color.r ));
				float2 break99 = ( rotator103 * lerpResult101 );
				float3 appendResult100 = (float3(break99.x , 0.0 , break99.y));
				float temp_output_293_0 = (0.0 + (_TotalWindAmount - 0.0) * (2.0 - 0.0) / (1.0 - 0.0));
				float3 break169 = ( ( _LeafBigNoiseAmount * lerpResult130 ) + ( appendResult100 * temp_output_293_0 ) );
				float smoothstepResult167 = smoothstep( 0.0 , 2.0 , abs( lerpResult101 ));
				float3 appendResult168 = (float3(break169.x , ( smoothstepResult167 * _Y_multiplier * temp_output_293_0 ) , break169.z));
				float3 worldToObjDir239 = mul( GetWorldToObjectMatrix(), float4( appendResult168, 0 ) ).xyz;
				float3 Wind201 = worldToObjDir239;
				
				o.ase_color = v.ase_color;
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( Jitter68 + float4( Wind201 , 0.0 ) ).rgb;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 uv_LeafTex = IN.ase_texcoord3.xy * _LeafTex_ST.xy + _LeafTex_ST.zw;
				float2 uv_TunkTex = IN.ase_texcoord3.xy * _TunkTex_ST.xy + _TunkTex_ST.zw;
				float4 temp_output_551_0 = ( IN.ase_color.b > 0.5 ? tex2D( _LeafTex, uv_LeafTex ) : tex2D( _TunkTex, uv_TunkTex ) );
				float Alpha77 = temp_output_551_0.a;
				

				float Alpha = Alpha77;
				float AlphaClipThreshold = _AlphaClip;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007


			#pragma vertex vert
			#pragma fragment frag

			#pragma shader_feature EDITOR_VISUALIZATION

			#define SHADERPASS SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				#ifdef EDITOR_VISUALIZATION
					float4 VizUV : TEXCOORD2;
					float4 LightCoord : TEXCOORD3;
				#endif
				float4 ase_color : COLOR;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _TunkTex_ST;
			float4 _LeafNormalMap_ST;
			float4 _FrostingColour;
			float4 _GustHighlight;
			float4 _TrunkNormalMap_ST;
			float4 _LeafNoiseLargeColour;
			float4 _EmissiveColour;
			float4 _LeafBaseColour;
			float4 _LeafNoiseColour;
			float4 _TrunkBaseColour;
			float4 _LeafTex_ST;
			float4 _TrunkNoiseColour;
			float4 _Emissive2Colour;
			float4 _Emissive2Mask_ST;
			float4 _TrunkEmissiveColour;
			float4 _TrunkEmissiveMask_ST;
			float4 _EmissiveMask_ST;
			float _EmissiveAmount;
			float _PulseTiling;
			float _TrunkNormalAmount;
			float _PulseSpeed;
			float _LeafMetallic;
			float _TrunkMetallic;
			float _LeafNormalAmount;
			float _LeafSmoothness;
			float _TrunkFlatColourSwitch;
			float _JitterAmount;
			float _FrostingHeight;
			float _FrostingFalloff;
			float _JitterFreq;
			float _LeafBigNoiseAmount;
			float _LeafBigNoiseScale;
			float _WindDirection;
			float _GustAmount;
			float _GustScale;
			float _GustSmallFreq;
			float _FrostingSwitch;
			float _GustLargeFreq;
			float _TotalWindAmount;
			float _Y_multiplier;
			float _ColourNoiseSmallScale;
			float _ColourNoiseLargeScale;
			float _LeafFlatColourSwitch;
			float _FrostingWorldObjectSwitch2;
			float _TrunkSmoothness;
			float _WindBaseline;
			float _AlphaClip;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _Leaves_NoiseTexture2;
			sampler2D _GustNoiseMap;
			sampler2D _LeafTex;
			sampler2D _TunkTex;
			sampler2D _EmissiveMask;
			sampler2D _Emissive2Mask;
			sampler2D _TrunkEmissiveMask;
			sampler2D _EmissivePulseMap;


			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
			float3 mod3D289( float3 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 mod3D289( float4 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 permute( float4 x ) { return mod3D289( ( x * 34.0 + 1.0 ) * x ); }
			float4 taylorInvSqrt( float4 r ) { return 1.79284291400159 - r * 0.85373472095314; }
			float snoise( float3 v )
			{
				const float2 C = float2( 1.0 / 6.0, 1.0 / 3.0 );
				float3 i = floor( v + dot( v, C.yyy ) );
				float3 x0 = v - i + dot( i, C.xxx );
				float3 g = step( x0.yzx, x0.xyz );
				float3 l = 1.0 - g;
				float3 i1 = min( g.xyz, l.zxy );
				float3 i2 = max( g.xyz, l.zxy );
				float3 x1 = x0 - i1 + C.xxx;
				float3 x2 = x0 - i2 + C.yyy;
				float3 x3 = x0 - 0.5;
				i = mod3D289( i);
				float4 p = permute( permute( permute( i.z + float4( 0.0, i1.z, i2.z, 1.0 ) ) + i.y + float4( 0.0, i1.y, i2.y, 1.0 ) ) + i.x + float4( 0.0, i1.x, i2.x, 1.0 ) );
				float4 j = p - 49.0 * floor( p / 49.0 );  // mod(p,7*7)
				float4 x_ = floor( j / 7.0 );
				float4 y_ = floor( j - 7.0 * x_ );  // mod(j,N)
				float4 x = ( x_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 y = ( y_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 h = 1.0 - abs( x ) - abs( y );
				float4 b0 = float4( x.xy, y.xy );
				float4 b1 = float4( x.zw, y.zw );
				float4 s0 = floor( b0 ) * 2.0 + 1.0;
				float4 s1 = floor( b1 ) * 2.0 + 1.0;
				float4 sh = -step( h, 0.0 );
				float4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
				float4 a1 = b1.xzyw + s1.xzyw * sh.zzww;
				float3 g0 = float3( a0.xy, h.x );
				float3 g1 = float3( a0.zw, h.y );
				float3 g2 = float3( a1.xy, h.z );
				float3 g3 = float3( a1.zw, h.w );
				float4 norm = taylorInvSqrt( float4( dot( g0, g0 ), dot( g1, g1 ), dot( g2, g2 ), dot( g3, g3 ) ) );
				g0 *= norm.x;
				g1 *= norm.y;
				g2 *= norm.z;
				g3 *= norm.w;
				float4 m = max( 0.6 - float4( dot( x0, x0 ), dot( x1, x1 ), dot( x2, x2 ), dot( x3, x3 ) ), 0.0 );
				m = m* m;
				m = m* m;
				float4 px = float4( dot( x0, g0 ), dot( x1, g1 ), dot( x2, g2 ), dot( x3, g3 ) );
				return 42.0 * dot( m, px);
			}
			
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float mulTime28 = _TimeParameters.x * (0.0 + (_JitterFreq - 0.0) * (0.06 - 0.0) / (1.0 - 0.0));
				float2 temp_cast_0 = (( v.positionOS.xyz.x + mulTime28 )).xx;
				float lerpResult50 = lerp( tex2Dlod( _Leaves_NoiseTexture2, float4( temp_cast_0, 0, 0.0) ).r , 0.0 , ( 1.0 - v.ase_color.g ));
				float3 appendResult55 = (float3(lerpResult50 , 0.0 , 0.0));
				float4 Jitter68 = CalculateContrast((0.0 + (_JitterAmount - 0.0) * (0.3 - 0.0) / (1.0 - 0.0)),float4( (appendResult55).xz, 0.0 , 0.0 ));
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float grayscale304 = Luminance(ase_worldPos);
				float3 temp_cast_2 = (grayscale304).xxx;
				float simplePerlin3D117 = snoise( temp_cast_2 );
				simplePerlin3D117 = simplePerlin3D117*0.5 + 0.5;
				float lerpResult130 = lerp( ( simplePerlin3D117 * sin( ( _LeafBigNoiseScale * ( grayscale304 + _TimeParameters.x ) ) ) ) , 0.0 , ( 1.0 - v.ase_color.g ));
				float cos103 = cos( (0.0 + (_WindDirection - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float sin103 = sin( (0.0 + (_WindDirection - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float2 rotator103 = mul( float2( 1,1 ) - float2( 0,0 ) , float2x2( cos103 , -sin103 , sin103 , cos103 )) + float2( 0,0 );
				float2 temp_output_362_0 = (ase_worldPos).xz;
				float simplePerlin2D368 = snoise( temp_output_362_0*0.05 );
				simplePerlin2D368 = simplePerlin2D368*0.5 + 0.5;
				float cos361 = cos( (0.0 + (( 1.0 - _WindDirection ) - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float sin361 = sin( (0.0 + (( 1.0 - _WindDirection ) - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float2 rotator361 = mul( temp_output_362_0 - float2( 0,0 ) , float2x2( cos361 , -sin361 , sin361 , cos361 )) + float2( 0,0 );
				float grayscale346 = Luminance(float3( rotator361 ,  0.0 ));
				float2 temp_cast_4 = (( sin( _TimeParameters.x * 0.25 ) * (0.0 + (_GustLargeFreq - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) )).xx;
				float temp_output_177_0 = ( (0.0 + (_GustAmount - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( ( ( simplePerlin2D368 * sin( ( ( grayscale346 * _GustScale ) + ( _TimeParameters.x * -(0.0 + (_GustSmallFreq - 0.0) * (10.0 - 0.0) / (1.0 - 0.0)) ) ) ) ) + 0.5 ) / 2.0 ) * ( ( tex2Dlod( _GustNoiseMap, float4( temp_cast_4, 0, 0.0) ).r + 0.5 ) / 2.0 ) );
				float lerpResult101 = lerp( ( temp_output_177_0 + _WindBaseline ) , 0.0 , ( 1.0 - v.ase_color.r ));
				float2 break99 = ( rotator103 * lerpResult101 );
				float3 appendResult100 = (float3(break99.x , 0.0 , break99.y));
				float temp_output_293_0 = (0.0 + (_TotalWindAmount - 0.0) * (2.0 - 0.0) / (1.0 - 0.0));
				float3 break169 = ( ( _LeafBigNoiseAmount * lerpResult130 ) + ( appendResult100 * temp_output_293_0 ) );
				float smoothstepResult167 = smoothstep( 0.0 , 2.0 , abs( lerpResult101 ));
				float3 appendResult168 = (float3(break169.x , ( smoothstepResult167 * _Y_multiplier * temp_output_293_0 ) , break169.z));
				float3 worldToObjDir239 = mul( GetWorldToObjectMatrix(), float4( appendResult168, 0 ) ).xyz;
				float3 Wind201 = worldToObjDir239;
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord5.xyz = ase_worldNormal;
				
				o.ase_color = v.ase_color;
				o.ase_texcoord4.xy = v.texcoord0.xy;
				o.ase_normal = v.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.zw = 0;
				o.ase_texcoord5.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( Jitter68 + float4( Wind201 , 0.0 ) ).rgb;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = positionWS;
				#endif

				o.positionCS = MetaVertexPosition( v.positionOS, v.texcoord1.xy, v.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );

				#ifdef EDITOR_VISUALIZATION
					float2 VizUV = 0;
					float4 LightCoord = 0;
					UnityEditorVizData(v.positionOS.xyz, v.texcoord0.xy, v.texcoord1.xy, v.texcoord2.xy, VizUV, LightCoord);
					o.VizUV = float4(VizUV, 0, 0);
					o.LightCoord = LightCoord;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = o.positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.texcoord0 = v.texcoord0;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.texcoord0 = patch[0].texcoord0 * bary.x + patch[1].texcoord0 * bary.y + patch[2].texcoord0 * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 uv_LeafTex = IN.ase_texcoord4.xy * _LeafTex_ST.xy + _LeafTex_ST.zw;
				float2 uv_TunkTex = IN.ase_texcoord4.xy * _TunkTex_ST.xy + _TunkTex_ST.zw;
				float4 temp_output_551_0 = ( IN.ase_color.b > 0.5 ? tex2D( _LeafTex, uv_LeafTex ) : tex2D( _TunkTex, uv_TunkTex ) );
				float3 temp_output_51_0 = ( WorldPosition * 0.5 );
				float simplePerlin3D57 = snoise( temp_output_51_0*_ColourNoiseSmallScale );
				simplePerlin3D57 = simplePerlin3D57*0.5 + 0.5;
				float3 temp_cast_0 = (simplePerlin3D57).xxx;
				float3 lerpResult60 = lerp( temp_cast_0 , sin( temp_output_51_0 ) , float3( 0,0,0 ));
				float grayscale66 = Luminance(lerpResult60);
				float4 lerpResult71 = lerp( _LeafNoiseColour , _LeafBaseColour , grayscale66);
				float4 lerpResult508 = lerp( _LeafNoiseLargeColour , float4( 0,0,0,0 ) , float4( 0,0,0,0 ));
				float3 temp_output_502_0 = ( WorldPosition * 0.5 );
				float simplePerlin3D500 = snoise( temp_output_502_0*(0.0 + (_ColourNoiseLargeScale - 0.0) * (0.2 - 0.0) / (1.0 - 0.0)) );
				simplePerlin3D500 = simplePerlin3D500*0.5 + 0.5;
				float3 temp_cast_1 = (simplePerlin3D500).xxx;
				float3 lerpResult499 = lerp( temp_cast_1 , sin( temp_output_502_0 ) , float3( 0,0,0 ));
				float grayscale498 = Luminance(lerpResult499);
				float4 lerpResult497 = lerp( lerpResult71 , lerpResult508 , grayscale498);
				float4 blendOpSrc73 = temp_output_551_0;
				float4 blendOpDest73 = lerpResult497;
				float4 lerpResult600 = lerp( max( blendOpSrc73, blendOpDest73 ) , lerpResult497 , _LeafFlatColourSwitch);
				float2 temp_output_362_0 = (WorldPosition).xz;
				float simplePerlin2D368 = snoise( temp_output_362_0*0.05 );
				simplePerlin2D368 = simplePerlin2D368*0.5 + 0.5;
				float cos361 = cos( (0.0 + (( 1.0 - _WindDirection ) - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float sin361 = sin( (0.0 + (( 1.0 - _WindDirection ) - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float2 rotator361 = mul( temp_output_362_0 - float2( 0,0 ) , float2x2( cos361 , -sin361 , sin361 , cos361 )) + float2( 0,0 );
				float grayscale346 = Luminance(float3( rotator361 ,  0.0 ));
				float2 temp_cast_3 = (( sin( _TimeParameters.x * 0.25 ) * (0.0 + (_GustLargeFreq - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) )).xx;
				float temp_output_177_0 = ( (0.0 + (_GustAmount - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( ( ( simplePerlin2D368 * sin( ( ( grayscale346 * _GustScale ) + ( _TimeParameters.x * -(0.0 + (_GustSmallFreq - 0.0) * (10.0 - 0.0) / (1.0 - 0.0)) ) ) ) ) + 0.5 ) / 2.0 ) * ( ( tex2D( _GustNoiseMap, temp_cast_3 ).r + 0.5 ) / 2.0 ) );
				float gustValue373 = temp_output_177_0;
				float4 lerpResult378 = lerp( ( _GustHighlight * gustValue373 ) , float4( 0,0,0,0 ) , ( 1.0 - IN.ase_color.g ));
				float4 temp_output_379_0 = ( lerpResult600 + lerpResult378 );
				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float lerpResult659 = lerp( ase_worldNormal.y , IN.ase_normal.y , _FrostingWorldObjectSwitch2);
				float baseValue = max(abs(lerpResult659), 1e-5);
                float4 lerpResult461 = lerp(temp_output_379_0, _FrostingColour, saturate(pow(baseValue, _FrostingHeight) * _FrostingFalloff));
				float4 lerpResult605 = lerp( temp_output_379_0 , lerpResult461 , _FrostingSwitch);
				float4 lerpResult570 = lerp( _TrunkNoiseColour , _TrunkBaseColour , grayscale66);
				float4 blendOpSrc575 = temp_output_551_0;
				float4 blendOpDest575 = lerpResult570;
				float4 lerpResult603 = lerp( max( blendOpSrc575, blendOpDest575 ) , lerpResult570 , _TrunkFlatColourSwitch);
				float4 Albedo78 = ( IN.ase_color.b > 0.5 ? lerpResult605 : lerpResult603 );
				
				float2 uv_EmissiveMask = IN.ase_texcoord4.xy * _EmissiveMask_ST.xy + _EmissiveMask_ST.zw;
				float4 lerpResult417 = lerp( _EmissiveColour , float4( 0,0,0,0 ) , ( 1.0 - tex2D( _EmissiveMask, uv_EmissiveMask ).r ));
				float2 uv_Emissive2Mask = IN.ase_texcoord4.xy * _Emissive2Mask_ST.xy + _Emissive2Mask_ST.zw;
				float4 lerpResult457 = lerp( _Emissive2Colour , float4( 0,0,0,0 ) , ( 1.0 - tex2D( _Emissive2Mask, uv_Emissive2Mask ).r ));
				float2 uv_TrunkEmissiveMask = IN.ase_texcoord4.xy * _TrunkEmissiveMask_ST.xy + _TrunkEmissiveMask_ST.zw;
				float4 lerpResult569 = lerp( _TrunkEmissiveColour , float4( 0,0,0,0 ) , ( 1.0 - tex2D( _TrunkEmissiveMask, uv_TrunkEmissiveMask ).r ));
				float2 temp_cast_5 = (_PulseTiling).xx;
				float mulTime436 = _TimeParameters.x * _PulseSpeed;
				float2 temp_cast_6 = (mulTime436).xx;
				float2 texCoord435 = IN.ase_texcoord4.xy * temp_cast_5 + temp_cast_6;
				float4 appendResult441 = (float4(WorldPosition.x , 0.0 , WorldPosition.z , 0.0));
				float mulTime430 = _TimeParameters.x * 4.0;
				float grayscale432 = Luminance(sin( ( ( appendResult441 * 0.5 ) + mulTime430 ) ).xyz);
				float clampResult444 = clamp( max( tex2D( _EmissivePulseMap, texCoord435 ).r , grayscale432 ) , 0.0 , 1.0 );
				float4 Emissive420 = ( ( IN.ase_color.b > 0.5 ? ( lerpResult417 + lerpResult457 ) : lerpResult569 ) * _EmissiveAmount * (0.5 + (clampResult444 - 0.0) * (1.0 - 0.5) / (1.0 - 0.0)) );
				
				float Alpha77 = temp_output_551_0.a;
				

				float3 BaseColor = Albedo78.rgb;
				float3 Emission = Emissive420.rgb;
				float Alpha = Alpha77;
				float AlphaClipThreshold = _AlphaClip;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = BaseColor;
				metaInput.Emission = Emission;
				#ifdef EDITOR_VISUALIZATION
					metaInput.VizUV = IN.VizUV.xy;
					metaInput.LightCoord = IN.LightCoord;
				#endif

				return UnityMetaFragment(metaInput);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007


			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_color : COLOR;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _TunkTex_ST;
			float4 _LeafNormalMap_ST;
			float4 _FrostingColour;
			float4 _GustHighlight;
			float4 _TrunkNormalMap_ST;
			float4 _LeafNoiseLargeColour;
			float4 _EmissiveColour;
			float4 _LeafBaseColour;
			float4 _LeafNoiseColour;
			float4 _TrunkBaseColour;
			float4 _LeafTex_ST;
			float4 _TrunkNoiseColour;
			float4 _Emissive2Colour;
			float4 _Emissive2Mask_ST;
			float4 _TrunkEmissiveColour;
			float4 _TrunkEmissiveMask_ST;
			float4 _EmissiveMask_ST;
			float _EmissiveAmount;
			float _PulseTiling;
			float _TrunkNormalAmount;
			float _PulseSpeed;
			float _LeafMetallic;
			float _TrunkMetallic;
			float _LeafNormalAmount;
			float _LeafSmoothness;
			float _TrunkFlatColourSwitch;
			float _JitterAmount;
			float _FrostingHeight;
			float _FrostingFalloff;
			float _JitterFreq;
			float _LeafBigNoiseAmount;
			float _LeafBigNoiseScale;
			float _WindDirection;
			float _GustAmount;
			float _GustScale;
			float _GustSmallFreq;
			float _FrostingSwitch;
			float _GustLargeFreq;
			float _TotalWindAmount;
			float _Y_multiplier;
			float _ColourNoiseSmallScale;
			float _ColourNoiseLargeScale;
			float _LeafFlatColourSwitch;
			float _FrostingWorldObjectSwitch2;
			float _TrunkSmoothness;
			float _WindBaseline;
			float _AlphaClip;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _Leaves_NoiseTexture2;
			sampler2D _GustNoiseMap;
			sampler2D _LeafTex;
			sampler2D _TunkTex;


			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
			float3 mod3D289( float3 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 mod3D289( float4 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 permute( float4 x ) { return mod3D289( ( x * 34.0 + 1.0 ) * x ); }
			float4 taylorInvSqrt( float4 r ) { return 1.79284291400159 - r * 0.85373472095314; }
			float snoise( float3 v )
			{
				const float2 C = float2( 1.0 / 6.0, 1.0 / 3.0 );
				float3 i = floor( v + dot( v, C.yyy ) );
				float3 x0 = v - i + dot( i, C.xxx );
				float3 g = step( x0.yzx, x0.xyz );
				float3 l = 1.0 - g;
				float3 i1 = min( g.xyz, l.zxy );
				float3 i2 = max( g.xyz, l.zxy );
				float3 x1 = x0 - i1 + C.xxx;
				float3 x2 = x0 - i2 + C.yyy;
				float3 x3 = x0 - 0.5;
				i = mod3D289( i);
				float4 p = permute( permute( permute( i.z + float4( 0.0, i1.z, i2.z, 1.0 ) ) + i.y + float4( 0.0, i1.y, i2.y, 1.0 ) ) + i.x + float4( 0.0, i1.x, i2.x, 1.0 ) );
				float4 j = p - 49.0 * floor( p / 49.0 );  // mod(p,7*7)
				float4 x_ = floor( j / 7.0 );
				float4 y_ = floor( j - 7.0 * x_ );  // mod(j,N)
				float4 x = ( x_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 y = ( y_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 h = 1.0 - abs( x ) - abs( y );
				float4 b0 = float4( x.xy, y.xy );
				float4 b1 = float4( x.zw, y.zw );
				float4 s0 = floor( b0 ) * 2.0 + 1.0;
				float4 s1 = floor( b1 ) * 2.0 + 1.0;
				float4 sh = -step( h, 0.0 );
				float4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
				float4 a1 = b1.xzyw + s1.xzyw * sh.zzww;
				float3 g0 = float3( a0.xy, h.x );
				float3 g1 = float3( a0.zw, h.y );
				float3 g2 = float3( a1.xy, h.z );
				float3 g3 = float3( a1.zw, h.w );
				float4 norm = taylorInvSqrt( float4( dot( g0, g0 ), dot( g1, g1 ), dot( g2, g2 ), dot( g3, g3 ) ) );
				g0 *= norm.x;
				g1 *= norm.y;
				g2 *= norm.z;
				g3 *= norm.w;
				float4 m = max( 0.6 - float4( dot( x0, x0 ), dot( x1, x1 ), dot( x2, x2 ), dot( x3, x3 ) ), 0.0 );
				m = m* m;
				m = m* m;
				float4 px = float4( dot( x0, g0 ), dot( x1, g1 ), dot( x2, g2 ), dot( x3, g3 ) );
				return 42.0 * dot( m, px);
			}
			
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float mulTime28 = _TimeParameters.x * (0.0 + (_JitterFreq - 0.0) * (0.06 - 0.0) / (1.0 - 0.0));
				float2 temp_cast_0 = (( v.positionOS.xyz.x + mulTime28 )).xx;
				float lerpResult50 = lerp( tex2Dlod( _Leaves_NoiseTexture2, float4( temp_cast_0, 0, 0.0) ).r , 0.0 , ( 1.0 - v.ase_color.g ));
				float3 appendResult55 = (float3(lerpResult50 , 0.0 , 0.0));
				float4 Jitter68 = CalculateContrast((0.0 + (_JitterAmount - 0.0) * (0.3 - 0.0) / (1.0 - 0.0)),float4( (appendResult55).xz, 0.0 , 0.0 ));
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float grayscale304 = Luminance(ase_worldPos);
				float3 temp_cast_2 = (grayscale304).xxx;
				float simplePerlin3D117 = snoise( temp_cast_2 );
				simplePerlin3D117 = simplePerlin3D117*0.5 + 0.5;
				float lerpResult130 = lerp( ( simplePerlin3D117 * sin( ( _LeafBigNoiseScale * ( grayscale304 + _TimeParameters.x ) ) ) ) , 0.0 , ( 1.0 - v.ase_color.g ));
				float cos103 = cos( (0.0 + (_WindDirection - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float sin103 = sin( (0.0 + (_WindDirection - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float2 rotator103 = mul( float2( 1,1 ) - float2( 0,0 ) , float2x2( cos103 , -sin103 , sin103 , cos103 )) + float2( 0,0 );
				float2 temp_output_362_0 = (ase_worldPos).xz;
				float simplePerlin2D368 = snoise( temp_output_362_0*0.05 );
				simplePerlin2D368 = simplePerlin2D368*0.5 + 0.5;
				float cos361 = cos( (0.0 + (( 1.0 - _WindDirection ) - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float sin361 = sin( (0.0 + (( 1.0 - _WindDirection ) - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float2 rotator361 = mul( temp_output_362_0 - float2( 0,0 ) , float2x2( cos361 , -sin361 , sin361 , cos361 )) + float2( 0,0 );
				float grayscale346 = Luminance(float3( rotator361 ,  0.0 ));
				float2 temp_cast_4 = (( sin( _TimeParameters.x * 0.25 ) * (0.0 + (_GustLargeFreq - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) )).xx;
				float temp_output_177_0 = ( (0.0 + (_GustAmount - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( ( ( simplePerlin2D368 * sin( ( ( grayscale346 * _GustScale ) + ( _TimeParameters.x * -(0.0 + (_GustSmallFreq - 0.0) * (10.0 - 0.0) / (1.0 - 0.0)) ) ) ) ) + 0.5 ) / 2.0 ) * ( ( tex2Dlod( _GustNoiseMap, float4( temp_cast_4, 0, 0.0) ).r + 0.5 ) / 2.0 ) );
				float lerpResult101 = lerp( ( temp_output_177_0 + _WindBaseline ) , 0.0 , ( 1.0 - v.ase_color.r ));
				float2 break99 = ( rotator103 * lerpResult101 );
				float3 appendResult100 = (float3(break99.x , 0.0 , break99.y));
				float temp_output_293_0 = (0.0 + (_TotalWindAmount - 0.0) * (2.0 - 0.0) / (1.0 - 0.0));
				float3 break169 = ( ( _LeafBigNoiseAmount * lerpResult130 ) + ( appendResult100 * temp_output_293_0 ) );
				float smoothstepResult167 = smoothstep( 0.0 , 2.0 , abs( lerpResult101 ));
				float3 appendResult168 = (float3(break169.x , ( smoothstepResult167 * _Y_multiplier * temp_output_293_0 ) , break169.z));
				float3 worldToObjDir239 = mul( GetWorldToObjectMatrix(), float4( appendResult168, 0 ) ).xyz;
				float3 Wind201 = worldToObjDir239;
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord3.xyz = ase_worldNormal;
				
				o.ase_color = v.ase_color;
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_normal = v.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( Jitter68 + float4( Wind201 , 0.0 ) ).rgb;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 uv_LeafTex = IN.ase_texcoord2.xy * _LeafTex_ST.xy + _LeafTex_ST.zw;
				float2 uv_TunkTex = IN.ase_texcoord2.xy * _TunkTex_ST.xy + _TunkTex_ST.zw;
				float4 temp_output_551_0 = ( IN.ase_color.b > 0.5 ? tex2D( _LeafTex, uv_LeafTex ) : tex2D( _TunkTex, uv_TunkTex ) );
				float3 temp_output_51_0 = ( WorldPosition * 0.5 );
				float simplePerlin3D57 = snoise( temp_output_51_0*_ColourNoiseSmallScale );
				simplePerlin3D57 = simplePerlin3D57*0.5 + 0.5;
				float3 temp_cast_0 = (simplePerlin3D57).xxx;
				float3 lerpResult60 = lerp( temp_cast_0 , sin( temp_output_51_0 ) , float3( 0,0,0 ));
				float grayscale66 = Luminance(lerpResult60);
				float4 lerpResult71 = lerp( _LeafNoiseColour , _LeafBaseColour , grayscale66);
				float4 lerpResult508 = lerp( _LeafNoiseLargeColour , float4( 0,0,0,0 ) , float4( 0,0,0,0 ));
				float3 temp_output_502_0 = ( WorldPosition * 0.5 );
				float simplePerlin3D500 = snoise( temp_output_502_0*(0.0 + (_ColourNoiseLargeScale - 0.0) * (0.2 - 0.0) / (1.0 - 0.0)) );
				simplePerlin3D500 = simplePerlin3D500*0.5 + 0.5;
				float3 temp_cast_1 = (simplePerlin3D500).xxx;
				float3 lerpResult499 = lerp( temp_cast_1 , sin( temp_output_502_0 ) , float3( 0,0,0 ));
				float grayscale498 = Luminance(lerpResult499);
				float4 lerpResult497 = lerp( lerpResult71 , lerpResult508 , grayscale498);
				float4 blendOpSrc73 = temp_output_551_0;
				float4 blendOpDest73 = lerpResult497;
				float4 lerpResult600 = lerp( max( blendOpSrc73, blendOpDest73 ) , lerpResult497 , _LeafFlatColourSwitch);
				float2 temp_output_362_0 = (WorldPosition).xz;
				float simplePerlin2D368 = snoise( temp_output_362_0*0.05 );
				simplePerlin2D368 = simplePerlin2D368*0.5 + 0.5;
				float cos361 = cos( (0.0 + (( 1.0 - _WindDirection ) - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float sin361 = sin( (0.0 + (( 1.0 - _WindDirection ) - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float2 rotator361 = mul( temp_output_362_0 - float2( 0,0 ) , float2x2( cos361 , -sin361 , sin361 , cos361 )) + float2( 0,0 );
				float grayscale346 = Luminance(float3( rotator361 ,  0.0 ));
				float2 temp_cast_3 = (( sin( _TimeParameters.x * 0.25 ) * (0.0 + (_GustLargeFreq - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) )).xx;
				float temp_output_177_0 = ( (0.0 + (_GustAmount - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( ( ( simplePerlin2D368 * sin( ( ( grayscale346 * _GustScale ) + ( _TimeParameters.x * -(0.0 + (_GustSmallFreq - 0.0) * (10.0 - 0.0) / (1.0 - 0.0)) ) ) ) ) + 0.5 ) / 2.0 ) * ( ( tex2D( _GustNoiseMap, temp_cast_3 ).r + 0.5 ) / 2.0 ) );
				float gustValue373 = temp_output_177_0;
				float4 lerpResult378 = lerp( ( _GustHighlight * gustValue373 ) , float4( 0,0,0,0 ) , ( 1.0 - IN.ase_color.g ));
				float4 temp_output_379_0 = ( lerpResult600 + lerpResult378 );
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float lerpResult659 = lerp( ase_worldNormal.y , IN.ase_normal.y , _FrostingWorldObjectSwitch2);
				float4 lerpResult461 = lerp(temp_output_379_0, _FrostingColour, saturate(pow(abs(lerpResult659), _FrostingHeight) * _FrostingFalloff));
				float4 lerpResult605 = lerp( temp_output_379_0 , lerpResult461 , _FrostingSwitch);
				float4 lerpResult570 = lerp( _TrunkNoiseColour , _TrunkBaseColour , grayscale66);
				float4 blendOpSrc575 = temp_output_551_0;
				float4 blendOpDest575 = lerpResult570;
				float4 lerpResult603 = lerp( max( blendOpSrc575, blendOpDest575 ) , lerpResult570 , _TrunkFlatColourSwitch);
				float4 Albedo78 = ( IN.ase_color.b > 0.5 ? lerpResult605 : lerpResult603 );
				
				float Alpha77 = temp_output_551_0.a;
				

				float3 BaseColor = Albedo78.rgb;
				float Alpha = Alpha77;
				float AlphaClipThreshold = _AlphaClip;

				half4 color = half4(BaseColor, Alpha );

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				return color;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormals" }

			ZWrite On
			Blend One Zero
			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#define ASE_FOG 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007


			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile_fragment _ _WRITE_RENDERING_LAYERS

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_COLOR


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float3 worldNormal : TEXCOORD1;
				float4 worldTangent : TEXCOORD2;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD3;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD4;
				#endif
				float4 ase_color : COLOR;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _TunkTex_ST;
			float4 _LeafNormalMap_ST;
			float4 _FrostingColour;
			float4 _GustHighlight;
			float4 _TrunkNormalMap_ST;
			float4 _LeafNoiseLargeColour;
			float4 _EmissiveColour;
			float4 _LeafBaseColour;
			float4 _LeafNoiseColour;
			float4 _TrunkBaseColour;
			float4 _LeafTex_ST;
			float4 _TrunkNoiseColour;
			float4 _Emissive2Colour;
			float4 _Emissive2Mask_ST;
			float4 _TrunkEmissiveColour;
			float4 _TrunkEmissiveMask_ST;
			float4 _EmissiveMask_ST;
			float _EmissiveAmount;
			float _PulseTiling;
			float _TrunkNormalAmount;
			float _PulseSpeed;
			float _LeafMetallic;
			float _TrunkMetallic;
			float _LeafNormalAmount;
			float _LeafSmoothness;
			float _TrunkFlatColourSwitch;
			float _JitterAmount;
			float _FrostingHeight;
			float _FrostingFalloff;
			float _JitterFreq;
			float _LeafBigNoiseAmount;
			float _LeafBigNoiseScale;
			float _WindDirection;
			float _GustAmount;
			float _GustScale;
			float _GustSmallFreq;
			float _FrostingSwitch;
			float _GustLargeFreq;
			float _TotalWindAmount;
			float _Y_multiplier;
			float _ColourNoiseSmallScale;
			float _ColourNoiseLargeScale;
			float _LeafFlatColourSwitch;
			float _FrostingWorldObjectSwitch2;
			float _TrunkSmoothness;
			float _WindBaseline;
			float _AlphaClip;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _Leaves_NoiseTexture2;
			sampler2D _GustNoiseMap;
			sampler2D _LeafNormalMap;
			sampler2D _TrunkNormalMap;
			sampler2D _LeafTex;
			sampler2D _TunkTex;


			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
			float3 mod3D289( float3 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 mod3D289( float4 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 permute( float4 x ) { return mod3D289( ( x * 34.0 + 1.0 ) * x ); }
			float4 taylorInvSqrt( float4 r ) { return 1.79284291400159 - r * 0.85373472095314; }
			float snoise( float3 v )
			{
				const float2 C = float2( 1.0 / 6.0, 1.0 / 3.0 );
				float3 i = floor( v + dot( v, C.yyy ) );
				float3 x0 = v - i + dot( i, C.xxx );
				float3 g = step( x0.yzx, x0.xyz );
				float3 l = 1.0 - g;
				float3 i1 = min( g.xyz, l.zxy );
				float3 i2 = max( g.xyz, l.zxy );
				float3 x1 = x0 - i1 + C.xxx;
				float3 x2 = x0 - i2 + C.yyy;
				float3 x3 = x0 - 0.5;
				i = mod3D289( i);
				float4 p = permute( permute( permute( i.z + float4( 0.0, i1.z, i2.z, 1.0 ) ) + i.y + float4( 0.0, i1.y, i2.y, 1.0 ) ) + i.x + float4( 0.0, i1.x, i2.x, 1.0 ) );
				float4 j = p - 49.0 * floor( p / 49.0 );  // mod(p,7*7)
				float4 x_ = floor( j / 7.0 );
				float4 y_ = floor( j - 7.0 * x_ );  // mod(j,N)
				float4 x = ( x_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 y = ( y_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 h = 1.0 - abs( x ) - abs( y );
				float4 b0 = float4( x.xy, y.xy );
				float4 b1 = float4( x.zw, y.zw );
				float4 s0 = floor( b0 ) * 2.0 + 1.0;
				float4 s1 = floor( b1 ) * 2.0 + 1.0;
				float4 sh = -step( h, 0.0 );
				float4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
				float4 a1 = b1.xzyw + s1.xzyw * sh.zzww;
				float3 g0 = float3( a0.xy, h.x );
				float3 g1 = float3( a0.zw, h.y );
				float3 g2 = float3( a1.xy, h.z );
				float3 g3 = float3( a1.zw, h.w );
				float4 norm = taylorInvSqrt( float4( dot( g0, g0 ), dot( g1, g1 ), dot( g2, g2 ), dot( g3, g3 ) ) );
				g0 *= norm.x;
				g1 *= norm.y;
				g2 *= norm.z;
				g3 *= norm.w;
				float4 m = max( 0.6 - float4( dot( x0, x0 ), dot( x1, x1 ), dot( x2, x2 ), dot( x3, x3 ) ), 0.0 );
				m = m* m;
				m = m* m;
				float4 px = float4( dot( x0, g0 ), dot( x1, g1 ), dot( x2, g2 ), dot( x3, g3 ) );
				return 42.0 * dot( m, px);
			}
			
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float mulTime28 = _TimeParameters.x * (0.0 + (_JitterFreq - 0.0) * (0.06 - 0.0) / (1.0 - 0.0));
				float2 temp_cast_0 = (( v.positionOS.xyz.x + mulTime28 )).xx;
				float lerpResult50 = lerp( tex2Dlod( _Leaves_NoiseTexture2, float4( temp_cast_0, 0, 0.0) ).r , 0.0 , ( 1.0 - v.ase_color.g ));
				float3 appendResult55 = (float3(lerpResult50 , 0.0 , 0.0));
				float4 Jitter68 = CalculateContrast((0.0 + (_JitterAmount - 0.0) * (0.3 - 0.0) / (1.0 - 0.0)),float4( (appendResult55).xz, 0.0 , 0.0 ));
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float grayscale304 = Luminance(ase_worldPos);
				float3 temp_cast_2 = (grayscale304).xxx;
				float simplePerlin3D117 = snoise( temp_cast_2 );
				simplePerlin3D117 = simplePerlin3D117*0.5 + 0.5;
				float lerpResult130 = lerp( ( simplePerlin3D117 * sin( ( _LeafBigNoiseScale * ( grayscale304 + _TimeParameters.x ) ) ) ) , 0.0 , ( 1.0 - v.ase_color.g ));
				float cos103 = cos( (0.0 + (_WindDirection - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float sin103 = sin( (0.0 + (_WindDirection - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float2 rotator103 = mul( float2( 1,1 ) - float2( 0,0 ) , float2x2( cos103 , -sin103 , sin103 , cos103 )) + float2( 0,0 );
				float2 temp_output_362_0 = (ase_worldPos).xz;
				float simplePerlin2D368 = snoise( temp_output_362_0*0.05 );
				simplePerlin2D368 = simplePerlin2D368*0.5 + 0.5;
				float cos361 = cos( (0.0 + (( 1.0 - _WindDirection ) - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float sin361 = sin( (0.0 + (( 1.0 - _WindDirection ) - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float2 rotator361 = mul( temp_output_362_0 - float2( 0,0 ) , float2x2( cos361 , -sin361 , sin361 , cos361 )) + float2( 0,0 );
				float grayscale346 = Luminance(float3( rotator361 ,  0.0 ));
				float2 temp_cast_4 = (( sin( _TimeParameters.x * 0.25 ) * (0.0 + (_GustLargeFreq - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) )).xx;
				float temp_output_177_0 = ( (0.0 + (_GustAmount - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( ( ( simplePerlin2D368 * sin( ( ( grayscale346 * _GustScale ) + ( _TimeParameters.x * -(0.0 + (_GustSmallFreq - 0.0) * (10.0 - 0.0) / (1.0 - 0.0)) ) ) ) ) + 0.5 ) / 2.0 ) * ( ( tex2Dlod( _GustNoiseMap, float4( temp_cast_4, 0, 0.0) ).r + 0.5 ) / 2.0 ) );
				float lerpResult101 = lerp( ( temp_output_177_0 + _WindBaseline ) , 0.0 , ( 1.0 - v.ase_color.r ));
				float2 break99 = ( rotator103 * lerpResult101 );
				float3 appendResult100 = (float3(break99.x , 0.0 , break99.y));
				float temp_output_293_0 = (0.0 + (_TotalWindAmount - 0.0) * (2.0 - 0.0) / (1.0 - 0.0));
				float3 break169 = ( ( _LeafBigNoiseAmount * lerpResult130 ) + ( appendResult100 * temp_output_293_0 ) );
				float smoothstepResult167 = smoothstep( 0.0 , 2.0 , abs( lerpResult101 ));
				float3 appendResult168 = (float3(break169.x , ( smoothstepResult167 * _Y_multiplier * temp_output_293_0 ) , break169.z));
				float3 worldToObjDir239 = mul( GetWorldToObjectMatrix(), float4( appendResult168, 0 ) ).xyz;
				float3 Wind201 = worldToObjDir239;
				
				o.ase_color = v.ase_color;
				o.ase_texcoord5.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( Jitter68 + float4( Wind201 , 0.0 ) ).rgb;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;
				v.tangentOS = v.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				float3 normalWS = TransformObjectToWorldNormal( v.normalOS );
				float4 tangentWS = float4( TransformObjectToWorldDir( v.tangentOS.xyz ), v.tangentOS.w );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				o.worldNormal = normalWS;
				o.worldTangent = tangentWS;

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			void frag(	VertexOutput IN
						, out half4 outNormalWS : SV_Target0
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						 )
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float3 WorldNormal = IN.worldNormal;
				float4 WorldTangent = IN.worldTangent;

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 uv_LeafNormalMap = IN.ase_texcoord5.xy * _LeafNormalMap_ST.xy + _LeafNormalMap_ST.zw;
				float3 unpack81 = UnpackNormalScale( tex2D( _LeafNormalMap, uv_LeafNormalMap ), _LeafNormalAmount );
				unpack81.z = lerp( 1, unpack81.z, saturate(_LeafNormalAmount) );
				float2 uv_TrunkNormalMap = IN.ase_texcoord5.xy * _TrunkNormalMap_ST.xy + _TrunkNormalMap_ST.zw;
				float3 unpack562 = UnpackNormalScale( tex2D( _TrunkNormalMap, uv_TrunkNormalMap ), _TrunkNormalAmount );
				unpack562.z = lerp( 1, unpack562.z, saturate(_TrunkNormalAmount) );
				
				float2 uv_LeafTex = IN.ase_texcoord5.xy * _LeafTex_ST.xy + _LeafTex_ST.zw;
				float2 uv_TunkTex = IN.ase_texcoord5.xy * _TunkTex_ST.xy + _TunkTex_ST.zw;
				float4 temp_output_551_0 = ( IN.ase_color.b > 0.5 ? tex2D( _LeafTex, uv_LeafTex ) : tex2D( _TunkTex, uv_TunkTex ) );
				float Alpha77 = temp_output_551_0.a;
				

				float3 Normal = ( IN.ase_color.b > 0.5 ? unpack81 : unpack562 );
				float Alpha = Alpha77;
				float AlphaClipThreshold = _AlphaClip;
				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#if defined(_GBUFFER_NORMALS_OCT)
					float2 octNormalWS = PackNormalOctQuadEncode(WorldNormal);
					float2 remappedOctNormalWS = saturate(octNormalWS * 0.5 + 0.5);
					half3 packedNormalWS = PackFloat2To888(remappedOctNormalWS);
					outNormalWS = half4(packedNormalWS, 0.0);
				#else
					#if defined(_NORMALMAP)
						#if _NORMAL_DROPOFF_TS
							float crossSign = (WorldTangent.w > 0.0 ? 1.0 : -1.0) * GetOddNegativeScale();
							float3 bitangent = crossSign * cross(WorldNormal.xyz, WorldTangent.xyz);
							float3 normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent.xyz, bitangent, WorldNormal.xyz));
						#elif _NORMAL_DROPOFF_OS
							float3 normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							float3 normalWS = Normal;
						#endif
					#else
						float3 normalWS = WorldNormal;
					#endif
					outNormalWS = half4(NormalizeNormalPerPixel(normalWS), 0.0);
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="UniversalGBuffer" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA
			

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007


			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			
			#pragma multi_compile_fragment _ _SHADOWS_SOFT
		
			
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _RENDER_PASS_ENABLED

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT
			#pragma multi_compile_fragment _ _WRITE_RENDERING_LAYERS

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_GBUFFER

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif
			
			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_NORMAL


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float4 lightmapUVOrVertexSH : TEXCOORD1;
				half4 fogFactorAndVertexLight : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
				float2 dynamicLightmapUV : TEXCOORD7;
				#endif
				float4 ase_color : COLOR;
				float4 ase_texcoord8 : TEXCOORD8;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _TunkTex_ST;
			float4 _LeafNormalMap_ST;
			float4 _FrostingColour;
			float4 _GustHighlight;
			float4 _TrunkNormalMap_ST;
			float4 _LeafNoiseLargeColour;
			float4 _EmissiveColour;
			float4 _LeafBaseColour;
			float4 _LeafNoiseColour;
			float4 _TrunkBaseColour;
			float4 _LeafTex_ST;
			float4 _TrunkNoiseColour;
			float4 _Emissive2Colour;
			float4 _Emissive2Mask_ST;
			float4 _TrunkEmissiveColour;
			float4 _TrunkEmissiveMask_ST;
			float4 _EmissiveMask_ST;
			float _EmissiveAmount;
			float _PulseTiling;
			float _TrunkNormalAmount;
			float _PulseSpeed;
			float _LeafMetallic;
			float _TrunkMetallic;
			float _LeafNormalAmount;
			float _LeafSmoothness;
			float _TrunkFlatColourSwitch;
			float _JitterAmount;
			float _FrostingHeight;
			float _FrostingFalloff;
			float _JitterFreq;
			float _LeafBigNoiseAmount;
			float _LeafBigNoiseScale;
			float _WindDirection;
			float _GustAmount;
			float _GustScale;
			float _GustSmallFreq;
			float _FrostingSwitch;
			float _GustLargeFreq;
			float _TotalWindAmount;
			float _Y_multiplier;
			float _ColourNoiseSmallScale;
			float _ColourNoiseLargeScale;
			float _LeafFlatColourSwitch;
			float _FrostingWorldObjectSwitch2;
			float _TrunkSmoothness;
			float _WindBaseline;
			float _AlphaClip;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _Leaves_NoiseTexture2;
			sampler2D _GustNoiseMap;
			sampler2D _LeafTex;
			sampler2D _TunkTex;
			sampler2D _LeafNormalMap;
			sampler2D _TrunkNormalMap;
			sampler2D _EmissiveMask;
			sampler2D _Emissive2Mask;
			sampler2D _TrunkEmissiveMask;
			sampler2D _EmissivePulseMap;


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
			float3 mod3D289( float3 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 mod3D289( float4 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 permute( float4 x ) { return mod3D289( ( x * 34.0 + 1.0 ) * x ); }
			float4 taylorInvSqrt( float4 r ) { return 1.79284291400159 - r * 0.85373472095314; }
			float snoise( float3 v )
			{
				const float2 C = float2( 1.0 / 6.0, 1.0 / 3.0 );
				float3 i = floor( v + dot( v, C.yyy ) );
				float3 x0 = v - i + dot( i, C.xxx );
				float3 g = step( x0.yzx, x0.xyz );
				float3 l = 1.0 - g;
				float3 i1 = min( g.xyz, l.zxy );
				float3 i2 = max( g.xyz, l.zxy );
				float3 x1 = x0 - i1 + C.xxx;
				float3 x2 = x0 - i2 + C.yyy;
				float3 x3 = x0 - 0.5;
				i = mod3D289( i);
				float4 p = permute( permute( permute( i.z + float4( 0.0, i1.z, i2.z, 1.0 ) ) + i.y + float4( 0.0, i1.y, i2.y, 1.0 ) ) + i.x + float4( 0.0, i1.x, i2.x, 1.0 ) );
				float4 j = p - 49.0 * floor( p / 49.0 );  // mod(p,7*7)
				float4 x_ = floor( j / 7.0 );
				float4 y_ = floor( j - 7.0 * x_ );  // mod(j,N)
				float4 x = ( x_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 y = ( y_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 h = 1.0 - abs( x ) - abs( y );
				float4 b0 = float4( x.xy, y.xy );
				float4 b1 = float4( x.zw, y.zw );
				float4 s0 = floor( b0 ) * 2.0 + 1.0;
				float4 s1 = floor( b1 ) * 2.0 + 1.0;
				float4 sh = -step( h, 0.0 );
				float4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
				float4 a1 = b1.xzyw + s1.xzyw * sh.zzww;
				float3 g0 = float3( a0.xy, h.x );
				float3 g1 = float3( a0.zw, h.y );
				float3 g2 = float3( a1.xy, h.z );
				float3 g3 = float3( a1.zw, h.w );
				float4 norm = taylorInvSqrt( float4( dot( g0, g0 ), dot( g1, g1 ), dot( g2, g2 ), dot( g3, g3 ) ) );
				g0 *= norm.x;
				g1 *= norm.y;
				g2 *= norm.z;
				g3 *= norm.w;
				float4 m = max( 0.6 - float4( dot( x0, x0 ), dot( x1, x1 ), dot( x2, x2 ), dot( x3, x3 ) ), 0.0 );
				m = m* m;
				m = m* m;
				float4 px = float4( dot( x0, g0 ), dot( x1, g1 ), dot( x2, g2 ), dot( x3, g3 ) );
				return 42.0 * dot( m, px);
			}
			
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float mulTime28 = _TimeParameters.x * (0.0 + (_JitterFreq - 0.0) * (0.06 - 0.0) / (1.0 - 0.0));
				float2 temp_cast_0 = (( v.positionOS.xyz.x + mulTime28 )).xx;
				float lerpResult50 = lerp( tex2Dlod( _Leaves_NoiseTexture2, float4( temp_cast_0, 0, 0.0) ).r , 0.0 , ( 1.0 - v.ase_color.g ));
				float3 appendResult55 = (float3(lerpResult50 , 0.0 , 0.0));
				float4 Jitter68 = CalculateContrast((0.0 + (_JitterAmount - 0.0) * (0.3 - 0.0) / (1.0 - 0.0)),float4( (appendResult55).xz, 0.0 , 0.0 ));
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float grayscale304 = Luminance(ase_worldPos);
				float3 temp_cast_2 = (grayscale304).xxx;
				float simplePerlin3D117 = snoise( temp_cast_2 );
				simplePerlin3D117 = simplePerlin3D117*0.5 + 0.5;
				float lerpResult130 = lerp( ( simplePerlin3D117 * sin( ( _LeafBigNoiseScale * ( grayscale304 + _TimeParameters.x ) ) ) ) , 0.0 , ( 1.0 - v.ase_color.g ));
				float cos103 = cos( (0.0 + (_WindDirection - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float sin103 = sin( (0.0 + (_WindDirection - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float2 rotator103 = mul( float2( 1,1 ) - float2( 0,0 ) , float2x2( cos103 , -sin103 , sin103 , cos103 )) + float2( 0,0 );
				float2 temp_output_362_0 = (ase_worldPos).xz;
				float simplePerlin2D368 = snoise( temp_output_362_0*0.05 );
				simplePerlin2D368 = simplePerlin2D368*0.5 + 0.5;
				float cos361 = cos( (0.0 + (( 1.0 - _WindDirection ) - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float sin361 = sin( (0.0 + (( 1.0 - _WindDirection ) - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float2 rotator361 = mul( temp_output_362_0 - float2( 0,0 ) , float2x2( cos361 , -sin361 , sin361 , cos361 )) + float2( 0,0 );
				float grayscale346 = Luminance(float3( rotator361 ,  0.0 ));
				float2 temp_cast_4 = (( sin( _TimeParameters.x * 0.25 ) * (0.0 + (_GustLargeFreq - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) )).xx;
				float temp_output_177_0 = ( (0.0 + (_GustAmount - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( ( ( simplePerlin2D368 * sin( ( ( grayscale346 * _GustScale ) + ( _TimeParameters.x * -(0.0 + (_GustSmallFreq - 0.0) * (10.0 - 0.0) / (1.0 - 0.0)) ) ) ) ) + 0.5 ) / 2.0 ) * ( ( tex2Dlod( _GustNoiseMap, float4( temp_cast_4, 0, 0.0) ).r + 0.5 ) / 2.0 ) );
				float lerpResult101 = lerp( ( temp_output_177_0 + _WindBaseline ) , 0.0 , ( 1.0 - v.ase_color.r ));
				float2 break99 = ( rotator103 * lerpResult101 );
				float3 appendResult100 = (float3(break99.x , 0.0 , break99.y));
				float temp_output_293_0 = (0.0 + (_TotalWindAmount - 0.0) * (2.0 - 0.0) / (1.0 - 0.0));
				float3 break169 = ( ( _LeafBigNoiseAmount * lerpResult130 ) + ( appendResult100 * temp_output_293_0 ) );
				float smoothstepResult167 = smoothstep( 0.0 , 2.0 , abs( lerpResult101 ));
				float3 appendResult168 = (float3(break169.x , ( smoothstepResult167 * _Y_multiplier * temp_output_293_0 ) , break169.z));
				float3 worldToObjDir239 = mul( GetWorldToObjectMatrix(), float4( appendResult168, 0 ) ).xyz;
				float3 Wind201 = worldToObjDir239;
				
				o.ase_color = v.ase_color;
				o.ase_texcoord8.xy = v.texcoord.xy;
				o.ase_normal = v.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( Jitter68 + float4( Wind201 , 0.0 ) ).rgb;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;
				v.tangentOS = v.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( v.normalOS, v.tangentOS );

				o.tSpace0 = float4( normalInput.normalWS, vertexInput.positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, vertexInput.positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, vertexInput.positionWS.z);

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV(v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy);
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if !defined(LIGHTMAP_ON)
					OUTPUT_SH(normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz);
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord.xy;
					o.lightmapUVOrVertexSH.xy = v.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( vertexInput.positionWS, normalInput.normalWS );

				o.fogFactorAndVertexLight = half4(0, vertexLight);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			FragmentOutput frag ( VertexOutput IN
								#ifdef ASE_DEPTH_WRITE_ON
								,out float outputDepth : ASE_SV_DEPTH
								#endif
								 )
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif

				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				float2 NormalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.positionCS);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#else
					ShadowCoords = float4(0, 0, 0, 0);
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float2 uv_LeafTex = IN.ase_texcoord8.xy * _LeafTex_ST.xy + _LeafTex_ST.zw;
				float2 uv_TunkTex = IN.ase_texcoord8.xy * _TunkTex_ST.xy + _TunkTex_ST.zw;
				float4 temp_output_551_0 = ( IN.ase_color.b > 0.5 ? tex2D( _LeafTex, uv_LeafTex ) : tex2D( _TunkTex, uv_TunkTex ) );
				float3 temp_output_51_0 = ( WorldPosition * 0.5 );
				float simplePerlin3D57 = snoise( temp_output_51_0*_ColourNoiseSmallScale );
				simplePerlin3D57 = simplePerlin3D57*0.5 + 0.5;
				float3 temp_cast_0 = (simplePerlin3D57).xxx;
				float3 lerpResult60 = lerp( temp_cast_0 , sin( temp_output_51_0 ) , float3( 0,0,0 ));
				float grayscale66 = Luminance(lerpResult60);
				float4 lerpResult71 = lerp( _LeafNoiseColour , _LeafBaseColour , grayscale66);
				float4 lerpResult508 = lerp( _LeafNoiseLargeColour , float4( 0,0,0,0 ) , float4( 0,0,0,0 ));
				float3 temp_output_502_0 = ( WorldPosition * 0.5 );
				float simplePerlin3D500 = snoise( temp_output_502_0*(0.0 + (_ColourNoiseLargeScale - 0.0) * (0.2 - 0.0) / (1.0 - 0.0)) );
				simplePerlin3D500 = simplePerlin3D500*0.5 + 0.5;
				float3 temp_cast_1 = (simplePerlin3D500).xxx;
				float3 lerpResult499 = lerp( temp_cast_1 , sin( temp_output_502_0 ) , float3( 0,0,0 ));
				float grayscale498 = Luminance(lerpResult499);
				float4 lerpResult497 = lerp( lerpResult71 , lerpResult508 , grayscale498);
				float4 blendOpSrc73 = temp_output_551_0;
				float4 blendOpDest73 = lerpResult497;
				float4 lerpResult600 = lerp( max( blendOpSrc73, blendOpDest73 ) , lerpResult497 , _LeafFlatColourSwitch);
				float2 temp_output_362_0 = (WorldPosition).xz;
				float simplePerlin2D368 = snoise( temp_output_362_0*0.05 );
				simplePerlin2D368 = simplePerlin2D368*0.5 + 0.5;
				float cos361 = cos( (0.0 + (( 1.0 - _WindDirection ) - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float sin361 = sin( (0.0 + (( 1.0 - _WindDirection ) - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float2 rotator361 = mul( temp_output_362_0 - float2( 0,0 ) , float2x2( cos361 , -sin361 , sin361 , cos361 )) + float2( 0,0 );
				float grayscale346 = Luminance(float3( rotator361 ,  0.0 ));
				float2 temp_cast_3 = (( sin( _TimeParameters.x * 0.25 ) * (0.0 + (_GustLargeFreq - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) )).xx;
				float temp_output_177_0 = ( (0.0 + (_GustAmount - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( ( ( simplePerlin2D368 * sin( ( ( grayscale346 * _GustScale ) + ( _TimeParameters.x * -(0.0 + (_GustSmallFreq - 0.0) * (10.0 - 0.0) / (1.0 - 0.0)) ) ) ) ) + 0.5 ) / 2.0 ) * ( ( tex2D( _GustNoiseMap, temp_cast_3 ).r + 0.5 ) / 2.0 ) );
				float gustValue373 = temp_output_177_0;
				float4 lerpResult378 = lerp( ( _GustHighlight * gustValue373 ) , float4( 0,0,0,0 ) , ( 1.0 - IN.ase_color.g ));
				float4 temp_output_379_0 = ( lerpResult600 + lerpResult378 );
				float lerpResult659 = lerp( WorldNormal.y , IN.ase_normal.y , _FrostingWorldObjectSwitch2);
				float4 lerpResult461 = lerp(temp_output_379_0, _FrostingColour, saturate(pow(abs(lerpResult659), _FrostingHeight) * _FrostingFalloff));
				float4 lerpResult605 = lerp( temp_output_379_0 , lerpResult461 , _FrostingSwitch);
				float4 lerpResult570 = lerp( _TrunkNoiseColour , _TrunkBaseColour , grayscale66);
				float4 blendOpSrc575 = temp_output_551_0;
				float4 blendOpDest575 = lerpResult570;
				float4 lerpResult603 = lerp( max( blendOpSrc575, blendOpDest575 ) , lerpResult570 , _TrunkFlatColourSwitch);
				float4 Albedo78 = ( IN.ase_color.b > 0.5 ? lerpResult605 : lerpResult603 );
				
				float2 uv_LeafNormalMap = IN.ase_texcoord8.xy * _LeafNormalMap_ST.xy + _LeafNormalMap_ST.zw;
				float3 unpack81 = UnpackNormalScale( tex2D( _LeafNormalMap, uv_LeafNormalMap ), _LeafNormalAmount );
				unpack81.z = lerp( 1, unpack81.z, saturate(_LeafNormalAmount) );
				float2 uv_TrunkNormalMap = IN.ase_texcoord8.xy * _TrunkNormalMap_ST.xy + _TrunkNormalMap_ST.zw;
				float3 unpack562 = UnpackNormalScale( tex2D( _TrunkNormalMap, uv_TrunkNormalMap ), _TrunkNormalAmount );
				unpack562.z = lerp( 1, unpack562.z, saturate(_TrunkNormalAmount) );
				
				float2 uv_EmissiveMask = IN.ase_texcoord8.xy * _EmissiveMask_ST.xy + _EmissiveMask_ST.zw;
				float4 lerpResult417 = lerp( _EmissiveColour , float4( 0,0,0,0 ) , ( 1.0 - tex2D( _EmissiveMask, uv_EmissiveMask ).r ));
				float2 uv_Emissive2Mask = IN.ase_texcoord8.xy * _Emissive2Mask_ST.xy + _Emissive2Mask_ST.zw;
				float4 lerpResult457 = lerp( _Emissive2Colour , float4( 0,0,0,0 ) , ( 1.0 - tex2D( _Emissive2Mask, uv_Emissive2Mask ).r ));
				float2 uv_TrunkEmissiveMask = IN.ase_texcoord8.xy * _TrunkEmissiveMask_ST.xy + _TrunkEmissiveMask_ST.zw;
				float4 lerpResult569 = lerp( _TrunkEmissiveColour , float4( 0,0,0,0 ) , ( 1.0 - tex2D( _TrunkEmissiveMask, uv_TrunkEmissiveMask ).r ));
				float2 temp_cast_5 = (_PulseTiling).xx;
				float mulTime436 = _TimeParameters.x * _PulseSpeed;
				float2 temp_cast_6 = (mulTime436).xx;
				float2 texCoord435 = IN.ase_texcoord8.xy * temp_cast_5 + temp_cast_6;
				float4 appendResult441 = (float4(WorldPosition.x , 0.0 , WorldPosition.z , 0.0));
				float mulTime430 = _TimeParameters.x * 4.0;
				float grayscale432 = Luminance(sin( ( ( appendResult441 * 0.5 ) + mulTime430 ) ).xyz);
				float clampResult444 = clamp( max( tex2D( _EmissivePulseMap, texCoord435 ).r , grayscale432 ) , 0.0 , 1.0 );
				float4 Emissive420 = ( ( IN.ase_color.b > 0.5 ? ( lerpResult417 + lerpResult457 ) : lerpResult569 ) * _EmissiveAmount * (0.5 + (clampResult444 - 0.0) * (1.0 - 0.5) / (1.0 - 0.0)) );
				
				float temp_output_189_0 = ( 1.0 - IN.ase_color.b );
				float lerpResult188 = lerp( _LeafMetallic , 0.0 , temp_output_189_0);
				float lerpResult195 = lerp( _TrunkMetallic , 0.0 , IN.ase_color.b);
				
				float lerpResult191 = lerp( _LeafSmoothness , 0.0 , temp_output_189_0);
				float lerpResult190 = lerp( _TrunkSmoothness , 0.0 , IN.ase_color.b);
				
				float Alpha77 = temp_output_551_0.a;
				

				float3 BaseColor = Albedo78.rgb;
				float3 Normal = ( IN.ase_color.b > 0.5 ? unpack81 : unpack562 );
				float3 Emission = Emissive420.rgb;
				float3 Specular = 0.5;
				float Metallic = ( lerpResult188 + lerpResult195 );
				float Smoothness = ( lerpResult191 + lerpResult190 );
				float Occlusion = 1;
				float Alpha = Alpha77;
				float AlphaClipThreshold = _AlphaClip;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.positionCS = IN.positionCS;
				inputData.shadowCoord = ShadowCoords;

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
						inputData.normalWS = TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal ));
					#elif _NORMAL_DROPOFF_OS
						inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
						inputData.normalWS = Normal;
					#endif
				#else
					inputData.normalWS = WorldNormal;
				#endif

				inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				inputData.viewDirectionWS = SafeNormalize( WorldViewDirection );

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#else
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
					#else
						inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );
					#endif
				#endif

				inputData.normalizedScreenSpaceUV = NormalizedScreenSpaceUV;
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = IN.dynamicLightmapUV.xy;
						#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = IN.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				#ifdef _DBUFFER
					ApplyDecal(IN.positionCS,
						BaseColor,
						Specular,
						inputData.normalWS,
						Metallic,
						Occlusion,
						Smoothness);
				#endif

				BRDFData brdfData;
				InitializeBRDFData
				(BaseColor, Metallic, Specular, Smoothness, Alpha, brdfData);

				Light mainLight = GetMainLight(inputData.shadowCoord, inputData.positionWS, inputData.shadowMask);
				half4 color;
				MixRealtimeAndBakedGI(mainLight, inputData.normalWS, inputData.bakedGI, inputData.shadowMask);
				color.rgb = GlobalIllumination(brdfData, inputData.bakedGI, Occlusion, inputData.positionWS, inputData.normalWS, inputData.viewDirectionWS);
				color.a = Alpha;

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return BRDFDataToGbuffer(brdfData, inputData, Smoothness, Emission + color.rgb, Occlusion);
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off
			AlphaToMask Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007


			#pragma vertex vert
			#pragma fragment frag

			#define SCENESELECTIONPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _TunkTex_ST;
			float4 _LeafNormalMap_ST;
			float4 _FrostingColour;
			float4 _GustHighlight;
			float4 _TrunkNormalMap_ST;
			float4 _LeafNoiseLargeColour;
			float4 _EmissiveColour;
			float4 _LeafBaseColour;
			float4 _LeafNoiseColour;
			float4 _TrunkBaseColour;
			float4 _LeafTex_ST;
			float4 _TrunkNoiseColour;
			float4 _Emissive2Colour;
			float4 _Emissive2Mask_ST;
			float4 _TrunkEmissiveColour;
			float4 _TrunkEmissiveMask_ST;
			float4 _EmissiveMask_ST;
			float _EmissiveAmount;
			float _PulseTiling;
			float _TrunkNormalAmount;
			float _PulseSpeed;
			float _LeafMetallic;
			float _TrunkMetallic;
			float _LeafNormalAmount;
			float _LeafSmoothness;
			float _TrunkFlatColourSwitch;
			float _JitterAmount;
			float _FrostingHeight;
			float _FrostingFalloff;
			float _JitterFreq;
			float _LeafBigNoiseAmount;
			float _LeafBigNoiseScale;
			float _WindDirection;
			float _GustAmount;
			float _GustScale;
			float _GustSmallFreq;
			float _FrostingSwitch;
			float _GustLargeFreq;
			float _TotalWindAmount;
			float _Y_multiplier;
			float _ColourNoiseSmallScale;
			float _ColourNoiseLargeScale;
			float _LeafFlatColourSwitch;
			float _FrostingWorldObjectSwitch2;
			float _TrunkSmoothness;
			float _WindBaseline;
			float _AlphaClip;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _Leaves_NoiseTexture2;
			sampler2D _GustNoiseMap;
			sampler2D _LeafTex;
			sampler2D _TunkTex;


			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
			float3 mod3D289( float3 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 mod3D289( float4 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 permute( float4 x ) { return mod3D289( ( x * 34.0 + 1.0 ) * x ); }
			float4 taylorInvSqrt( float4 r ) { return 1.79284291400159 - r * 0.85373472095314; }
			float snoise( float3 v )
			{
				const float2 C = float2( 1.0 / 6.0, 1.0 / 3.0 );
				float3 i = floor( v + dot( v, C.yyy ) );
				float3 x0 = v - i + dot( i, C.xxx );
				float3 g = step( x0.yzx, x0.xyz );
				float3 l = 1.0 - g;
				float3 i1 = min( g.xyz, l.zxy );
				float3 i2 = max( g.xyz, l.zxy );
				float3 x1 = x0 - i1 + C.xxx;
				float3 x2 = x0 - i2 + C.yyy;
				float3 x3 = x0 - 0.5;
				i = mod3D289( i);
				float4 p = permute( permute( permute( i.z + float4( 0.0, i1.z, i2.z, 1.0 ) ) + i.y + float4( 0.0, i1.y, i2.y, 1.0 ) ) + i.x + float4( 0.0, i1.x, i2.x, 1.0 ) );
				float4 j = p - 49.0 * floor( p / 49.0 );  // mod(p,7*7)
				float4 x_ = floor( j / 7.0 );
				float4 y_ = floor( j - 7.0 * x_ );  // mod(j,N)
				float4 x = ( x_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 y = ( y_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 h = 1.0 - abs( x ) - abs( y );
				float4 b0 = float4( x.xy, y.xy );
				float4 b1 = float4( x.zw, y.zw );
				float4 s0 = floor( b0 ) * 2.0 + 1.0;
				float4 s1 = floor( b1 ) * 2.0 + 1.0;
				float4 sh = -step( h, 0.0 );
				float4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
				float4 a1 = b1.xzyw + s1.xzyw * sh.zzww;
				float3 g0 = float3( a0.xy, h.x );
				float3 g1 = float3( a0.zw, h.y );
				float3 g2 = float3( a1.xy, h.z );
				float3 g3 = float3( a1.zw, h.w );
				float4 norm = taylorInvSqrt( float4( dot( g0, g0 ), dot( g1, g1 ), dot( g2, g2 ), dot( g3, g3 ) ) );
				g0 *= norm.x;
				g1 *= norm.y;
				g2 *= norm.z;
				g3 *= norm.w;
				float4 m = max( 0.6 - float4( dot( x0, x0 ), dot( x1, x1 ), dot( x2, x2 ), dot( x3, x3 ) ), 0.0 );
				m = m* m;
				m = m* m;
				float4 px = float4( dot( x0, g0 ), dot( x1, g1 ), dot( x2, g2 ), dot( x3, g3 ) );
				return 42.0 * dot( m, px);
			}
			
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float mulTime28 = _TimeParameters.x * (0.0 + (_JitterFreq - 0.0) * (0.06 - 0.0) / (1.0 - 0.0));
				float2 temp_cast_0 = (( v.positionOS.xyz.x + mulTime28 )).xx;
				float lerpResult50 = lerp( tex2Dlod( _Leaves_NoiseTexture2, float4( temp_cast_0, 0, 0.0) ).r , 0.0 , ( 1.0 - v.ase_color.g ));
				float3 appendResult55 = (float3(lerpResult50 , 0.0 , 0.0));
				float4 Jitter68 = CalculateContrast((0.0 + (_JitterAmount - 0.0) * (0.3 - 0.0) / (1.0 - 0.0)),float4( (appendResult55).xz, 0.0 , 0.0 ));
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float grayscale304 = Luminance(ase_worldPos);
				float3 temp_cast_2 = (grayscale304).xxx;
				float simplePerlin3D117 = snoise( temp_cast_2 );
				simplePerlin3D117 = simplePerlin3D117*0.5 + 0.5;
				float lerpResult130 = lerp( ( simplePerlin3D117 * sin( ( _LeafBigNoiseScale * ( grayscale304 + _TimeParameters.x ) ) ) ) , 0.0 , ( 1.0 - v.ase_color.g ));
				float cos103 = cos( (0.0 + (_WindDirection - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float sin103 = sin( (0.0 + (_WindDirection - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float2 rotator103 = mul( float2( 1,1 ) - float2( 0,0 ) , float2x2( cos103 , -sin103 , sin103 , cos103 )) + float2( 0,0 );
				float2 temp_output_362_0 = (ase_worldPos).xz;
				float simplePerlin2D368 = snoise( temp_output_362_0*0.05 );
				simplePerlin2D368 = simplePerlin2D368*0.5 + 0.5;
				float cos361 = cos( (0.0 + (( 1.0 - _WindDirection ) - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float sin361 = sin( (0.0 + (( 1.0 - _WindDirection ) - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float2 rotator361 = mul( temp_output_362_0 - float2( 0,0 ) , float2x2( cos361 , -sin361 , sin361 , cos361 )) + float2( 0,0 );
				float grayscale346 = Luminance(float3( rotator361 ,  0.0 ));
				float2 temp_cast_4 = (( sin( _TimeParameters.x * 0.25 ) * (0.0 + (_GustLargeFreq - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) )).xx;
				float temp_output_177_0 = ( (0.0 + (_GustAmount - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( ( ( simplePerlin2D368 * sin( ( ( grayscale346 * _GustScale ) + ( _TimeParameters.x * -(0.0 + (_GustSmallFreq - 0.0) * (10.0 - 0.0) / (1.0 - 0.0)) ) ) ) ) + 0.5 ) / 2.0 ) * ( ( tex2Dlod( _GustNoiseMap, float4( temp_cast_4, 0, 0.0) ).r + 0.5 ) / 2.0 ) );
				float lerpResult101 = lerp( ( temp_output_177_0 + _WindBaseline ) , 0.0 , ( 1.0 - v.ase_color.r ));
				float2 break99 = ( rotator103 * lerpResult101 );
				float3 appendResult100 = (float3(break99.x , 0.0 , break99.y));
				float temp_output_293_0 = (0.0 + (_TotalWindAmount - 0.0) * (2.0 - 0.0) / (1.0 - 0.0));
				float3 break169 = ( ( _LeafBigNoiseAmount * lerpResult130 ) + ( appendResult100 * temp_output_293_0 ) );
				float smoothstepResult167 = smoothstep( 0.0 , 2.0 , abs( lerpResult101 ));
				float3 appendResult168 = (float3(break169.x , ( smoothstepResult167 * _Y_multiplier * temp_output_293_0 ) , break169.z));
				float3 worldToObjDir239 = mul( GetWorldToObjectMatrix(), float4( appendResult168, 0 ) ).xyz;
				float3 Wind201 = worldToObjDir239;
				
				o.ase_color = v.ase_color;
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( Jitter68 + float4( Wind201 , 0.0 ) ).rgb;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				o.positionCS = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float2 uv_LeafTex = IN.ase_texcoord.xy * _LeafTex_ST.xy + _LeafTex_ST.zw;
				float2 uv_TunkTex = IN.ase_texcoord.xy * _TunkTex_ST.xy + _TunkTex_ST.zw;
				float4 temp_output_551_0 = ( IN.ase_color.b > 0.5 ? tex2D( _LeafTex, uv_LeafTex ) : tex2D( _TunkTex, uv_TunkTex ) );
				float Alpha77 = temp_output_551_0.a;
				

				surfaceDescription.Alpha = Alpha77;
				surfaceDescription.AlphaClipThreshold = _AlphaClip;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ScenePickingPass"
			Tags { "LightMode"="Picking" }

			AlphaToMask Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007


			#pragma vertex vert
			#pragma fragment frag

		    #define SCENEPICKINGPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _TunkTex_ST;
			float4 _LeafNormalMap_ST;
			float4 _FrostingColour;
			float4 _GustHighlight;
			float4 _TrunkNormalMap_ST;
			float4 _LeafNoiseLargeColour;
			float4 _EmissiveColour;
			float4 _LeafBaseColour;
			float4 _LeafNoiseColour;
			float4 _TrunkBaseColour;
			float4 _LeafTex_ST;
			float4 _TrunkNoiseColour;
			float4 _Emissive2Colour;
			float4 _Emissive2Mask_ST;
			float4 _TrunkEmissiveColour;
			float4 _TrunkEmissiveMask_ST;
			float4 _EmissiveMask_ST;
			float _EmissiveAmount;
			float _PulseTiling;
			float _TrunkNormalAmount;
			float _PulseSpeed;
			float _LeafMetallic;
			float _TrunkMetallic;
			float _LeafNormalAmount;
			float _LeafSmoothness;
			float _TrunkFlatColourSwitch;
			float _JitterAmount;
			float _FrostingHeight;
			float _FrostingFalloff;
			float _JitterFreq;
			float _LeafBigNoiseAmount;
			float _LeafBigNoiseScale;
			float _WindDirection;
			float _GustAmount;
			float _GustScale;
			float _GustSmallFreq;
			float _FrostingSwitch;
			float _GustLargeFreq;
			float _TotalWindAmount;
			float _Y_multiplier;
			float _ColourNoiseSmallScale;
			float _ColourNoiseLargeScale;
			float _LeafFlatColourSwitch;
			float _FrostingWorldObjectSwitch2;
			float _TrunkSmoothness;
			float _WindBaseline;
			float _AlphaClip;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _Leaves_NoiseTexture2;
			sampler2D _GustNoiseMap;
			sampler2D _LeafTex;
			sampler2D _TunkTex;


			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
			float3 mod3D289( float3 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 mod3D289( float4 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 permute( float4 x ) { return mod3D289( ( x * 34.0 + 1.0 ) * x ); }
			float4 taylorInvSqrt( float4 r ) { return 1.79284291400159 - r * 0.85373472095314; }
			float snoise( float3 v )
			{
				const float2 C = float2( 1.0 / 6.0, 1.0 / 3.0 );
				float3 i = floor( v + dot( v, C.yyy ) );
				float3 x0 = v - i + dot( i, C.xxx );
				float3 g = step( x0.yzx, x0.xyz );
				float3 l = 1.0 - g;
				float3 i1 = min( g.xyz, l.zxy );
				float3 i2 = max( g.xyz, l.zxy );
				float3 x1 = x0 - i1 + C.xxx;
				float3 x2 = x0 - i2 + C.yyy;
				float3 x3 = x0 - 0.5;
				i = mod3D289( i);
				float4 p = permute( permute( permute( i.z + float4( 0.0, i1.z, i2.z, 1.0 ) ) + i.y + float4( 0.0, i1.y, i2.y, 1.0 ) ) + i.x + float4( 0.0, i1.x, i2.x, 1.0 ) );
				float4 j = p - 49.0 * floor( p / 49.0 );  // mod(p,7*7)
				float4 x_ = floor( j / 7.0 );
				float4 y_ = floor( j - 7.0 * x_ );  // mod(j,N)
				float4 x = ( x_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 y = ( y_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 h = 1.0 - abs( x ) - abs( y );
				float4 b0 = float4( x.xy, y.xy );
				float4 b1 = float4( x.zw, y.zw );
				float4 s0 = floor( b0 ) * 2.0 + 1.0;
				float4 s1 = floor( b1 ) * 2.0 + 1.0;
				float4 sh = -step( h, 0.0 );
				float4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
				float4 a1 = b1.xzyw + s1.xzyw * sh.zzww;
				float3 g0 = float3( a0.xy, h.x );
				float3 g1 = float3( a0.zw, h.y );
				float3 g2 = float3( a1.xy, h.z );
				float3 g3 = float3( a1.zw, h.w );
				float4 norm = taylorInvSqrt( float4( dot( g0, g0 ), dot( g1, g1 ), dot( g2, g2 ), dot( g3, g3 ) ) );
				g0 *= norm.x;
				g1 *= norm.y;
				g2 *= norm.z;
				g3 *= norm.w;
				float4 m = max( 0.6 - float4( dot( x0, x0 ), dot( x1, x1 ), dot( x2, x2 ), dot( x3, x3 ) ), 0.0 );
				m = m* m;
				m = m* m;
				float4 px = float4( dot( x0, g0 ), dot( x1, g1 ), dot( x2, g2 ), dot( x3, g3 ) );
				return 42.0 * dot( m, px);
			}
			
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float mulTime28 = _TimeParameters.x * (0.0 + (_JitterFreq - 0.0) * (0.06 - 0.0) / (1.0 - 0.0));
				float2 temp_cast_0 = (( v.positionOS.xyz.x + mulTime28 )).xx;
				float lerpResult50 = lerp( tex2Dlod( _Leaves_NoiseTexture2, float4( temp_cast_0, 0, 0.0) ).r , 0.0 , ( 1.0 - v.ase_color.g ));
				float3 appendResult55 = (float3(lerpResult50 , 0.0 , 0.0));
				float4 Jitter68 = CalculateContrast((0.0 + (_JitterAmount - 0.0) * (0.3 - 0.0) / (1.0 - 0.0)),float4( (appendResult55).xz, 0.0 , 0.0 ));
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float grayscale304 = Luminance(ase_worldPos);
				float3 temp_cast_2 = (grayscale304).xxx;
				float simplePerlin3D117 = snoise( temp_cast_2 );
				simplePerlin3D117 = simplePerlin3D117*0.5 + 0.5;
				float lerpResult130 = lerp( ( simplePerlin3D117 * sin( ( _LeafBigNoiseScale * ( grayscale304 + _TimeParameters.x ) ) ) ) , 0.0 , ( 1.0 - v.ase_color.g ));
				float cos103 = cos( (0.0 + (_WindDirection - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float sin103 = sin( (0.0 + (_WindDirection - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float2 rotator103 = mul( float2( 1,1 ) - float2( 0,0 ) , float2x2( cos103 , -sin103 , sin103 , cos103 )) + float2( 0,0 );
				float2 temp_output_362_0 = (ase_worldPos).xz;
				float simplePerlin2D368 = snoise( temp_output_362_0*0.05 );
				simplePerlin2D368 = simplePerlin2D368*0.5 + 0.5;
				float cos361 = cos( (0.0 + (( 1.0 - _WindDirection ) - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float sin361 = sin( (0.0 + (( 1.0 - _WindDirection ) - 0.0) * (6.28 - 0.0) / (1.0 - 0.0)) );
				float2 rotator361 = mul( temp_output_362_0 - float2( 0,0 ) , float2x2( cos361 , -sin361 , sin361 , cos361 )) + float2( 0,0 );
				float grayscale346 = Luminance(float3( rotator361 ,  0.0 ));
				float2 temp_cast_4 = (( sin( _TimeParameters.x * 0.25 ) * (0.0 + (_GustLargeFreq - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) )).xx;
				float temp_output_177_0 = ( (0.0 + (_GustAmount - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( ( ( simplePerlin2D368 * sin( ( ( grayscale346 * _GustScale ) + ( _TimeParameters.x * -(0.0 + (_GustSmallFreq - 0.0) * (10.0 - 0.0) / (1.0 - 0.0)) ) ) ) ) + 0.5 ) / 2.0 ) * ( ( tex2Dlod( _GustNoiseMap, float4( temp_cast_4, 0, 0.0) ).r + 0.5 ) / 2.0 ) );
				float lerpResult101 = lerp( ( temp_output_177_0 + _WindBaseline ) , 0.0 , ( 1.0 - v.ase_color.r ));
				float2 break99 = ( rotator103 * lerpResult101 );
				float3 appendResult100 = (float3(break99.x , 0.0 , break99.y));
				float temp_output_293_0 = (0.0 + (_TotalWindAmount - 0.0) * (2.0 - 0.0) / (1.0 - 0.0));
				float3 break169 = ( ( _LeafBigNoiseAmount * lerpResult130 ) + ( appendResult100 * temp_output_293_0 ) );
				float smoothstepResult167 = smoothstep( 0.0 , 2.0 , abs( lerpResult101 ));
				float3 appendResult168 = (float3(break169.x , ( smoothstepResult167 * _Y_multiplier * temp_output_293_0 ) , break169.z));
				float3 worldToObjDir239 = mul( GetWorldToObjectMatrix(), float4( appendResult168, 0 ) ).xyz;
				float3 Wind201 = worldToObjDir239;
				
				o.ase_color = v.ase_color;
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( Jitter68 + float4( Wind201 , 0.0 ) ).rgb;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );
				o.positionCS = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float2 uv_LeafTex = IN.ase_texcoord.xy * _LeafTex_ST.xy + _LeafTex_ST.zw;
				float2 uv_TunkTex = IN.ase_texcoord.xy * _TunkTex_ST.xy + _TunkTex_ST.zw;
				float4 temp_output_551_0 = ( IN.ase_color.b > 0.5 ? tex2D( _LeafTex, uv_LeafTex ) : tex2D( _TunkTex, uv_TunkTex ) );
				float Alpha77 = temp_output_551_0.a;
				

				surfaceDescription.Alpha = Alpha77;
				surfaceDescription.AlphaClipThreshold = _AlphaClip;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
						clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}
		
	}
	
	CustomEditor "UnityEditor.ShaderGraphLitGUI"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}
/*ASEBEGIN
Version=19202
Node;AmplifyShaderEditor.CommentaryNode;170;-4325.497,-193.9984;Inherit;False;2691.717;1653.247;Wind;56;309;311;98;167;148;142;152;293;100;143;99;97;103;101;175;214;104;173;177;105;303;307;306;176;299;182;367;368;308;330;184;332;369;310;178;282;346;283;106;179;361;102;201;239;168;169;171;363;362;364;146;371;372;373;549;598;Wind;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;102;-3100.517,1215.123;Inherit;False;Property;_WindDirection;WindDirection;33;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;549;-4311.961,421.5781;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.OneMinusNode;364;-4268.157,811.8131;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;362;-4101.357,609.8133;Inherit;False;True;False;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TFHCRemapNode;363;-4093.657,711.3132;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;6.28;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;179;-4213.904,929.6496;Inherit;False;Property;_GustSmallFreq;GustSmallFreq;37;0;Create;True;0;0;0;False;0;False;1;0.184;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;372;-3931.502,891.8654;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;361;-3900.156,656.2133;Inherit;False;3;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;2;FLOAT;3.19;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;106;-3754.707,855.1585;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;371;-3696.277,935.6663;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCGrayscale;346;-3713.156,643.2133;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;283;-3794.424,767.774;Inherit;False;Property;_GustScale;GustScale;40;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;587;-2888.277,-1328.446;Inherit;True;Property;_Vert;Vert;54;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;309;-4102.317,1299.284;Inherit;False;Property;_GustLargeFreq;GustLargeFreq;38;0;Create;True;0;0;0;False;0;False;0.5;0.184;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;178;-3532.206,828.6497;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;282;-3522.824,684.1741;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;588;-2471.79,-1278.678;Inherit;False;VertSS;-1;True;1;0;SAMPLERSTATE;0;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.RangedFloatNode;369;-3655.809,509.1217;Inherit;False;Constant;_gustNoise;gustNoise;14;0;Create;True;0;0;0;False;0;False;0.05;0.06;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;332;-3397.799,688.0146;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinTimeNode;184;-3848.81,1070.644;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;310;-3809.417,1262.384;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;39;-1470.087,-2215.231;Inherit;False;2835.458;1702.665;Colour;64;42;66;60;57;56;52;51;47;78;77;461;493;379;481;378;494;381;73;375;495;471;492;496;377;374;71;380;70;217;218;65;63;497;498;499;500;501;502;503;504;505;506;507;508;550;551;552;553;555;570;571;572;573;575;576;577;578;593;600;601;602;603;604;605;Colour;0.004857063,1,0,1;0;0
Node;AmplifyShaderEditor.SinOpNode;330;-3269.799,699.0146;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;368;-3434.809,524.1215;Inherit;False;Simplex2D;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;308;-3675.417,1113.384;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;598;-3628.03,1297.452;Inherit;False;588;VertSS;1;0;OBJECT;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.SamplerNode;182;-3508.32,1042.211;Inherit;True;Property;_GustNoiseMap;GustNoiseMap;39;0;Create;True;0;0;0;False;0;False;-1;95228cb87bc1fcf4b8b99b626dcf102c;95228cb87bc1fcf4b8b99b626dcf102c;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;503;-1422.588,-926.1651;Inherit;False;Property;_ColourNoiseLargeScale;ColourNoiseLargeScale;21;0;Create;True;0;0;0;False;0;False;0;0.368;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;504;-1396.588,-814.1648;Inherit;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;367;-3156.379,695.6271;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;505;-1364.588,-620.1648;Inherit;False;Constant;_Float7;Float 7;19;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;299;-3040.799,701.077;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;506;-1156.709,-974.0392;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;0.2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;176;-3473.978,417.0614;Inherit;False;Property;_GustAmount;GustAmount;36;0;Create;True;0;0;0;False;0;False;0.5;0.394;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;306;-3189.917,1065.384;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;502;-1135.588,-781.1648;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;303;-3044,585.577;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;171;-4057.969,-131.5948;Inherit;False;1500;509.5001;LeafNoise;13;304;294;305;149;136;130;147;117;119;145;583;584;586;;1,1,1,1;0;0
Node;AmplifyShaderEditor.WorldPosInputsNode;47;-1415.9,-1260.184;Inherit;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SinOpNode;501;-931.5884,-737.1647;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;42;-1365.899,-1056.184;Inherit;False;Constant;_Tint_Tiling;Tint_Tiling;20;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;500;-953.5885,-859.1647;Inherit;False;Simplex3D;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;307;-3173.417,837.6841;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;311;-3175.417,449.384;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCGrayscale;304;-3967.337,175.9713;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;173;-2911.025,865.0797;Inherit;False;Property;_WindBaseline;WindBaseline;34;0;Create;True;0;0;0;False;0;False;0;0;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;52;-1395.763,-1354.44;Inherit;False;Property;_ColourNoiseSmallScale;ColourNoiseSmallScale;20;0;Create;True;0;0;0;False;0;False;0;0.748;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;499;-758.5883,-813.1648;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;51;-1173.899,-1237.184;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.VertexColorNode;105;-2982.858,989.1628;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;583;-3942.319,285.9031;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;177;-2866.602,551.0644;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;119;-3937.008,41.5755;Inherit;False;Property;_LeafBigNoiseScale;LeafBigNoiseScale;42;1;[Header];Create;True;1;LeafSway;0;0;False;0;False;1;2.35;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;459;-4044.318,1683.24;Inherit;False;2229.809;1721.533;Emissive;38;569;568;567;566;417;418;419;200;420;208;458;209;457;456;455;454;565;564;563;445;444;439;432;433;426;435;436;442;429;437;430;424;441;423;440;422;596;597;Emmisive;0,0.5021453,1,1;0;0
Node;AmplifyShaderEditor.OneMinusNode;104;-2796.674,979.7733;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;584;-3731.319,230.9031;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;56;-994.8996,-1170.184;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;175;-2614.583,793.3908;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;23;-3675.043,-902.1522;Inherit;False;1926.561;560.5865;Jitter;16;212;62;213;37;46;68;64;58;55;50;206;205;33;28;26;599;Jitter;1,0,0,1;0;0
Node;AmplifyShaderEditor.TFHCGrayscale;498;-603.5883,-814.1648;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;57;-1025.762,-1312.44;Inherit;False;Simplex3D;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;214;-2781.512,1129.085;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;6.28;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;101;-2496.217,889.6932;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;294;-3570.902,160.977;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;60;-838.7628,-1262.44;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldPosInputsNode;422;-3820.006,2045.799;Inherit;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;26;-3643.385,-562.1201;Float;False;Property;_JitterFreq;JitterFreq;44;1;[Header];Create;True;1;LeafJitter;0;0;False;0;False;0;0.575;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;590;-2456.685,-1766.82;Inherit;False;AlbedoSS;-1;True;1;0;SAMPLERSTATE;0;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.WireNode;578;-547.9069,-912.1231;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;103;-2570.594,1047.077;Inherit;False;3;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;2;FLOAT;3.19;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ColorNode;63;-1009.043,-1544.865;Inherit;False;Property;_LeafBaseColour;LeafBaseColour;13;1;[Header];Create;True;1;Colour Tinting;0;0;False;0;False;0.07843138,0.02015968,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;423;-3570.006,2254.8;Inherit;False;Constant;_Tiling;Tiling;5;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;577;-485.5064,-1251.423;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;440;-3563.298,2332.813;Inherit;False;Constant;_Float4;Float 4;37;0;Create;True;0;0;0;False;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCGrayscale;66;-677.0627,-1264.939;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;441;-3539.298,2044.814;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ColorNode;507;-441.8385,-1473.494;Inherit;False;Property;_LeafNoiseLargeColour;LeafNoiseLargeColour;15;0;Create;True;0;0;0;False;0;False;0.07843138,0.02015968,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;213;-3349.077,-574.2509;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;0.06;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;97;-2293.123,901.2636;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;117;-3593.414,-65.06544;Inherit;True;Simplex3D;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;145;-3256.822,180.5266;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;593;-1336.697,-2009.485;Inherit;False;590;AlbedoSS;1;0;OBJECT;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.SinOpNode;305;-3435.719,166.084;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;65;-1005.823,-1722.327;Inherit;False;Property;_LeafNoiseColour;LeafNoiseColour;14;0;Create;True;0;0;0;False;0;False;0.07843138,0.02015968,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;71;-648.5624,-1603.24;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;373;-2604.502,469.8654;Inherit;False;gustValue;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;430;-3390.298,2268.813;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;70;-1055.394,-2158.999;Inherit;True;Property;_LeafTex;LeafTex;1;1;[Header];Create;True;1;Leaves;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;553;-721.271,-2005.515;Inherit;False;Constant;_Float6;Float 6;46;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;33;-3177.078,-710.5203;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BreakToComponentsNode;99;-2131.289,927.0841;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.WireNode;576;-8.40616,-1315.123;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;437;-3737.298,1909.813;Inherit;False;Property;_PulseSpeed;PulseSpeed;31;0;Create;True;0;0;0;False;0;False;0.04;0.04;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;508;-165.7796,-1455.984;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleTimeNode;28;-3162.936,-542.3002;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;424;-3345.006,2070.8;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.VertexColorNode;552;-726.271,-2171.515;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;586;-3280.319,25.90314;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;143;-2200.979,1185.864;Inherit;False;Property;_TotalWindAmount;TotalWindAmount;32;1;[Header];Create;True;1;Main Wind;0;0;False;0;False;0.5;0.229;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;147;-3055.322,215.9265;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;550;-1049.25,-1955.424;Inherit;True;Property;_TunkTex;TunkTex;7;1;[Header];Create;True;1;Trunk;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;130;-2887.246,147.985;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;496;-20.08881,-1880.129;Inherit;False;Property;_FrostingHeight;FrostingHeight;49;0;Create;True;0;0;0;False;0;False;1;9.59;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;497;111.6742,-1493.029;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.VertexColorNode;374;-522.2865,-1086.493;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;380;-351.9857,-1074.794;Inherit;False;373;gustValue;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;551;-543.271,-2051.515;Inherit;False;2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;377;-350.6857,-1259.393;Inherit;False;Property;_GustHighlight;GustHighlight;41;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.135055,0.1509434,0.1288714,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;37;-2980.527,-587.4203;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;293;-1911.798,1079.777;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;205;-2815.448,-854.6243;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;136;-3001.445,42.98514;Inherit;False;Property;_LeafBigNoiseAmount;LeafBigNoiseAmount;43;0;Create;True;0;0;0;False;0;False;0.5;0.093;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;492;-62.97,-2123.653;Inherit;True;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;596;-4000.111,2987.843;Inherit;False;590;AlbedoSS;1;0;OBJECT;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.GetLocalVarNode;599;-3014.862,-422.8811;Inherit;False;588;VertSS;1;0;OBJECT;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.DynamicAppendNode;100;-1951.287,843.084;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;429;-3203.298,2141.813;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleTimeNode;436;-3556.298,1894.813;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;442;-3459.298,1795.813;Inherit;False;Property;_PulseTiling;PulseTiling;30;0;Create;True;0;0;0;False;0;False;0.03;0.03;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;73;226.2073,-1671.782;Inherit;False;Lighten;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;381;-112.787,-1170.994;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;46;-2805.407,-650.3812;Inherit;True;Property;_Leaves_NoiseTexture2;LeafJitterMap;46;0;Create;False;0;0;0;False;0;False;-1;e0595e1df515fa64fa99e3017d4ace24;e0595e1df515fa64fa99e3017d4ace24;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;454;-3717.798,2920.447;Inherit;True;Property;_Emissive2Mask;Emissive2Mask;25;0;Create;True;1;Emissive;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SinOpNode;426;-3081.006,2132.801;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.OneMinusNode;375;-337.6862,-991.5922;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;435;-3253.298,1880.813;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;0.1,0.1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;142;-1775.979,844.8641;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;601;210.7666,-1331.584;Inherit;False;Property;_LeafFlatColourSwitch;LeafFlatColourSwitch;16;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;597;-3192.977,2022.091;Inherit;False;590;AlbedoSS;1;0;OBJECT;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.PowerNode;495;182.9112,-2004.129;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;206;-2645.448,-784.6243;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;152;-2451.851,690.3052;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;149;-2674.318,127.1265;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;200;-3719.584,2630.946;Inherit;True;Property;_EmissiveMask;EmissiveMask;23;0;Create;True;1;Emissive;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;471;73.17218,-1773.063;Inherit;False;Property;_FrostingFalloff;FrostingFalloff;50;0;Create;True;1;Triplanar;0;0;False;0;False;1;4.3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;419;-3194.918,2652.3;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;50;-2480.91,-825.1333;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;566;-3637.677,3184.796;Inherit;True;Property;_TrunkEmissiveMask;TrunkEmissiveMask;28;0;Create;True;1;Emissive;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;148;-2393.851,785.3052;Inherit;False;Property;_Y_multiplier;Y_multiplier;35;0;Create;True;0;0;0;False;0;False;0.2;0.2;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;418;-3415.918,2537.3;Inherit;False;Property;_EmissiveColour;EmissiveColour;24;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;494;333.9112,-1920.129;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;218;-213.7214,-718.5309;Inherit;False;Property;_TrunkBaseColour;TrunkBaseColour;17;0;Create;True;0;0;0;False;0;False;0.07843138,0.02015968,0,0;0.07843132,0.02015968,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SmoothstepOpNode;167;-2323.851,660.3051;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;600;457.7666,-1489.584;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;456;-3416.132,2826.801;Inherit;False;Property;_Emissive2Colour;Emissive2Colour;26;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;217;-208.499,-900.8921;Inherit;False;Property;_TrunkNoiseColour;TrunkNoiseColour;18;0;Create;True;0;0;0;False;0;False;0.07843138,0.02015968,0,0;0.07843132,0.02015968,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;433;-2998.298,1902.813;Inherit;True;Property;_EmissivePulseMap;EmissivePulseMap;29;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;378;40.61205,-1137.192;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCGrayscale;432;-2941.298,2120.813;Inherit;True;0;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;455;-3195.132,2941.801;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;146;-2478.52,121.6265;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;379;625.6294,-1381.735;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;439;-2654.298,1965.813;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;570;173.9941,-845.4252;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;55;-2313.8,-854.5013;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;62;-2706.617,-433.0301;Float;False;Property;_JitterAmount;JitterAmount;45;0;Create;True;0;0;0;False;0;False;0.5;0.445;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;98;-2117.989,707.7839;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0.2;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;169;-2337.929,112.5127;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.ColorNode;481;473.7535,-2131.432;Inherit;False;Property;_FrostingColour;FrostingColour;47;1;[Header];Create;True;1;Frosting;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;457;-3016.132,2893.801;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;567;-3115.011,3206.15;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;417;-3015.918,2604.3;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;493;481.9112,-1916.129;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;568;-3336.011,3091.15;Inherit;False;Property;_TrunkEmissiveColour;TrunkEmissiveColour;27;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;212;-2382.077,-530.0507;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;0.3;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;168;-2196.93,108.5128;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;604;617.2565,-1268.986;Inherit;False;Property;_FrostingSwitch;FrostingSwitch;48;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;458;-2820.298,2711.713;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;461;720.5997,-1631.583;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;444;-2534.298,1980.813;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;563;-2839.508,2391.772;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;602;306.557,-741.8369;Inherit;False;Property;_TrunkFlatColourSwitch;TrunkFlatColourSwitch;19;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;58;-2173.172,-754.5133;Inherit;False;True;False;True;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;569;-2936.011,3158.15;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.BlendOpsNode;575;331.2945,-1027.424;Inherit;False;Lighten;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;564;-2627.999,2449.215;Inherit;False;Constant;_Float9;Float 9;46;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;445;-2389.298,2007.813;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.5;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;572;823.5282,-1158.757;Inherit;False;Constant;_Float10;Float 10;46;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;571;818.5282,-1324.757;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;209;-3411.365,2726.882;Inherit;False;Property;_EmissiveAmount;EmissiveAmount;22;1;[Header];Create;True;1;Emissive;0;0;False;0;False;0;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.TransformDirectionNode;239;-2075.393,155.1822;Inherit;False;World;Object;False;Fast;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LerpOp;603;553.5571,-898.537;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;605;857.7565,-1465.987;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.Compare;565;-2560.968,2547.936;Inherit;False;2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;64;-2186.586,-638.0032;Inherit;False;2;1;COLOR;0,0,0,0;False;0;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode;555;-383.271,-2164.515;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RegisterLocalVarNode;201;-1831.163,198.8579;Inherit;False;Wind;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;573;1041.428,-1207.557;Inherit;False;2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;208;-2270.364,2706.982;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;68;-1975.886,-607.7291;Inherit;False;Jitter;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;202;-371.1609,642.3276;Inherit;False;68;Jitter;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;420;-2080.177,2732.699;Inherit;False;Emissive;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;78;1145.75,-1531.387;Inherit;False;Albedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;203;-369.1609,729.3275;Inherit;False;201;Wind;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;77;-251.0134,-2164.854;Inherit;False;Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;194;-1041.513,291.636;Inherit;False;Property;_TrunkMetallic;TrunkMetallic;10;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;562;-917.9802,-78.95667;Inherit;True;Property;_TrunkNormalMap;TrunkNormalMap;8;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;0.5;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;193;-537.0126,488.1361;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;561;-1189.049,-58.71536;Inherit;False;Property;_TrunkNormalAmount;TrunkNormalAmount;9;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;592;-2471.79,-1535.24;Inherit;False;NormalSS;-1;True;1;0;SAMPLERSTATE;0;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.VertexColorNode;559;-847.1731,-464.6424;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;186;-1052.013,155.136;Inherit;False;Property;_LeafMetallic;LeafMetallic;4;0;Create;True;0;0;0;False;0;False;0.13;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;582;-1198.813,939.0795;Inherit;True;Property;_TrunkAmbientOcclusion;TrunkAmbientOcclusion;12;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;189;-1211.013,306.136;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;192;-1038.013,594.136;Inherit;False;Property;_TrunkSmoothness;TrunkSmoothness;11;0;Create;True;0;0;0;False;0;False;0.2;0.2;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;591;-2888.276,-1585.007;Inherit;True;Property;_Normal;Normal;52;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.GetLocalVarNode;595;-1448.45,881.4443;Inherit;False;590;AlbedoSS;1;0;OBJECT;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.RangedFloatNode;185;-1027.013,464.1361;Inherit;False;Property;_LeafSmoothness;LeafSmoothness;5;0;Create;True;0;0;0;False;0;False;0.5;0.02;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;81;-912.2821,-271.5256;Inherit;True;Property;_LeafNormalMap;LeafNormalMap;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;0.5;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;286;-1198.322,738.4786;Inherit;True;Property;_LeafAmbientOcclusion;LeafAmbientOcclusion;6;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;594;-1477.256,-121.4302;Inherit;False;592;NormalSS;1;0;OBJECT;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.LerpOp;188;-745.0126,134.136;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;421;-200.4588,209.9659;Inherit;False;420;Emissive;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;211;-1183.351,-251.2843;Inherit;False;Property;_LeafNormalAmount;LeafNormalAmount;3;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;198;-172.867,14.31301;Inherit;False;78;Albedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;558;-635.664,-407.2;Inherit;False;Constant;_Float8;Float 8;46;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;190;-743.0126,562.136;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;199;-313.867,445.3131;Inherit;False;77;Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;614;-206.3115,539.4542;Inherit;False;Property;_AlphaClip;AlphaClip;0;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;191;-744.0126,443.1361;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;196;-489.0125,245.136;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;557;-496.6338,-227.4788;Inherit;False;2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.VertexColorNode;580;-842.1299,744.319;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;195;-738.5123,273.636;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;204;-149.1609,689.3275;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.Compare;581;-659.1299,864.319;Inherit;False;2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;579;-837.1299,910.3189;Inherit;False;Constant;_Float11;Float 11;46;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;187;-1407.013,293.136;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;589;-2883.199,-1833.299;Inherit;True;Property;_Albedo;Albedo;53;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;647;41.30931,209.989;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;648;41.30931,209.989;Float;False;True;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;SyntyStudios/VegitationShader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;;0;0;Standard;40;Workflow;1;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;0;638360342256358028;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;0;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;GPU Instancing;1;0;LOD CrossFade;0;638360346599401239;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;DOTS Instancing;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;649;41.30931,209.989;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;650;41.30931,209.989;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;651;41.30931,209.989;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;652;41.30931,209.989;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;653;41.30931,209.989;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;654;41.30931,209.989;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;655;41.30931,209.989;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;656;41.30931,209.989;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.NormalVertexDataNode;657;-21.03176,-2274.628;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;658;-82.03173,-2382.628;Inherit;False;Property;_FrostingWorldObjectSwitch2;FrostingWorldObjectSwitch;51;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;659;222.9683,-2301.628;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
WireConnection;364;0;102;0
WireConnection;362;0;549;0
WireConnection;363;0;364;0
WireConnection;372;0;179;0
WireConnection;361;0;362;0
WireConnection;361;2;363;0
WireConnection;371;0;372;0
WireConnection;346;0;361;0
WireConnection;178;0;106;0
WireConnection;178;1;371;0
WireConnection;282;0;346;0
WireConnection;282;1;283;0
WireConnection;588;0;587;1
WireConnection;332;0;282;0
WireConnection;332;1;178;0
WireConnection;310;0;309;0
WireConnection;330;0;332;0
WireConnection;368;0;362;0
WireConnection;368;1;369;0
WireConnection;308;0;184;2
WireConnection;308;1;310;0
WireConnection;182;1;308;0
WireConnection;182;7;598;0
WireConnection;367;0;368;0
WireConnection;367;1;330;0
WireConnection;299;0;367;0
WireConnection;506;0;503;0
WireConnection;306;0;182;1
WireConnection;502;0;504;0
WireConnection;502;1;505;0
WireConnection;303;0;299;0
WireConnection;501;0;502;0
WireConnection;500;0;502;0
WireConnection;500;1;506;0
WireConnection;307;0;306;0
WireConnection;311;0;176;0
WireConnection;304;0;549;0
WireConnection;499;0;500;0
WireConnection;499;1;501;0
WireConnection;51;0;47;0
WireConnection;51;1;42;0
WireConnection;177;0;311;0
WireConnection;177;1;303;0
WireConnection;177;2;307;0
WireConnection;104;0;105;1
WireConnection;584;0;304;0
WireConnection;584;1;583;0
WireConnection;56;0;51;0
WireConnection;175;0;177;0
WireConnection;175;1;173;0
WireConnection;498;0;499;0
WireConnection;57;0;51;0
WireConnection;57;1;52;0
WireConnection;214;0;102;0
WireConnection;101;0;175;0
WireConnection;101;2;104;0
WireConnection;294;0;119;0
WireConnection;294;1;584;0
WireConnection;60;0;57;0
WireConnection;60;1;56;0
WireConnection;590;0;589;1
WireConnection;578;0;498;0
WireConnection;103;2;214;0
WireConnection;577;0;578;0
WireConnection;66;0;60;0
WireConnection;441;0;422;1
WireConnection;441;2;422;3
WireConnection;213;0;26;0
WireConnection;97;0;103;0
WireConnection;97;1;101;0
WireConnection;117;0;304;0
WireConnection;305;0;294;0
WireConnection;71;0;65;0
WireConnection;71;1;63;0
WireConnection;71;2;66;0
WireConnection;373;0;177;0
WireConnection;430;0;440;0
WireConnection;70;7;593;0
WireConnection;99;0;97;0
WireConnection;576;0;577;0
WireConnection;508;0;507;0
WireConnection;28;0;213;0
WireConnection;424;0;441;0
WireConnection;424;1;423;0
WireConnection;586;0;117;0
WireConnection;586;1;305;0
WireConnection;147;0;145;2
WireConnection;550;7;593;0
WireConnection;130;0;586;0
WireConnection;130;2;147;0
WireConnection;497;0;71;0
WireConnection;497;1;508;0
WireConnection;497;2;576;0
WireConnection;551;0;552;3
WireConnection;551;1;553;0
WireConnection;551;2;70;0
WireConnection;551;3;550;0
WireConnection;37;0;33;1
WireConnection;37;1;28;0
WireConnection;293;0;143;0
WireConnection;100;0;99;0
WireConnection;100;2;99;1
WireConnection;429;0;424;0
WireConnection;429;1;430;0
WireConnection;436;0;437;0
WireConnection;73;0;551;0
WireConnection;73;1;497;0
WireConnection;381;0;377;0
WireConnection;381;1;380;0
WireConnection;46;1;37;0
WireConnection;46;7;599;0
WireConnection;454;7;596;0
WireConnection;426;0;429;0
WireConnection;375;0;374;2
WireConnection;435;0;442;0
WireConnection;435;1;436;0
WireConnection;142;0;100;0
WireConnection;142;1;293;0
WireConnection;495;0;659;0
WireConnection;495;1;496;0
WireConnection;206;0;205;2
WireConnection;152;0;101;0
WireConnection;149;0;136;0
WireConnection;149;1;130;0
WireConnection;200;7;596;0
WireConnection;419;0;200;1
WireConnection;50;0;46;1
WireConnection;50;2;206;0
WireConnection;566;7;596;0
WireConnection;494;0;495;0
WireConnection;494;1;471;0
WireConnection;167;0;152;0
WireConnection;600;0;73;0
WireConnection;600;1;497;0
WireConnection;600;2;601;0
WireConnection;433;1;435;0
WireConnection;433;7;597;0
WireConnection;378;0;381;0
WireConnection;378;2;375;0
WireConnection;432;0;426;0
WireConnection;455;0;454;1
WireConnection;146;0;149;0
WireConnection;146;1;142;0
WireConnection;379;0;600;0
WireConnection;379;1;378;0
WireConnection;439;0;433;1
WireConnection;439;1;432;0
WireConnection;570;0;217;0
WireConnection;570;1;218;0
WireConnection;570;2;66;0
WireConnection;55;0;50;0
WireConnection;98;0;167;0
WireConnection;98;1;148;0
WireConnection;98;2;293;0
WireConnection;169;0;146;0
WireConnection;457;0;456;0
WireConnection;457;2;455;0
WireConnection;567;0;566;1
WireConnection;417;0;418;0
WireConnection;417;2;419;0
WireConnection;493;0;494;0
WireConnection;212;0;62;0
WireConnection;168;0;169;0
WireConnection;168;1;98;0
WireConnection;168;2;169;2
WireConnection;458;0;417;0
WireConnection;458;1;457;0
WireConnection;461;0;379;0
WireConnection;461;1;481;0
WireConnection;461;2;493;0
WireConnection;444;0;439;0
WireConnection;58;0;55;0
WireConnection;569;0;568;0
WireConnection;569;2;567;0
WireConnection;575;0;551;0
WireConnection;575;1;570;0
WireConnection;445;0;444;0
WireConnection;239;0;168;0
WireConnection;603;0;575;0
WireConnection;603;1;570;0
WireConnection;603;2;602;0
WireConnection;605;0;379;0
WireConnection;605;1;461;0
WireConnection;605;2;604;0
WireConnection;565;0;563;3
WireConnection;565;1;564;0
WireConnection;565;2;458;0
WireConnection;565;3;569;0
WireConnection;64;1;58;0
WireConnection;64;0;212;0
WireConnection;555;0;551;0
WireConnection;201;0;239;0
WireConnection;573;0;571;3
WireConnection;573;1;572;0
WireConnection;573;2;605;0
WireConnection;573;3;603;0
WireConnection;208;0;565;0
WireConnection;208;1;209;0
WireConnection;208;2;445;0
WireConnection;68;0;64;0
WireConnection;420;0;208;0
WireConnection;78;0;573;0
WireConnection;77;0;555;3
WireConnection;562;5;561;0
WireConnection;562;7;594;0
WireConnection;193;0;191;0
WireConnection;193;1;190;0
WireConnection;592;0;591;1
WireConnection;582;7;595;0
WireConnection;189;0;187;3
WireConnection;81;5;211;0
WireConnection;81;7;594;0
WireConnection;286;7;595;0
WireConnection;188;0;186;0
WireConnection;188;2;189;0
WireConnection;190;0;192;0
WireConnection;190;2;187;3
WireConnection;191;0;185;0
WireConnection;191;2;189;0
WireConnection;196;0;188;0
WireConnection;196;1;195;0
WireConnection;557;0;559;3
WireConnection;557;1;558;0
WireConnection;557;2;81;0
WireConnection;557;3;562;0
WireConnection;195;0;194;0
WireConnection;195;2;187;3
WireConnection;204;0;202;0
WireConnection;204;1;203;0
WireConnection;581;0;580;3
WireConnection;581;1;579;0
WireConnection;581;2;286;0
WireConnection;581;3;582;0
WireConnection;648;0;198;0
WireConnection;648;1;557;0
WireConnection;648;2;421;0
WireConnection;648;3;196;0
WireConnection;648;4;193;0
WireConnection;648;6;199;0
WireConnection;648;7;614;0
WireConnection;648;8;204;0
WireConnection;659;0;492;2
WireConnection;659;1;657;2
WireConnection;659;2;658;0
ASEEND*/
//CHKSM=3F5D93C0DD6A7ED173FB273EC9DFDEB3648019B3
