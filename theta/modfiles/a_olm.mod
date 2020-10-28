COMMENT
OLM Cell

A Channel

Reference: Borgers - An Introduction to Modeling Neuronal Dynamics Chapter 9
.mod by Tyler Banks

A-current is a slowly decaying hyperpolarizing potassium current, rapidly raised by firing.

ENDCOMMENT

NEURON {
	SUFFIX a_olm
	USEION a READ ea WRITE ia
	RANGE gbar, g
	RANGE ainf, atau, binf, btau
	RANGE ia
    RANGE ainfvhalf,ainfk,binfvhalf,binfk
}

UNITS {
	(mA) = (milliamp)
	(mV) = (millivolt)
}

PARAMETER {
	gbar (siemens/cm2)
    ainfvhalf = 14
    ainfk = 16.6
	binfvhalf = 71
    binfk = 7.3
}

ASSIGNED {
	v (mV)
	ea (mV)
	ia (mA/cm2)
	ainf
	atau (ms)
	binf
	btau (ms)
	g (siemens/cm2)
}

STATE {
	a
	b
}

BREAKPOINT {
	SOLVE states METHOD cnexp
	g = gbar*a*b
	ia = g*(v-ea)
}

INITIAL {
	rate(v)
	a = ainf
	b = binf
}

DERIVATIVE states {
	rate(v)
    a' = (ainf-a)/atau
	b' = (binf-b)/btau
}

COMMENT
a_o_inf=1/(1+exp(-(v+14)/16.6));
tau_a_o=5;
b_o_inf=1/(1+exp((v+71)/7.3));
tau_b_o=1/(0.000009/exp((v-26)/28.5)+0.014/(0.2+exp(-(v+70)/11)));


ENDCOMMENT

PROCEDURE rate(v (mV)) {
	UNITSOFF
	ainf = 1/(1+exp(-(v+ainfvhalf)/ainfk))
	atau = 5 
	binf = 1/(1+exp((v+binfvhalf)/binfk))
	btau = 1/(0.000009/exp((v-26)/28.5)+0.014/(0.2+exp(-(v+70)/11)))
	UNITSON
}