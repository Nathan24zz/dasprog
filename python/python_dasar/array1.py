import numpy as np

# arr = np.array([
#   [1,2,3,6],
#   [4,5,6,7],
# ])

# arr1 = arr.flatten()          # convert multi dimensional array to single dimensional array
# arr2 = arr1.reshape(4,3)      # convert single dimensional array to 2 dimensional array
# arr2 = arr1.reshape(2,2,3)    # convert single dimensional array to 3 dimensional array

# print(arr.shape)    # give the number of rows and colums
# print(arr.size)     # give the size element of entire array
# print(arr.ndim)     # give the number of dimension

# print(arr2)

# we can make matrix from array or make it directly
# make from array
# m = np.matrix(arr)
# make directly
m1 = np.matrix('1 2 3; 6 4 5 ;1 6 7')
m2 = np.matrix('1 2 3; 6 8 5 ;2 6 7')
m3 = m1 * m2

# print(m1)
# print('')
# print(np.diagonal(m1))
# print(m1.min())

print(m3)