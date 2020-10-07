# Solusi Kurang GG :
# numbers = {
#   1:"one ", 2:"two ", 3:"three ", 4:"four ", 5:"five ",
#   6:"six ", 7:"seven ", 8:"eight ", 9:"nine ", 0:"zero ",
# }

# number = input('Phone : ')
# length = len(number)
# number = int(number)

# arr = [0]*length
# temp = 0
# length -= 1

# while number!=0:
#   temp = number % 10
#   arr[length] = temp
#   number = number //10
#   length -= 1

# for item in arr:
#   print(numbers[item].title(), end=" ")
# print()

# =========================================================
# solusi yg lebih GG :
phone = input('Phone : ')
digits_mapping = {
  "1":"one ", "2":"two ", "3":"three ", "4":"four ", "5":"five ",
  "6":"six ", "7":"seven ", "8":"eight ", "9":"nine ", "0":"zero ",
}
output = ""
for i in phone:
  output += digits_mapping.get(i, "!") + " "
print(output.title())
