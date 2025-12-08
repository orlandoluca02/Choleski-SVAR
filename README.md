# Structural VAR Analysis: US Economy

**Authors:** Luca Orlando, Luca Marchesi  
**Language:** MATLAB

## 📋 Overview

This repository contains a MATLAB implementation for a **Structural Vector Autoregression (SVAR)** analysis of the US economy using quarterly data.

The project focuses on estimating the dynamic effects of macroeconomic shocks using a Recursive Identification scheme (**Cholesky Decomposition**).

## 🚀 Key Features

* **Data Handling:** Imports and pre-processes US quarterly macroeconomic data.
* **Reduced Form Estimation:** Estimates the VAR model using OLS (via `rfvar3`) with 4 lags.
* **Structural Identification:** Recovers structural shocks using Cholesky decomposition (Wold ordering).
* **Impulse Response Functions (IRF):** Computes and visualizes the response of economic variables (e.g., GDP, Inflation) to specific structural shocks (e.g., Interest Rate shock).

## 🛠️ Requirements

To run this code, you need:
1.  **MATLAB** (R2020a or later recommended).
2.  **BVAR/SVAR Toolbox:** The code relies on specific econometric functions (`rfvar3`, `iresponse`). Ensure the `bvartools` and `cmintools` folders are available.

## 📂 Structure

* `main_script.m`: The core script that runs the estimation and plotting.
* `data/`: Folder containing the dataset (`BCF_USquarterlydata.xlsx`).
* `bvartools/` & `cmintools/`: Required auxiliary function libraries.

## ⚙️ Usage

1.  Clone this repository:
    ```bash
    git clone [https://github.com/yourusername/svar-analysis.git](https://github.com/yourusername/svar-analysis.git)
    ```
2.  Open MATLAB and navigate to the repository folder.
3.  **Important:** Open the main script and update the file paths in the `addpath` section to match your local directory structure:
    ```matlab
    addpath('path/to/bvartools');
    addpath('path/to/cmintools');
    file = 'path/to/BCF_USquarterlydata.xlsx';
    ```
4.  Run the script.

## 📊 Dataset

The model uses `BCF_USquarterlydata.xlsx`, which includes key US macroeconomic indicators. The variables are reordered within the script to satisfy the specific recursive identification assumptions.

## 📝 License

This project is open for educational and research purposes.
