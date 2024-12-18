
export HF_ENDPOINT=https://hf-mirror.com
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

model_name=/cpfs01/shared/Group-m6/xiatingyu.xty/SimPO1/outputs/llama-3-8b-base-simpo-loss4

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

export VLLM_WORKER_MULTIPROC_METHOD=spawn
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

export HF_TOKEN=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
# lm_eval --model vllm \
#     --model_args pretrained=${model_name},tensor_parallel_size=4,dtype=auto,gpu_memory_utilization=0.8,enforce_eager=True \
#     --tasks leaderboard \
#     --output_path ./output \
#     --batch_size 1 

lm_eval --model hf \
    --model_args pretrained=${model_name} \
    --tasks leaderboard \
    --output_path ./output \
    --batch_size auto \
    --device cuda:1