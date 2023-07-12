#!/bin/bash

#SBATCH -o train_%j.out
#SBATCH -e train_%j.err
#SBATCH --cpus-per-task 20
#SBATCH --exclusive
#SBATCH --gres=gpu:volta:2
#SBATCH --ntasks 1
#SBATCH -N 1

CUDA_VISIBLE_DEVICES=0 python train.py --algo ppo_t2g_time_limits_wrapper --env Walker2d-v3 --eval-freq 10000 --eval-episodes 10 --n-eval-envs 1 --seed 41 & 
CUDA_VISIBLE_DEVICES=0 python train.py --algo ppo_t2g_time_limits_wrapper --env Walker2d-v3 --eval-freq 10000 --eval-episodes 10 --n-eval-envs 1 --seed 42 &
CUDA_VISIBLE_DEVICES=0 python train.py --algo ppo_t2g_time_limits_wrapper --env Walker2d-v3 --eval-freq 10000 --eval-episodes 10 --n-eval-envs 1 --seed 43 &
CUDA_VISIBLE_DEVICES=1 python train.py --algo ppo_t2g_time_limits_wrapper --env Walker2d-v3 --eval-freq 10000 --eval-episodes 10 --n-eval-envs 1 --seed 44 &
CUDA_VISIBLE_DEVICES=1 python train.py --algo ppo_t2g_time_limits_wrapper --env Walker2d-v3 --eval-freq 10000 --eval-episodes 10 --n-eval-envs 1 --seed 45

