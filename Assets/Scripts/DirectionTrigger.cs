using UnityEditor;
using UnityEngine;

public class DirectionTrigger : MonoBehaviour
{

    public Transform targetPoint;
    [Range(0,1)]
    public float threshold = 1;
    private void OnDrawGizmos()
    {
        Vector3 vectorToTarget = targetPoint.position - transform.position;
        var check = Vector3.Dot(transform.right, vectorToTarget.normalized);
        Gizmos.color = Color.green;

        if (check > threshold)
        {
            Gizmos.color = Color.red;
        }
        Gizmos.DrawLine(transform.position, transform.right);
        
    
    }
}
