import os
list1=[]
list2=[]
for (a,b,c) in os.walk('C:\\'):
	print(a) # a= dirpath chỉ ra những thư mục con tại ổ C
	print(b) # b= dirnames xem tên tất cả các thư mục con
	print(c) # c= name file xem têt tất cả các file con
