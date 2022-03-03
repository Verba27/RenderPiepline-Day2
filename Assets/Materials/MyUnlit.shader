Shader "Plytika/MyUnlit"
{
    Properties
    {
        _Color ( "My Color", Color) = ( 1,1,1,1)
        _Power ( "Color Power", float) = 0.5
        _MainTex ("Main Texture", 2D) = "white" {}
        _MyVector ( "My Vector", Vector) = (0.2, 0.3, 1.1)
    }
        
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            Cull Front
            ZTest Greater
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                UNITY_FOG_COORDS(1)
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                return fixed4(1, 1, 0, 1);
            }
            ENDCG
        }
        
        Pass
        {
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                UNITY_FOG_COORDS(1)
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex * 0.8);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                return fixed4(0, 0, 1, 1);
            }
            ENDCG
        }
    }
}
