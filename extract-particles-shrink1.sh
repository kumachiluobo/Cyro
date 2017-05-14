#BSUB -J relion_inf       
#BSUB -L /bin/bash
#BSUB -W 12:00           ## sets to 24 hours the job's runtime wall-clock limit.
#BSUB -M 2600            ## set memery (1GB) the per process memory limit.
#BSUB -n 10              ## assigns in one node 20 cpus for execution.
#BSUB -R "span[ptile=10]"       ## 20:  number of cores/cpus per node to use
#BSUB -R "select[nxt]"          ## Allocates NeXtScale nodes
#BSUB -o stdout1.%J       ## directs the job's standard output to stdout1.jobid
#BSUB -P 082800436567         ## charges the consumed service units (SUs) to project1.
#

module purge
module load RELION/1.4-intel-2015B

mpirun -n 10 `which relion_preprocess_mpi` --o particles --mic_star all_micrographs_ctf.star --coord_suffix .box --extract --extract_size 256 --norm --bg_radius 69 --white_dust -1 --black_dust -1
