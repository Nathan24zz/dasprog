import numpy as np

# x=5
# def coba():
#   global x
#   x = x + 2
#   # print(x)

# coba()

# # arr1 = np.zeros((5,5), np.uint8)
# arr = np.zeros((5,5,2), np.uint8)
# # arr1[0:3,1:3] = 5
# # arr1[0:5,0:5] = 5
# arr[:] = 5
# print(arr)

a = np.array([1,2,3,4,5,6,7,8])
b = a.reshape(4,1,2)
print(b.shape)
c = b.reshape(4,2)
print(c, c.ndim)
