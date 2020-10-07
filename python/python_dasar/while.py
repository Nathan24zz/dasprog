# total=0
# j=1
# while j<5:
#   total += j
#   j += 1
# print(total)

# total2=0 
# i=0
# given_list = [5,4,3,2,1]
# while i<len(given_list) and given_list[i]>0:
#   total2+=given_list[i]
#   i+=1
# print(total2)

total3=0
j=0
given_list2 = [7,5,4,4,3,1,-2,-3,-5,-7]

while j<len(given_list2)-1:
  j+=1
  if given_list2[j]>0:
    continue
  total3+=given_list2[j]
print(total3)