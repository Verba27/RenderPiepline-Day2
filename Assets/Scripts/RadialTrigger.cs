using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class RadialTrigger : MonoBehaviour
{
    public Transform targetPoint;
    public float radius = 1;
    private void OnDrawGizmos()
    {
        Vector3 vectorToTarget = targetPoint.position - transform.position;
        //Gizmos.DrawLine(transform.position, targetPoint.position);
        
        Gizmos.DrawRay(transform.position, vectorToTarget.normalized);
        Handles.color = Color.green;
        
        var dist = Mathf.Sqrt(Mathf.Pow(vectorToTarget.x, 2) + Mathf.Pow(vectorToTarget.y, 2));
        if ( dist < radius)
        {
            Handles.color = Color.red;
        }
        Handles.DrawWireDisc(transform.position, Vector3.back, radius);
    }
}
