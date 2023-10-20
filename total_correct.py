import numpy as np
import pandas as pd


# read file and strip any whitespace (adjust rows for free space which is shifted down)
df = pd.read_csv("lambda_correlation.csv")
# free space corr
# df = df.iloc[1:]
df.iloc[:, 0] = df.iloc[:, 0].str.strip()
df.iloc[:, 2] = df.iloc[:, 2].str.strip()
# df.iloc[:, 3] = df.iloc[:, 3]
# lambda corr
# df.iloc[:, 0] = df.iloc[:, 0].str.strip()
# df.iloc[:, 2] = df.iloc[:, 2].str.strip()

actual_labels = df[df.columns[0]].to_numpy()
movements = df[df.columns[2]].to_numpy()

# overall correctness numbers
counter = 0
for i in range(len(actual_labels)):
    if actual_labels[i] != movements[i]:
        counter += 1

per_correct = (len(actual_labels) - counter) / len(actual_labels)

print(f"the total percentage of correct movements: {per_correct}")