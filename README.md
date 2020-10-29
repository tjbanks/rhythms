# Brain Rhythms

Welcome to a brief introduction on modeling brain rhythms in [BMTK](https://github.com/alleninstitute/bmtk) and [NEURON](https://neuron.yale.edu). 

## Table of contents

- [[gamma]](gamma) - NEURON code for previewing a simple excitatory/inhibitory loop
  - [[modfiles/]](gamma/modfiles) - current channel definitions. COMPILE before running hoc interfaces with `nrnivmodl` or `mknrndll`
  - [`cell_tester_rtm.hoc`](gamma/cell_tester_rtm.hoc) - single RTM excitatory cell interface
  - [`cell_tester_wb.hoc`](gamma/cell_tester_wb.hoc) - single WB inhibitory cell interface
  - [`network_tester_2_cell.hoc`](gamma/network_tester_2_cell.hoc) - two cell interface, RTM/WB loop with current injection
- [[stochastic_weak_ping]](stochastic_weak_ping) - BMTK notebook for testing excitatory/inhibitory network used to generate gamma rhythms
  - [`sw_ping.ipynb`](stochastic_weak_ping/sw_ping.ipynb) - main jupyter notebook
- [[realistic_rhythm]](realistic_rhythm) - BMTK notebook for testing a 3 layer cortex network that generates gamma rhythms
  - [`realistic.ipynb`](realistic_rhythm/realistic.ipynb) - main jupyter notebook
- [[theta]](theta) - NEURON code for previewing a simple excitatory/inhibitory/OLM cells used to generate theta
  - [[modfiles/]](theta/modfiles) - current channel definitions. COMPILE before running hoc interfaces with `nrnivmodl` or `mknrndll`
  - [`cell_tester_rtm.hoc`](theta/cell_tester_rtm.hoc) - single RTM excitatory cell interface
  - [`cell_tester_wb.hoc`](theta/cell_tester_wb.hoc) - single WB inhibitory cell interface
  - [`cell_tester_olm_pre.hoc`](theta/cell_tester_olm_pre.hoc) - single OLM inhibitory cell interface with Na/K channels only
  - [`cell_tester_olm_h.hoc`](theta/cell_tester_olm_pre.hoc) - single OLM inhibitory cell interface with Na/K/h channels 
  - [`cell_tester_olm_ha.hoc`](theta/cell_tester_olm_pre.hoc) - single OLM inhibitory cell interface with Na/K/h/A channels
- [[eio_theta_network]](eio_theta_network) - BMTK notebook for testing excitatory/inhibitory/OLM network used to generate theta and gamma rhythms
  - [`eio.ipynb`](eio_theta_network/eio.ipynb) - main jupyter notebook
