function[ ]=detect(new,b)
wm=[1 1 1 1 1 1 1 1;
    1 1 2 2 2 2 1 1;
    1 1 1 2 2 1 1 1;
    1 1 1 2 2 1 1 1;
    1 1 1 2 2 1 1 1;
    1 1 1 2 2 1 1 1;
    1 1 1 2 2 1 1 1;
    1 1 1 1 1 1 1 1];
[p q r]=size(new);
c1=0;
c1=int32(c1);
for i=1:p
    for j=1:q
        c1=c1+int32(new(i,j,1));
    end
end
c2=0;
c2=int32(c2);
for i=1:8
    for j=1:8
        c2=c2+int32(wm(i,j));
    end
end
c=c1-c2;
if ((p/8)*(q/8))>10000
    c=rem(c,10000);
elseif ((p/8)*(q/8))>1000
    c=rem(c,1000);
elseif ((p/8)*(q/8))>100
    c=rem(c,100);
end
count=0;
for i=1:p/8
    for j=1:q/8
        count=count+1;
        if count==c
            break;
        end
    end
    if count==c
        break;
    end
end
i=i-1;
j=j-1;
wm1=new(i*8+1:i*8+8,j*8+1:j*8+8,1)-b;
if wm1==wm
    ('Image contains watermark')
else
    ('Image is unauthorised')
end