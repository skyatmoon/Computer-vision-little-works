function [outputimage]=myGaussfilter ( noisyimage, my9x9gausskernel, outputimage)
I = double(noisyimage);
[r, c] = size(I);
outputimage = zeros(r,c);
for i=1:r
	for j= 1:c
		for p=1:9
			for q=1:9
				if( ( (i-4+p) > 0 && (i-4+p) <= r ) && ((j-4+q)>0 && (j-4+q)<=c) )
					outputimage(i,j) =outputimage(i,j)+ my9x9gausskernel(p,q) * I(i-4+p, j-4+q);
				end
			end
        end
	end
end
outputimage=uint8(outputimage);
