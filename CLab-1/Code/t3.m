face=imread('face_01_u6693651.jpg');
%%%%%
s_face=imresize(face,[512,768]);

figure(1);
subplot(121),imshow(face,'InitialMagnification','fit');
title("original version");
subplot(122),imshow(s_face,'InitialMagnification','fit');
title("(a)-resize");


%(a)
R_face=face(:,:,1);
G_face=face(:,:,2);
B_face=face(:,:,3);

figure(2);
subplot(221),imshow(face,'InitialMagnification','fit');
title("original version");
subplot(222),imshow(R_face,'InitialMagnification','fit');
title("Red channel version");
subplot(223),imshow(G_face,'InitialMagnification','fit');
title("Green channel version");
subplot(224),imshow(B_face,'InitialMagnification','fit');
title("Blue channel version");

%(b)
figure(3);
subplot(131),imhist(R_face,32);
title("Red histograms ");
subplot(132),imhist(G_face,32);
title("Green histograms ");
subplot(133),imhist(B_face,32);
title("Blue histograms ");

%(c)
eq_face=histeq(s_face);
eqR_face=histeq(s_face(:,:,1));
eqG_face=histeq(s_face(:,:,2));
eqB_face=histeq(s_face(:,:,3));

figure(4);
subplot(421),imshow(s_face);
title("reside photo histogram equalisation");
subplot(422),imhist(eq_face,64);
subplot(423),imshow(s_face(:,:,1));
title("reside photo Red histogram equalisation");
subplot(424),imhist(eqR_face,64);
subplot(425),imshow(s_face(:,:,2));
title("reside photo Green histogram equalisation");
subplot(426),imhist(eqG_face,64);
subplot(427),imshow(s_face(:,:,3));
title("reside photo Blue histogram equalisation");
subplot(428),imhist(eqB_face,64);

%(d)


