# brTPF Experiments
This repo contains all the scripts/tools and queries needed to run experiments to evaluate brTPF.

## Setup - General Steps
The following steps in this section are required for both the single-client experiments and the multiple-clients experiments.

Clone this repo on the computer(s) that you want to use to simulate the TPF/brTPF client(s) in the experiment.
```
$ git clone git@github.com:hartig/brTPF_Experiments.git
```
Additionally, clone [our fork](https://github.com/hartig/Client.js) of the [Client.js repo](https://github.com/LinkedDataFragments/Client.js) and, in this clone, switch to the code branch that contains our brTPF client implementation.
```
$ git clone git@github.com:hartig/Client.js.git
$ cd Client.js
$ git checkout feature-brtpf
$ cd ..
```
Now, use the following commands to install the TPF/brTPF client that we have extended for the experiments.
```
$ cd brTPF_Experiments/ExtendedClient.js/
$ npm install .
$ cd ../../
```
You may check whether the client works by using the following command. Note that this command is supposed to execute an example query over the TPF endpoint of DBpedia *without* printing the results; after the execution of this command finishes (which may take a minute or so), your current director should contain a new file called `eval_TPF_undefined.csv`. You can delete this file.
```
$ brTPF_Experiments/ExtendedClient.js/bin/TPF-client-eval http://fragments.dbpedia.org/2015/en Client.js/queries/artists-york.sparql
```

## Single-Client Experiments

TODO

## Multiple-Clients Experiments

TODO
