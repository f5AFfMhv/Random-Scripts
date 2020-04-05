#!/usr/bin/python

with open("/tmp/publicIP.tmp","r") as IPfile: 
	og_string = IPfile.read()
#print og_string

splited_string_array = og_string.split()
#print len(splited_string)

filtered_string_array=[]
for i in splited_string_array:
	filtered_string_array.append(i.replace(':', "").replace(',', "").replace('{', "")
		.replace('}', "").replace('"', "").replace(' ', ""))

filtered_string_array.pop(0)
filtered_string_array.pop(-1)

count = 0
for j in filtered_string_array:
	if j == "ip":
		IP = filtered_string_array[count+1]
	elif j == "city":
		CITY = filtered_string_array[count+1]
	elif j == "country":
		COUNTRY = filtered_string_array[count+1]
	elif j == "org":
		ORG = " ".join(filtered_string_array[count+1:-1])

	count = count + 1

print "Public IP:\t" + IP
print "Country:\t" + COUNTRY
print "City:\t\t" + CITY
print "Org.:\t\t" + ORG
