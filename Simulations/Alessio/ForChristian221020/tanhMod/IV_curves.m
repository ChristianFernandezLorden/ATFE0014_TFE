Vvec=-1.0:0.01:-0.8;

Ifastvec = Vvec - 2*(tanh(Vvec-0)-tanh(-0.85-0));

Ispvec = 2*(tanh(Vvec-0.5)-tanh(-0.85-0.5));

Ismvec = -0.52*(tanh(Vvec+0.5)-tanh(-0.85+0.5));

Islowvec = Ifastvec + Ispvec + Ismvec;

plot(Vvec,Ifastvec,Vvec,Islowvec)