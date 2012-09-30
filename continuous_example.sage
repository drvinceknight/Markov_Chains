#This sage file uses the recursion relationship to obtain state probabilities on the Continuous Markov Chain example used in the notes

def prob_plot(pi):
	filename="continuous_probabilities-%s%s%s%s.pdf"%(pi[0],pi[1],pi[2],pi[3])
	pi0=vector(pi)
	Q=matrix([[-3,1,0,2],[1,-5,4,0],[1,3,-4,0],[0,0,1,-1]])
	data=[[[0,pi0[0]]],[[0,pi0[1]]],[[0,pi0[2]]],[[0,pi0[3]]]]
	for t in range(101):
		t/=10
		pi=pi0*exp(Q*t).n()
		for k in range(4):
			data[k].append([t,pi[k]])

	p=list_plot(data[0],color='blue',legend_label='1',plotjoined='True')
	p+=list_plot(data[1],color='red',legend_label='2',plotjoined='True')
	p+=list_plot(data[2],color='green',legend_label='3',plotjoined='True')
	p+=list_plot(data[3],color='orange',legend_label='4',plotjoined='True')
	p.axes_labels(['$t$','Probability'])
	p.ymax(1)
	p.ymin(0)
	p.save(filename)
	return

tests=[[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]]
for e in tests:
	print e
	prob_plot(e)
