nums = [25,12,36,95,14]
# print(nums[2:])
name = ['nathan', 'jerry', 'dony']

values = [9.5, 'Nathan', 25]
# print(values)
# temp = values[0]
# values[0] = values[2]
# values[2] = temp
# print(values)

# # cara lain :
# values[0], values[2] = values[2], values[0]
# print(values)

mil = [nums, name]
# print(mil)

# nums.append(50)
# nums.insert(2,77)
# nums.pop(2)
# nums.pop()
del nums[2:]
nums.extend([29,12,14,36])
print(nums)
# nums.append ([29,12,14,36])
# print(nums[2][1])
print(min(nums))
print(max(nums))
nums.sort()
print(nums)