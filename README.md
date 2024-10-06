# AI Agents XLSX PPTX Project

This project uses AI agents to work with Excel (XLSX) and PowerPoint (PPTX) files. Follow the setup instructions below to get started.

## Prerequisites

- Python 3.12 or higher
- [just](https://github.com/casey/just) command runner

## Setup

1. Install `just` if you haven't already. On macOS with Homebrew:

   brew install just

2. Clone this repository and navigate to the project directory.

3. Create a `.env` file in the project root with your Anthropic API key:

   ANTHROPIC_API_KEY=your_api_key_here

   Replace `your_api_key_here` with your actual Anthropic API key.

4. Run the setup command:

   just setup

   This will create a virtual environment, install dependencies, and set up the Jupyter kernel.

## Usage

Here are some common commands you can use with `just`:

- Set up the project:

   just setup

- Start Jupyter Lab:

   just jupyter

- List available Jupyter kernels:

   just list-kernels

- Install a new package:

   just install-package package_name

- Clear outputs from all notebooks:

   just clear-notebooks

## Project Structure

- `justfile`: Contains task definitions for the `just` command runner.
- `requirements.txt`: Lists all Python dependencies.
- `.env`: Contains environment variables (not tracked in git).
- `anthropic_test.py`: A script to test the Anthropic API connection.

## Notebooks

Jupyter notebooks for this project should be stored in the project root or in subdirectories. Use the "AI Agents (Python)" kernel when running these notebooks to ensure you're using the correct virtual environment.

## Troubleshooting

If you encounter any issues during setup or runtime, please check the following:

1. Ensure your `.env` file is correctly set up with your Anthropic API key.
2. Make sure you've run `just setup` to create the virtual environment and install dependencies.

For any persistent issues, please open an issue in the project repository.
