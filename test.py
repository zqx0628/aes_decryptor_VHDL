import os
check_file = open("./testbench/AES_test_cases.txt","r")
output_file = open("./vivado_project/vivado_project.sim/sim_1/behav/xsim/output.txt","r")

check_lines = check_file.readlines()[2:]
out_lines = output_file.readlines()
for i in range(len(check_lines)):
	correct_hex = check_lines[i].split()[1]
	correct = bin(int(correct_hex,16))[2:]
	for n in range(128-len(correct)):
		correct = "0"+correct

	out = out_lines[i].split()[2]
	if out == correct:
		print("NO.%d	Correct!" % (i+1))
	else:
		print("NO.%d	Wrong!" % (i+1))
os.system('pause')
