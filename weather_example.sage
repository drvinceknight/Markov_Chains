#This sage file uses the recursion relationship to obtain state probabilities on the Markov Chain example used in the notes (weather)

def weather_prob_plot(pi):
	"""
	Takes in an initial vector and outputs list of 3 lists of probabilities
	"""
	filename="weather_probabilities-%.4f-%.4f-%.4f.pdf"%(pi[0],pi[1],pi[2])
	pi=vector(pi)
	P=matrix([[.2,.5,.3],[.1,.1,.8],[.1,.2,.7]])
	data=[[pi[0]],[pi[1]],[pi[2]]]
	for n in range(10):
		pi=pi*P
		for k in range(3):
			data[k].append(pi[k])

	p=list_plot(data[0],color='blue',legend_label='Sunny',plotjoined='True')
	p+=list_plot(data[1],color='red',legend_label='Cloudy',plotjoined='True')
	p+=list_plot(data[2],color='green',legend_label='Rainy',plotjoined='True')
	p.axes_labels(['$n$','Probability'])
	p.ymax(1)
	p.ymin(0)
	p.save(filename)
	return

tests=[[1,0,0],[0,1,0],[0,0,1],[.25,.25,.5],[1/3,1/3,1/3]]
for e in tests:
	weather_prob_plot(e)
