# matrix = [
#   [1,2,3],
#   [4,5,6],
#   [7,8,9]
# ]

# for row in matrix:
#   for item in row:
#     print(item, end=' ')
#   print('')

numbers = [5,1,5,7,2,1]
# numbers.append(25)
# numbers.insert(1, 25)
# numbers.remove(7)
# print(numbers)

# print(numbers.index(7))
# print(numbers.count(5))

# numbers.sort()
# numbers.reverse()
# print(numbers)

# Remove the duplicates in a list
numbers1 = [2,2,4,6,3,4,6,1]
uniques = []
for x in numbers1:
  if x not in uniques:
    uniques.append(x)
print(uniques)