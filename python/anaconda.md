# Steps to run this notebook in a VM

## Step 1: Open the Anaconda prompt
Open **Anaconda Prompt** (search for that in the Windows Start menu)

You should see something like:

`(base) C:\Users\Admin>`

## Step 2: Check if JupyterLab is installed
Run: `conda list jupyterlab`

If you see something like `jupyterlab 4.x.x` → it’s installed

If not installed, run: `conda install jupyterlab`

## Step 2: Get the repo from GitHub
At the Anaconda prompt enter:

`git clone https://github.com/ingwanelabs/etl-hackathon`

Change to the newly created directory:

`cd etl-hackathon`

## Step 3: Launch JupyterLab
From the **Anaconda prompt** ...

Run: `jupyter lab`

It will launch in your default browser at `http://localhost:8888/lab`

**Note:** If you are asked to associate html files with a browser, select **Edge** and click **Always**

---

## Best Practice to create a virtual enviroment
Create a new Conda environment instead of using `(base)`:

```
conda create -n myenv python=3.11
conda activate myetl
```

This creates and activates a Python virtual enviroment `(myetl)` with no packages installed.

*But as we are working in our own VM it isn't neccessary.*
