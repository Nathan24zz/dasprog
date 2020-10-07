# b = [20,10,5]
# total = 0
# for e in b:
#   total += e
# print(total)

# c = list(range(1,5))
# print(c)

# total2 = 0
# for i in range(1,11):
#   total2+=i
# print(total2)

# # ngeprint jumlah kelipatan 3
# total4 = 0
# d = list(range(1,10))
# for i in d:
#   if i%3==0:
#     total4+=i
# print(total4)

# hitung jumlah dari kelipatan 3 dan 5
# yang kurang dr 100
# total3=0
# total5=0
# total15=0
# for i in range(1,100):
#   if i % 3 == 0:
#     total3+=i
#   if i % 5 == 0:
#     total5+=i
#   if i % 15 == 0:
#     total15+=i
# print(total3 + total5 - total15)

# cara lain
total = 0
for i in range(1,100):
  # if (i%3==0 or i%5==0):
  #   total+=i
  if i%3==0:
    total+=i
  elif i%5==0:
    total+=i
print(total)
