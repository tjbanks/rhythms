COMMENT
OLM Cell

H Channel

Reference: Borgers - An Introduction to Modeling Neuronal Dynamics Chapter 18
.mod by Tyler Banks
ENDCOMMENT

NEURON {
	SUFFIX h_olm
	USEION h READ eh WRITE ih
	RANGE gbar, g
	RANGE rinf, rtau
	RANGE ih
    RANGE rinfvhalf,rinfk
}

UNITS {
	(mA) = (milliamp)
	(mV) = (millivolt)
}

PARAMETER {
	gbar (siemens/cm2)
    rinfvhalf = 84
    rinfk = 10.2
}

ASSIGNED {
	v (mV)
	eh (mV)
	ih (mA/cm2)
	rinf
	rtau (ms)
	g (siemens/cm2)
}

STATE {
	r
}

BREAKPOINT {
	SOLVE states METHOD cnexp
	g = gbar*r
	ih = g*(v-eh)
}

INITIAL {
	rate(v)
	r = rinf
}

DERIVATIVE states {
	rate(v)
    r' = (rinf-r)/rtau
}

COMMENT

r_inf=1/(1+exp((v+84)/10.2));
tau_r=1/(exp(-14.59-0.086*v)+exp(-1.87+0.0701*v));

ENDCOMMENT

PROCEDURE rate(v (mV)) {
	UNITSOFF
	rinf = 1.0/(1.0+(exp((v+rinfvhalf)/(rinfk))))
	rtau = 1/(exp(-14.59-0.086*v)+exp(-1.87+0.0701*v)) 

	UNITSON
}