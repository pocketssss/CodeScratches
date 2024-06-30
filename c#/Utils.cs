using UnityEngine;

public static class Utils
{
    public static IInteractable FindNearestInteractable(float distance, Vector3 position)
    {
        Collider[] hitColliders = GetInteractableObjectsInRange(distance, position);
        IInteractable nearestInteractable = null;
        float nearestDistance = float.MaxValue;

        foreach (Collider hitCollider in hitColliders)
        {
            IInteractable interactable = hitCollider.GetComponent<IInteractable>();
            if (interactable != null)
            {
                float distanceToInteractable = Vector3.Distance(position, interactable.GetPosition());
                if (distanceToInteractable < nearestDistance)
                {
                    nearestDistance = distanceToInteractable;
                    nearestInteractable = interactable;
                }
            }
        }

        return nearestInteractable;
    }

    private static Collider[] GetInteractableObjectsInRange(float distance, Vector3 playerPosition)
    {
        Collider[] colliders = Physics.OverlapSphere(playerPosition, distance); 
        return colliders;
    }
}