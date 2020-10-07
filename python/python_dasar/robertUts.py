# total = 0
# count = 0
# while True:
#   age = int(input('Visitor age: '))
#   if (age == 0):
#     print('The number of visitor:', count)
#     print('Total cost must be paid: $',end='')
#     print(total)
#     break
#   if (age < 2):
#     total += 0
#   elif (age >= 3 and age<= 12):
#     total += 15
#   elif (age >= 60):
#     total += 20
#   else :
#     total += 25
#   count += 1

# n = int(input('N = '))
# x = n+1
# for i in range(0,n):
#   print()
#   x -= 1
#   for j in range(x,n):
#     print('-', end='')
#   print('*', end='')
# print()

# waist = float(input('Input your waist (in cm): '))
# height = float(input('Input your height (in cm): '))
# WHtR = height/

list = []

while True:
  x = int(input('Input an integer: '))
  if (x==0):
    break
  else:
    if x not in list:
      list.append(x)

for i in list:
  print(i)
