#include <stdio.h>
#include <stdlib.h>

int* merge(int *left, int leftSize, int *right, int rightSize) {
  int *result = malloc(sizeof(int) * (leftSize + rightSize));
  int i = 0;
  int j = 0;
  int k = 0;

  while (i < leftSize && j < rightSize) {
    if (left[i] <= right[j]) {
      result[k++] = left[i++];
    } else {
      result[k++] = right[j++];
    }
  }

  // Append remaining elements from left and right
  while (i < leftSize) {
    result[k++] = left[i++];
  }
  while (j < rightSize) {
    result[k++] = right[j++];
  }

  return result;
}

// Always returns a new array; caller must free it.
int* mergesort(int *arr, int arrSize) {
  if (arrSize <= 1) {
    int *copy = malloc(sizeof(int) * arrSize);
    for (int i = 0; i < arrSize; i++) {
      copy[i] = arr[i];
    }
    return copy;
  }

  int mid = arrSize / 2;
  int rightSize = arrSize - mid;
  int *left = malloc(sizeof(int) * mid);
  int *right = malloc(sizeof(int) * rightSize);

  for (int i = 0; i < mid; i++) {
    left[i] = arr[i];
  }
  for (int i = 0; i < rightSize; i++) {
    right[i] = arr[i + mid];
  }

  int *sortedLeft = mergesort(left, mid);
  int *sortedRight = mergesort(right, rightSize);
  int *result = merge(sortedLeft, mid, sortedRight, rightSize);

  free(left);
  free(right);
  free(sortedLeft);
  free(sortedRight);

  return result;
}

int main() {
  int arr[] = {3, 1, 4, 1, 5, 9, 2, 6};
  int n = sizeof(arr) / sizeof(arr[0]);

  int *sorted = mergesort(arr, n);
  for (int i = 0; i < n; i++) {
    printf("%d ", sorted[i]);
  }
  printf("\n");

  free(sorted);
  return 0;
}