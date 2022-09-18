Cls
input a
gosub CODEBIN
print bin$
end


CODEBIN :
    b=5
    While b<>0
    b=int(a/2):r=a mod 2
    bin$=str$(r)+bin$
    print a,b,r
    a=b
    Wend
    Return

