# Keyword Argument :
# 1.  If you want to combine positional argument and keyword argument
#     make sure use keyword argument after positional argument
# wrong example : greetUser(first_name="Nathan", "hutama")
# correct example : greetUser("Nathan", last_name="hutama")
def greetUser(first_name, last_name):
  print(f'Hi {first_name} {last_name}')
  print('Welcome')

greetUser(last_name="hutama", first_name="Nathan")
# greetUser("Nathan", "hutama")
