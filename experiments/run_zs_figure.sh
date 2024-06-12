#!/bin/bash

# Define the Python command and its arguments
python_command="python figure_zs.py"
# python_command="python figure_zs.py --model meta-llama/Llama-2-7b-chat-hf"
# python_command="python figure_zs.py --model meta-llama/Meta-Llama-3-8B-Instruct"
# python_command="python figure_zs.py --model meta-llama/Meta-Llama-3-70B-Instruct"
args=(
    "--split dev"
    "--modality caption --split dev"
    "--modality context --split dev"
    "--modality reference --split dev"
    "--split test"
    "--modality caption --split test"
    "--modality context --split test"
    "--modality reference --split test"
)

# Execute each Python command and append output to a single result file
for arg in "${args[@]}"; do
    echo "Executing: $python_command $arg"
    echo "Command: $python_command $arg" >> zs_figure.log
    $python_command $arg >> zs_figure.log 2>&1
done
