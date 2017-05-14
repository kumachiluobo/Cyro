#BSUB -J relion_largemem       
#BSUB -L /bin/bash
#BSUB -W 12:00           ## sets to 24 hours the job's runtime wall-clock limit.
#BSUB -R "rusage[mem=2500]"
#BSUB -M 2500            ## set memery (1GB) the per process memory limit.
#BSUB -n 80              ## assigns node numbers for execution.
#BSUB -R "span[ptile=20]"       ## 20:  number of cores/cpus per node to use
#BSUB -R "select[nxt]"          ## Allocates NeXtScale nodes
#BSUB -o stdout1.%J       ## directs the job's standard output to stdout1.jobid
#BSUB -P 082800436567     ## charges the consumed service units (SUs) to project1.
#BSUB -u xpb20081@tamu.edu   # sends email to the specified address (e.g., netid@tamu.edu,
#BSUB -N               # send emails on job begin (-B) and end (-N)

module purge
module load RELION/1.4-intel-2015B
mpirun -n 80 `which relion_refine_mpi` --o Refine3D/run1 --auto_refine --split_random_halves --i for3dauto.star --particle_diameter 256 --angpix 1.85 --ref inital-model/model_04_01_right.mrc --firstiter_cc --ini_high 60 --ctf --flatten_solvent --zero_mask --oversampling 1 --healpix_order 2 --auto_local_healpix_order 4 --offset_range 5 --offset_step 2 --sym C1 --low_resol_join_halves 40 --norm --scale  --j 1 --memory_per_thread 4 
