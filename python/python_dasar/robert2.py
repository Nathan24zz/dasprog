i = 1
total_price = 0
while True:
  str_i = str(i)
  while True:
    price_of_book = int(input('Price of Book '+ str_i + ': Rp. '))
    if price_of_book <= 0:
      print('Invalid book price! Book price should be greater than 0!')
    else:
      break
 
  x = 1
  while True:
    str_x = str(x)
    discount = int(input('Discount #'+str_x+' in %: '))
    if discount == 0:
      break
    elif discount > 0 and discount < 100:
      discount_price = price_of_book * discount * 0.01
      price_of_book = price_of_book - discount_price
      x += 1
    else:
      print('Invalid discount! Discount should be between 0 and 99')
 
  print('Final price of Book #' + str_i + ': Rp. ', end='') 
  print(price_of_book)
  print('')
  i += 1
  total_price = total_price + price_of_book
 
  again = input('more book (Yes/No)? ')
  if again == 'No':
    print('Total Amount: Rp. ', end='')
    print(total_price)
    break