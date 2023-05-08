def f1():
    k=list(range(1,33))
    k.insert(0,0)
    k.insert(1,0)
    k.insert(3,0)
    k.insert(7,0)
    k.insert(15,0)
    k.insert(31,0)
    print(k)

    for par_index in range(-1,-7,-1):
        res=[]
        for idx,num in enumerate(k):
            x="{:08b}".format(idx+1)
            if x[par_index]=="1":
                if num!=0:
                    res.append(f"Datain[{num}]")
        print(f"Corr_data[{abs(par_index)}]="+"^".join(res)+";")


def f2():
    k=list(range(1,39))
    for par_index in range(-1,-7,-1):
        res=[]
        for idx,num in enumerate(k):
            x="{:08b}".format(idx+1)
            if x[par_index]=="1":
                    res.append(f"Datain_reg[{num}]")
        print(f"up_corr_data[{abs(par_index)}]="+"^".join(res)+";")

f2()