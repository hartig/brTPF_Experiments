import traceback
import sys
import os
import glob
import subprocess
from multiprocessing import Pool


def main_parallel(start_fragment, query_folders, cores, timeoutInMins):
    arglist = []
    AVAILABLE_CORES = int(cores)
    folder_number = 0
    for query_folder in sorted(glob.glob(query_folders + '/*')):
        print(query_folder)
        arglist.append((start_fragment, query_folder, timeoutInMins))
        folder_number += 1

    print('Processing ' + str(folder_number) + ' files with ' +
          str(AVAILABLE_CORES) + ' cores, this may take a while...')
    pool = Pool(processes=AVAILABLE_CORES)
    pool.map_async(main, arglist).get()


def main((start_fragment, query_folders, timeoutInMins)):
    # "Usage: ./run_bgp.sh <queries-directory> <output-folder> <timeout-for-each-query>"
    cmd = 'bash run_bgp.sh' + ' ' + query_folders + ' ' + '~/tpf_evaluation/brTPF_Experiments/MultiClientExperiments/ClientScripts/sage_output ' + start_fragment + ' ' + timeoutInMins
    print('Command: ' + cmd)
    try:
        subprocess.call(cmd, shell=True)
    except Exception, e:
        print(e)
        traceback.print_exc(file=sys.stdout)


if __name__ == '__main__':
    if len(sys.argv) == 1:
        print('Usage: python eval.py config_file query_folder')
    else:
        try:
            main_parallel(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4])
        except Exception, exc:
            print exc
            sys.exit()
        sys.exit()

