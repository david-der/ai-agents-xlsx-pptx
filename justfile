default:
    @just --list

setup:
    #!/usr/bin/env sh
    set -eu

    VENV_NAME="ai-agents-venv"
    VENV_PATH="$PWD/$VENV_NAME"

    if [ ! -d "$VENV_PATH" ]; then
        python3 -m venv "$VENV_PATH"
        echo "Created new virtual environment at $VENV_PATH"
    else
        echo "Using existing virtual environment at $VENV_PATH"
    fi

    . "$VENV_PATH/bin/activate"

    if [ "$VIRTUAL_ENV" != "$VENV_PATH" ]; then
        echo "Failed to activate virtual environment."
        exit 1
    fi

    pip install --upgrade pip

    if [ -f "requirements.txt" ]; then
        pip install -r requirements.txt
        echo "Installed packages from requirements.txt"
    else
        echo "No requirements.txt found. Skipping package installation."
    fi

    KERNEL_NAME="ai_agents_kernel"
    DISPLAY_NAME="AI Agents (Python)"

    if ! jupyter kernelspec list | grep -q "$KERNEL_NAME"; then
        python -m ipykernel install --user --name="$KERNEL_NAME" --display-name="$DISPLAY_NAME"
        echo "Jupyter kernel '$KERNEL_NAME' created with display name '$DISPLAY_NAME'."
    else
        echo "Jupyter kernel '$KERNEL_NAME' already exists."
    fi

    echo "Setup complete."

jupyter:
    @. ai-agents-venv/bin/activate && jupyter lab

list-kernels:
    @jupyter kernelspec list

remove-kernel:
    @jupyter kernelspec uninstall ai_agents_kernel -y

install-package package:
    @. ai-agents-venv/bin/activate && pip install {{package}}

show-package package:
    @. ai-agents-venv/bin/activate && pip show {{package}}

clear-notebooks:
    @echo "Clearing outputs of all notebooks in the project..."
    @. ai-agents-venv/bin/activate && \
    find . -name "*.ipynb" -not -path "*/.*" -print0 | \
    xargs -0 -I {} jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace {}
    @echo "Notebook outputs cleared."
