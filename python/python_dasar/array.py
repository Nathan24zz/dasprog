import array as arr

# vals = arr.array('i',[5,9,8,4,3])
# vals.reverse()
# print(vals)

n = int(input("Enter lenght of array "))
value = arr.array('i',[])

for e in range(n):
  x = int(input("Enter element of array "))
  value.append(x)
print(value)

i = 0
y = int(input("Find the index of "))
for e in value:
  if y == value[i]:
    print(i)
    break
  i+=1




