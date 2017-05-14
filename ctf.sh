#BSUB -J relion_inf       
#BSUB -L /bin/bash
#BSUB -W 12:00           ## sets to 24 hours the job's runtime wall-clock limit.
#BSUB -M 2600            ## set memery (1GB) the per process memory limit.
#BSUB -n 40              ## assigns in one node 20 cpus for execution.
#BSUB -R "span[ptile=20]"       ## 20:  number of cores/cpus per node to use
#BSUB -R "select[nxt]"          ## Allocates NeXtScale nodes
#BSUB -o stdout1.%J       ## directs the job's standard output to stdout1.jobid
#BSUB -P 082800436567     ## charges the consumed service units (SUs) to project1.
#

module purge
module load RELION/1.4-intel-2015B


mpirun -n 40 `which relion_run_ctffind_mpi` --i "all_micrographs.star" --o "all_micrographs_ctf.star" --ctfWin -1 --CS 2 --HT 200 --AmpCnst 0.1 --XMAG 27027 --DStep 5 --Box 512 --ResMin 30 --ResMax 5 --dFMin 5000 --dFMax 50000 --FStep 500 --dAst 100 --ctffind_exe "../software/ctffind --omp-num-threads 1 --old-school-input"
