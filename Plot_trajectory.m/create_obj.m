VS=load('VS_133P_ROCK.TXT');
FS=load('FS_133P_ROCK.TXT');

fid = fopen('133P_ROCK.obj','w');
[m,n] = size(VS);
for i = 1:m
    fprintf(fid,'%s\t','v');
    for j = 1:n
        if(j==n)
            fprintf(fid,'%20.12f\n',VS(i,j));
        else
            fprintf(fid,'%20.12f\t',VS(i,j));
        end
    end
end
fclose(fid);
    
    
fid1 = fopen('133P_ROCK.obj','a');
[m,n] = size(FS);
for i = 1:m
    fprintf(fid1,'%s\t','f');
    for j = 1:n
        if(j==n)
            fprintf(fid1,'%g\n',FS(i,j));
        else
            fprintf(fid1,'%g\t',FS(i,j));
        end
    end
end
fclose(fid1);


