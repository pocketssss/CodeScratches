using System.Collections.Generic;
using UnityEngine;

public static class Extension
{
    private static readonly System.Random random = new System.Random();

    #region Random
    /// <summary>
    /// Checks if a chance of a given percentage is successful.
    /// </summary>
    /// <param name="chance">The percentage chance.</param>
    /// <returns>Returns true if the chance is successful, otherwise false.</returns>
    public static bool Chance(int chance)
    {
        return (chance >= Random.Range(0, 101));
    }

    /// <summary>
    /// Checks if a chance of a given floating-point percentage is successful.
    /// </summary>
    /// <param name="chance">The floating-point percentage chance.</param>
    /// <returns>Returns true if the chance is successful, otherwise false.</returns>
    public static bool ChanceFloat(float chance)
    {
        return (chance >= Random.Range(0f, 101));
    }

    /// <summary>
    /// Returns a random number between the specified range (inclusive).
    /// For example, RandomRangeInclusive(1, 3) = 1, 2, 3.
    /// </summary>
    /// <param name="min">The minimum number of the range.</param>
    /// <param name="max">The maximum number of the range.</param>
    /// <returns>Returns a random integer within the specified range, inclusive.</returns>
    public static int RandomRangeInclusive(int min, int max)
    {
        return Random.Range(min, max + 1);
    }

    public static float RandomRangeFloatInclusive(float min, float max)
    {
        return Random.Range(min, max + 1);
    }

    /// <summary>
    /// Generates a random color.
    /// </summary>
    /// <returns>Returns a random color.</returns>
    public static Color RandomColor()
    {
        float r = Random.Range(0f, 1f);
        float g = Random.Range(0f, 1f);
        float b = Random.Range(0f, 1f);
        return new Color(r, g, b);
    }

    /// <summary>
    /// Generates a random integer within the specified range.
    /// </summary>
    /// <param name="min">The minimum value (inclusive).</param>
    /// <param name="max">The maximum value (inclusive).</param>
    /// <returns>A random integer within the specified range.</returns>
    public static int Range(int min, int max)
    {
        return random.Next(min, max + 1);
    }

    /// <summary>
    /// Generates a random floating-point number within the specified range.
    /// </summary>
    /// <param name="min">The minimum value (inclusive).</param>
    /// <param name="max">The maximum value (inclusive).</param>
    /// <returns>A random floating-point number within the specified range.</returns>
    public static float Range(float min, float max)
    {
        return (float)random.NextDouble() * (max - min) + min;
    }

    /// <summary>
    /// Generates a random floating-point number within the specified range with a specified number of decimal places.
    /// </summary>
    /// <param name="min">The minimum value (inclusive).</param>
    /// <param name="max">The maximum value (inclusive).</param>
    /// <param name="digits">The number of decimal places.</param>
    /// <returns>A random floating-point number within the specified range.</returns>
    public static float Range(float min, float max, int digits)
    {
        float value = (float)random.NextDouble() * (max - min) + min;
        float multiplier = Mathf.Pow(10f, digits);
        return Mathf.Round(value * multiplier) / multiplier;
    }



    #endregion

    #region Array

    /// <summary>
    /// Shuffles the elements in an array in a random order.
    /// </summary>
    /// <typeparam name="T">The type of array elements.</typeparam>
    /// <param name="array">The array to shuffle.</param>
    public static void Shuffle<T>(this T[] array)
    {
        if (array == null || array.Length == 0)
        {
            throw new System.ArgumentException("Array is null or empty.");
        }

        for (int i = 0; i < array.Length; i++)
        {
            int randomIndex = Random.Range(i, array.Length);
            T temp = array[randomIndex];
            array[randomIndex] = array[i];
            array[i] = temp;
        }
    }

    /// <summary>
    /// Returns a random element from the given list.
    /// </summary>
    /// <typeparam name="T">The type of elements in the list.</typeparam>
    /// <param name="list">The list to choose a random element from.</param>
    /// <returns>Returns a random element from the list.</returns>
    public static T RandomElement<T>(List<T> list)
    {
        if (list == null || list.Count == 0)
        {
            throw new System.ArgumentException("List is null or empty.");
        }
        int randomIndex = Random.Range(0, list.Count);
        return list[randomIndex];
    }

    #endregion

    #region Vector

    /// <summary>
    /// Generates a random three-dimensional vector within the specified range.
    /// </summary>
    /// <param name="min">The minimum value of the vector components.</param>
    /// <param name="max">The maximum value of the vector components.</param>
    /// <returns>Returns a random three-dimensional vector.</returns>
    public static Vector3 RandomVector3(Vector3 min, Vector3 max)
    {
        float x = Random.Range(min.x, max.x);
        float y = Random.Range(min.y, max.y);
        float z = Random.Range(min.z, max.z);
        return new Vector3(x, y, z);
    }

    /// <summary>
    /// Generates a random point on a circle with the specified radius.
    /// </summary>
    /// <param name="radius">The radius of the circle.</param>
    /// <returns>Returns a random point on the circle.</returns>
    public static Vector2 RandomPointOnCircle(float radius)
    {
        float angle = Random.Range(0f, Mathf.PI * 2);
        float x = Mathf.Cos(angle) * radius;
        float y = Mathf.Sin(angle) * radius;
        return new Vector2(x, y);
    }


    #endregion

    #region Math

    /// <summary>
    /// Checks if a point is inside a rectangle defined by its minimum and maximum points.
    /// </summary>
    /// <param name="point">The point to check.</param>
    /// <param name="rectMin">The minimum point of the rectangle.</param>
    /// <param name="rectMax">The maximum point of the rectangle.</param>
    /// <returns>Returns true if the point is inside the rectangle, otherwise false.</returns>
    public static bool IsPointInsideRectangle(Vector2 point, Vector2 rectMin, Vector2 rectMax)
    {
        return point.x >= rectMin.x && point.x <= rectMax.x && point.y >= rectMin.y && point.y <= rectMax.y;
    }

    /// <summary>
    /// Checks if a number is prime.
    /// </summary>
    /// <param name="number">The number to check.</param>
    /// <returns>Returns true if the number is prime, otherwise false.</returns>
    public static bool IsPrime(int number)
    {
        if (number <= 1)
        {
            return false;
        }
        for (int i = 2; i <= Mathf.Sqrt(number); i++)
        {
            if (number % i == 0)
            {
                return false;
            }
        }
        return true;
    }

    /// <summary>
    /// Checks if a value is close to zero within a given epsilon.
    /// </summary>
    /// <param name="value">The value to check.</param>
    /// <param name="epsilon">The maximum difference allowed to consider the value as close to zero. Defaults to 0.0001f.</param>
    /// <returns>Returns true if the value is close to zero, otherwise false.</returns>
    public static bool IsCloseToZero(float value, float epsilon = 0.0001f)
    {
        return Mathf.Abs(value) < epsilon;
    }
    #endregion

    #region Time 
    /// <summary>
    /// Converts minutes to seconds.
    /// </summary>
    /// <param name="minutes">The number of minutes to convert.</param>
    /// <returns>The equivalent number of seconds.</returns>
    public static float ConvertMinutesToSeconds(float minutes)
    {
        return minutes * 60f;
    }
    #endregion
}