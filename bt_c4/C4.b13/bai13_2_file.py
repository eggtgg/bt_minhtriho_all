import os
name_folder=input('name folder: ')
link=os.getcwd()
os.mkdir(name_folder)
os.chdir(name_folder)
name_file= input('name file: ')
egg= open(name_file,'w')
