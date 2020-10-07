# x = int(input("Enter 1st number"))
# y = int(input("Enter 2nd number"))

# result = eval(input("Enter expression "))

import sys
# input langsung saat running program
# pyhton3 input.py 6 2
# hasilnya 8
x = int(sys.argv[1])
y = int(sys.argv[2])
print(x+y)
