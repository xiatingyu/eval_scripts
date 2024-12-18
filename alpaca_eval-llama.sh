
export HF_ENDPOINT=https://hf-mirror.com
export HF_TOKEN=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
export CUDA_VISIBLE_DEVICES=1


models=("dq" "ifd" "select" "zip" "random" "nuggets" "fbnm" "erank")

for model in "${models[@]}"
do
    model_name=/cpfs01/shared/Group-m6/xiatingyu.xty/journel-alpaca/MODEL/llama3-8B-alpaca-$model
    echo "Running with model=$model_name"
    export VLLM_WORKER_MULTIPROC_METHOD=spawn
    # lm_eval --model vllm \
    #     --model_args pretrained=${model_name},tensor_parallel_size=1,dtype=auto,gpu_memory_utilization=0.8 \
    #     --tasks arc_challenge \
    #     --num_fewshot 25 \
    #     --output_path ./alpaca/llama3 \
    #     --batch_size 2

    # lm_eval --model vllm \
    #     --model_args pretrained=${model_name},tensor_parallel_size=1,dtype=auto,gpu_memory_utilization=0.8 \
    #     --tasks truthfulqa \
    #     --num_fewshot 0 \
    #     --output_path ./alpaca/llama3 \
    #     --batch_size 4

    lm_eval --model vllm \
        --model_args pretrained=${model_name},tensor_parallel_size=1,dtype=auto,gpu_memory_utilization=0.8 \
        --tasks hellaswag \
        --num_fewshot 10 \
        --output_path ./alpaca/llama3 \
        --batch_size 4
        
done





models=("dq" "ifd" "select" "zip" "random" "nuggets" "fbnm" "erank")

for model in "${models[@]}"
do
    model_name=/cpfs01/shared/Group-m6/xiatingyu.xty/journel-alpaca/MODEL/llama3-8B-wizard-$model
    echo "Running with model=$model_name"
    export VLLM_WORKER_MULTIPROC_METHOD=spawn
    lm_eval --model vllm \
        --model_args pretrained=${model_name},tensor_parallel_size=1,dtype=auto,gpu_memory_utilization=0.8 \
        --tasks arc_challenge \
        --num_fewshot 25 \
        --output_path ./wizard/llama3 \
        --batch_size 2

    lm_eval --model vllm \
        --model_args pretrained=${model_name},tensor_parallel_size=1,dtype=auto,gpu_memory_utilization=0.8 \
        --tasks truthfulqa \
        --num_fewshot 0 \
        --output_path ./wizard/llama3 \
        --batch_size 4

    lm_eval --model vllm \
        --model_args pretrained=${model_name},tensor_parallel_size=1,dtype=auto,gpu_memory_utilization=0.8 \
        --tasks hellaswag \
        --num_fewshot 10 \
        --output_path ./wizard/llama3 \
        --batch_size 4
        
done




