import os

list1=[]
list2=[]
path = 'C:\\Users\\MyPC\\Documents'

print("tất cả các tệp và thư mục trong đường dẫn")
print(os.listdir(path))

for (a,b,c) in os.walk(path):
	if b!=[]:
		list2.append(b)
	if c!=[]:
		list1.append(c)

print('Tập tin:\n',list1)
print('Thư mục:\n',list2)
