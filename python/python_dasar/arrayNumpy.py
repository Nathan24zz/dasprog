import numpy as np

# arr = np.array([1,2,3,4,5])
# arr = np.linspace(0,15,20)
# arr = np.arange(1,15,2)
# arr = np.logspace(1,40,5)
arr = np.zeros((5,5,3), np.uint8)   # membuat array 5x5 sebanyak 3 yg elemennnya semua 0
arr[:] = 255,10,9   # mengganti elemen array
print(arr)

