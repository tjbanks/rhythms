COMMENT
OLM Cell

Potassium Channel

Reference: Borgers - An Introduction to Modeling Neuronal Dynamics Chapter 34
.mod by Tyler Banks
ENDCOMMENT

NEURON {
	SUFFIX k_olm
	USEION k READ ek WRITE ik
	RANGE gbar, g
	RANGE inf, tau
	RANGE ik
    RANGE ninfvhalf,ninfk
}

UNITS {
	(mA) = (milliamp)
	(mV) = (millivolt)
}

PARAMETER {
	gbar (siemens/cm2)
    ninfvhalf = 16.08
    ninfk = -22.38
}

ASSIGNED {
	v (mV)
	ek (mV)
	ik (mA/cm2)
	g (siemens/cm2)
	inf
	tau (ms)
}

STATE {
	n
}

BREAKPOINT {
	SOLVE states METHOD cnexp
	g = gbar*n*n*n*n
	ik = g*(v-ek)
}

INITIAL {
	rate(v)
	n = inf
}

DERIVATIVE states {
	rate(v)
	n' = (inf-n)/tau
}

COMMENT

function n_e_inf=n_e_inf(v)
alpha_n=0.018*(v-25)/(1-exp(-(v-25)/25));
beta_n=0.0036*(35-v)/(1-exp(-(35-v)/12));
n_e_inf=alpha_n./(alpha_n+beta_n);

Regression fit INF
ninf = 1.0/(1.0+(exp((v+45.95)/(-27.41))))

Calculated TAU
ntau = (1 - exp(1 - v/25))*(1 - exp(v/12 - 35/12))/(-(0.45 - 0.018*v)*(1 - exp(v/12 - 35/12)) - (1 - exp(1 - v/25))*(0.0036*v - 0.126))

ENDCOMMENT

PROCEDURE rate(v (mV)) {
	UNITSOFF
	inf = 1.0/(1.0+(exp((v+ninfvhalf)/(ninfk))))   
	tau = (1 - exp(1 - v/25))*(1 - exp(v/12 - 35/12))/(-(0.45 - 0.018*v)*(1 - exp(v/12 - 35/12)) - (1 - exp(1 - v/25))*(0.0036*v - 0.126))
	UNITSON
}