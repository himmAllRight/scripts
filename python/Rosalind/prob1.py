dataFileName = "prob1Data.txt"

inData       = open(dataFileName, "r")


a = 0
c = 0
g = 0
t = 0
errors = 0

for line in inData:
  for nuc in line:
    if(nuc == "a"):
      a += 1
    if(nuc == "c"):
      c += 1
    if(nuc == "g"):
      g += 1
    if(nuc == "t"):
      t += 1
    else:
      errors += 1   

print(a, c, g, t, sep= " ")
