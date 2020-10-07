keys = ["Navin", "Kiran", "Harsh"]
value = ["Python", "Java", "C++"]
data = dict(zip(keys, value))
# print(data)

prog = {'JS':'Atom', 'CS':'VS', 'Python':['Pycharm', 'Sublime'], 'Java':
{'JSE':'Netbeans', 'JEE':'Eclipse'}}
# print(prog['Java']['JSE'])

customer = {
  'name' : 'John Smith',
  'age' : 30,
  'is_verified' : True
}
# jika key tdk ada akan mengembalikan 'none', tapi juga bisa diisi defaultnya spt di bwh ini
# print(customer.get('birthdate', '1 Jan 1980'))

numbers = {
  '0' : 'Zero',
  '1' : 'One',
  '2': 'Two',
  '3' : 'Three',
  '4' : 'Four',
  '5' : 'Five',
}
x = input('Phone: ')
for item in x:
  print(numbers.get(item, "!"), end=' ')
print("")