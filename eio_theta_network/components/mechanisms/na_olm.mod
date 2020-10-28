COMMENT
OLM Cell

Sodium Channel

Reference: Borgers - An Introduction to Modeling Neuronal Dynamics Chapter 34
.mod by Tyler Banks
ENDCOMMENT

NEURON {
	SUFFIX na_olm
	USEION na READ ena WRITE ina
	RANGE gbar, g
	RANGE minf, hinf, mtau, htau
	RANGE ina
    RANGE minfvhalf,minfk,hinfvhalf,hinfk
}

UNITS {
	(mA) = (milliamp)
	(mV) = (millivolt)
}

PARAMETER {
	gbar (siemens/cm2)
    minfvhalf = 38.63
    minfk = -9.48
    hinfvhalf = 60.16
    hinfk = 7.07
}

ASSIGNED {
	v (mV)
	ena (mV)
	ina (mA/cm2)
	minf
	hinf
	mtau (ms)
	htau (ms)
	g (siemens/cm2)
}

STATE {
	m h
}

BREAKPOINT {
	SOLVE states METHOD cnexp
	m = minf : See Borgers Page 32 Figure 5.1 for explaination
	g = gbar*m*m*m*h
	ina = g*(v-ena)
}

INITIAL {
	rate(v)
	m = minf
	h = hinf
}

DERIVATIVE states {
	rate(v)
	:m' = (minf-m)/mtau
	h' = (hinf-h)/htau
}

COMMENT

function m_e_inf=m_e_inf(v)
alpha_m=0.1*(v+38)./(1-exp(-(v+38)/10));
beta_m=4*(exp(-(v+65)/18));
m_e_inf=alpha_m./(alpha_m+beta_m);

function h_e_inf=h_e_inf(v)
alpha_h=0.07*exp(-(v+63)/20);
beta_h=1./(1+exp(-(v+33)/10));
h_e_inf=alpha_h./(alpha_h+beta_h);


Regression fit INF
minf = 1.0/(1.0+(exp((v+38.63)/(-9.48))))
hinf = 1.0/(1.0+(exp((v+60.16)/(7.07))))

Calculated TAU
mtau = (1 - exp(-v/10 - 19/5))/(0.1*v + 4*(1 - exp(-v/10 - 19/5))*exp(-v/18 - 65/18) + 3.8)
htau = (exp(-v/10 - 33/10) + 1)/(0.07*(exp(-v/10 - 33/10) + 1)*exp(-v/20 - 63/20) + 1)

ENDCOMMENT

PROCEDURE rate(v (mV)) {
	UNITSOFF
	minf = 1.0/(1.0+(exp((v+minfvhalf)/(minfk))))
	mtau = (1 - exp(-v/10 - 19/5))/(0.1*v + 4*(1 - exp(-v/10 - 19/5))*exp(-v/18 - 65/18) + 3.8)   

	hinf = 1.0/(1.0+(exp((v+hinfvhalf)/(hinfk))))
	htau = (exp(-v/10 - 33/10) + 1)/(0.07*(exp(-v/10 - 33/10) + 1)*exp(-v/20 - 63/20) + 1)
	UNITSON
}