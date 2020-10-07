temp = True
customer_list = ['residential', 'industrial', 'commercial', 'agricultural','charities', 'medical', 'educational']

while temp:
  customer = str(input('Type of customer : '))
  # to make lowercase
  customer = customer.lower()
  usage = int(input('Usage : '))

  if customer in customer_list:
    if customer == 'industrial' or customer == 'commercial':
      tax = 0.1
      if usage <= 6000:
        price_per_kWh = 5.3
      elif usage > 6000:
        price_per_kWh = 9.0
      total_price = price_per_kWh * usage
      tax = tax * total_price
      total_price = total_price + tax

    elif customer == 'residential':
      discount = 0
      if usage <= 2000:
        price_per_kWh = 4.8
        if usage < 100:
          discount = 0.05
      elif usage > 2000 and usage<=4000:
        price_per_kWh = 6.4
      elif usage > 4000:
        price_per_kWh = 8.0
      total_price = price_per_kWh * usage
      discount = discount * total_price
      total_price =  total_price - discount

    elif customer == 'agricultural' or customer == 'charities':
      discount = 0
      if usage <= 6000:
        price_per_kWh = 4.3
        if usage < 100:
          discount = 0.05
      elif usage > 6000:
        price_per_kWh = 5.3
      total_price = price_per_kWh * usage
      discount = discount * total_price
      total_price =  total_price - discount
      
    elif customer == 'medical' or customer == 'educational':
      if usage <= 6000:
        price_per_kWh = 2.6
      elif usage > 6000:
        price_per_kWh = 4.2
      total_price = price_per_kWh * usage
    #to print total price 
    print('total price :' ,total_price)
    # to stop the loop
    temp = False

  else:
    print('type of customer just : residential, industrial, commercial, agricultural, charities, medical, educational')
    print('')
  
  
    

