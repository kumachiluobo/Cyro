#BSUB -J relion_inf       
#BSUB -L /bin/bash
#BSUB -W 12:00           ## sets to 24 hours the job's runtime wall-clock limit.
#BSUB -M 2500            ## set memery (1GB) the per process memory limit.
#BSUB -n 20              ## assigns in one node 20 cpus for execution.
#BSUB -R "span[ptile=16]"       ## 20:  number of cores/cpus per node to use
#BSUB -R "select[nxt]"          ## Allocates NeXtScale nodes
#BSUB -o stdout1.%J       ## directs the job's standard output to stdout1.jobid
#BSUB -P 082800436567         ## charges the consumed service units (SUs) to project1.
#BSUB -u xpb20081@tamu.edu   ## email to user
#BSUB -N
#


module purge
module load RELION/1.4-intel-2015B

mpirun -n 20 `which relion_refine_mpi` --o Class2D/run1 --i particles.star --particle_diameter 256 --angpix 1.85 --ctf  --iter 25 --tau2_fudge 2 --K 50 --flatten_solvent  --zero_mask  --oversampling 1 --psi_step 10 --offset_range 5 --offset_step 2 --norm --scale  --j 1 --memory_per_thread 2.5
