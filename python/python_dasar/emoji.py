message = input(">")
words = message.split(' ')
emojis = {
  ":)" : "😄",
  ":(" : "😔"
}
# output = ""
# for word in words:
#   output += emojis.get(word, word) + " "
# print(output)

for word in words:
  print(emojis.get(word, word), end=' ')
print("")