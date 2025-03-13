from src.dtw_lab.lab2 import get_statistic, calculate_statistic
from src.dtw_lab.lab1 import encode_categorical_vars
import pandas as pd
import pytest

def test_calculate_statistic():
    df = pd.DataFrame({"Charge_Left_Percentage": [39, 60, 30, 30, 41]})

    assert calculate_statistic("mean", df["Charge_Left_Percentage"]) == 40
    assert calculate_statistic("median", df["Charge_Left_Percentage"]) == 39
    assert calculate_statistic("mode", df["Charge_Left_Percentage"]) == 30

def test_encode_categorical_vars():
    df = pd.DataFrame({
        "Manufacturer": ["Duracell", "Energizer", "Duracell", "Energizer", "Energizer"],
        "Battery_Size": ["AAA", "AA", "C", "D", "AA"],
        "Discharge_Speed": ["Slow", "Medium", "Fast", "Slow", "Medium"]
    })

    df = encode_categorical_vars(df)

    assert "Manufacturer_Duracell" in df.columns
    assert "Manufacturer_Energizer" in df.columns
    assert "Battery_Size" in df.columns
    assert "Discharge_Speed" in df.columns

    assert df["Battery_Size"].equals(pd.Series([1, 2, 3, 4, 2]))
    assert df["Discharge_Speed"].equals(pd.Series([1, 2, 3, 1, 2]))