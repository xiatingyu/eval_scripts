
export HF_ENDPOINT=https://hf-mirror.com
export HF_TOKEN=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
model_name=/cpfs01/shared/Group-m6/xiatingyu.xty/SimPO1/outputs/llama-3-8b-base-simpo-loss4-3

# CUDA_VISIBLE_DEVICES=2 accelerate launch -m lm_eval --model hf \
#     --model_args pretrained=${model_name},parallelize=True \
#     --tasks hellaswag \
#     --output_path ./alpaca/hellaswag \
#     --batch_size auto \
#     --num_fewshot 10 \

# CUDA_VISIBLE_DEVICES=2 accelerate launch -m lm_eval --model hf \
#     --model_args pretrained=${model_name},parallelize=True \
#     --tasks mmlu \
#     --output_path ./alpaca/mmlu \
#     --batch_size auto \
#     --num_fewshot 5 \

# CUDA_VISIBLE_DEVICES=2 accelerate launch -m lm_eval --model hf \
#     --model_args pretrained=${model_name},parallelize=True \
#     --tasks arc_challenge \
#     --output_path ./alpaca/arc_challenge \
#     --batch_size auto \
#     --num_fewshot 25  \


CUDA_VISIBLE_DEVICES=0 accelerate launch -m lm_eval --model hf \
    --model_args pretrained=${model_name},parallelize=True \
    --tasks gsm8k \
    --output_path ./alpaca/gsm \
    --batch_size auto \
    --num_fewshot 5 \

# CUDA_VISIBLE_DEVICES=2 accelerate  launch -m lm_eval --model hf \
#     --model_args pretrained=${model_name},parallelize=True \
#     --tasks bbh \
#     --output_path ./alpaca/bbh \
#     --batch_size auto \
#     --num_fewshot 3 \

# CUDA_VISIBLE_DEVICES=2 accelerate launch -m lm_eval --model hf \
#     --model_args pretrained=${model_name},parallelize=True \
#     --tasks truthfulqa \
#     --output_path ./alpaca/truth \
#     --batch_size auto \
#     --num_fewshot 0 \

# lm_eval --model hf \
#     --model_args pretrained=/cpfs01/shared/Group-m6/xiatingyu.xty/SimPO1/outputs/llama-3-8b-base-simpo-loss4 \
#     --tasks truthfulqa,piqa,ifeval \
#     --num_fewshot 3 \
#     --output_path ./output \
#     --batch_size auto \
#     --device cuda:0 \

# lm_eval --model hf \
#     --model_args pretrained=/cpfs01/shared/Group-m6/xiatingyu.xty/SimPO1/outputs/llama-3-8b-base-simpo-loss4 \
#     --tasks gsm8k \
#     --num_fewshot 8 \
#     --output_path ./output \
#     --batch_size auto \
#     --device cuda:0 \

# lm_eval --model hf \
#     --model_args pretrained=/cpfs01/shared/Group-m6/xiatingyu.xty/SimPO1/outputs/llama-3-8b-base-simpo-loss4 \
#     --tasks mmlu \
#     --num_fewshot 0 \
#     --output_path ./output \
#     --batch_size auto \
#     --device cuda:0 \


# lm_eval --model vllm \
#     --model_args pretrained=${model_name},tensor_parallel_size=1,dtype=auto,gpu_memory_utilization=0.8 \
#     --tasks truthfulqa,piqa,ifeval \
#     --num_fewshot 3 \
#     --output_path ./output \
#     --batch_size 4

# lm_eval --model vllm \
#     --model_args pretrained=${model_name},tensor_parallel_size=2,dtype=auto,gpu_memory_utilization=0.8 \
#     --tasks gsm8k \
#     --num_fewshot 8 \
#     --output_path ./output \
#     --batch_size 64

# export VLLM_WORKER_MULTIPROC_METHOD=spawn
# lm_eval --model vllm \
#     --model_args pretrained=${model_name},tensor_parallel_size=2,dtype=auto,gpu_memory_utilization=0.8 \
#     --tasks mmlu \
#     --num_fewshot 0 \
#     --output_path ./output \
#     --batch_size 4


# lm_eval --model vllm \
#     --model_args pretrained=${model_name},tensor_parallel_size=1,dtype=auto,gpu_memory_utilization=0.8 \
#     --tasks truthfulqa,piqa,ifeval \
#     --num_fewshot 3 \
#     --output_path ./output \
#     --batch_size 4


# lm_eval --model vllm \
#     --model_args pretrained=${model_name},tensor_parallel_size=4,dtype=auto,gpu_memory_utilization=0.8,enforce_eager=True \
#     --tasks leaderboard \
#     --output_path ./output \
#     --batch_size 1 

# lm_eval --model hf \
#     --model_args pretrained=${model_name} \
#     --tasks leaderboard \
#     --output_path ./output \
#     --batch_size auto \
#     --device cuda:0



# export HF_TOKEN=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
# accelerate launch --multi_gpu --num_processes 4 \
#     -m lm_eval --model hf \
#     --model_args pretrained=${model_name},parallelize=True \
#     --tasks leaderboard \
#     --output_path ./output \
#     --batch_size auto \


