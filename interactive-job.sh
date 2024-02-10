#!/bin/bash
#SBATCH --job-name=spark-cluster
#SBATCH --nodes=2                # node count, change as needed
#SBATCH --ntasks-per-node=1      # do not change, leave as 1 task per node
#SBATCH --cpus-per-task=36       # cpu-cores per task, change as needed
#SBATCH --mem=180g               # memory per node, change as needed
#SBATCH --time=00:60:00

# These modules are required. You may need to customize the module version
# depending on which cluster you are on.
module purge
module load JAVA/19.0.2
module load --ignore-cache GCC/11.3.0 OpenMPI/4.1.4 Spark/3.3.1

# Start the Spark instance.
./spark-start

# Source spark-env.sh to get useful env variables.
source ${HOME}/.spark-local/${SLURM_JOB_ID}/spark/conf/spark-env.sh

echo "***** Spark cluster is running. Submit jobs to ${SPARK_MASTER_URL}. *****"
sleep infinity
