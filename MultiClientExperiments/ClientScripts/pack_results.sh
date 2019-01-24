#!/bin/bash

EXEC_DIR_ON_NODE=/home/admin/tpf_evaluation/brTPF_Experiments/MultiClientExperiments/ClientScripts
ZIP_DIR_ON_NODE=${EXEC_DIR_ON_NODE}/output
ZIP_FILE_ON_NODE=${ZIP_DIR_ON_NODE}/${3}clients.${1}.${2}.csv.zip

mkdir -p ${ZIP_DIR_ON_NODE}
zip ${ZIP_FILE_ON_NODE} ${EXEC_DIR_ON_NODE}/eval*.csv ${EXEC_DIR_ON_NODE}/executed_queries_list_* ${EXEC_DIR_ON_NODE}/sage_output/*.csv

rm ${EXEC_DIR_ON_NODE}/eval*.csv
rm ${EXEC_DIR_ON_NODE}/sage_output/*.csv
rm ${EXEC_DIR_ON_NODE}/executed_queries_list_*
