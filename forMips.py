def g(index):
	return "{inst_mem["+str(4*index+3)+"], inst_mem["+str(4*index+2)+"], inst_mem["+str(4*index+1)+"], inst_mem["+str(4*index)+"]}= "
def f():
	inn=open("benchmark_pure.v","r")
	out=open("out.txt","w")
	i=0
	for line in inn:
		line=line.split('\t')
		out.write(g(i)+"".join(line[1:])+'\n')
		i+=1
	inn.close()
	out.close()
if __name__=="__main__":
	f()
	