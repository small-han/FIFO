for i in range(32):
    num="{:08b}".format(i)
    if num[-6]=="0":
        print(f"^Datain[{i}]",end="")