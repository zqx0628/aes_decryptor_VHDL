from pathlib import Path
import os
import sys
import shutil

test_case = open("./testbench/AES_test_cases.txt","r")
input_file = open("./testbench/input.txt","r+")

old_file1 = Path("./vivado_project")
old_file2 = Path("./vivado.jou")
old_file3 = Path("./vivado.log")
if old_file1.exists():
	shutil.rmtree("./vivado_project")
if old_file2.exists():
	os.remove("./vivado.jou")
if old_file3.exists():
	os.remove("./vivado.log")

input_file.truncate()
lines = test_case.readlines()[2:]
for line in lines:
	vector_line = line.split()
	Ciphertext = vector_line[3]
	key = vector_line[2]
	text_bin = bin(int(Ciphertext,16))[2:]
	for n in range(128-len(text_bin)):
		text_bin = "0"+text_bin
	key_bin = bin(int(key,16))[2:]
	for n in range(128-len(key_bin)):
		key_bin = "0"+key_bin
	input_file.write(text_bin+" "+key_bin+"\n")
