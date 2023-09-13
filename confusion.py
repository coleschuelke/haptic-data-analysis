import numpy as np
from sklearn.metrics import confusion_matrix
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.font_manager import FontProperties
import seaborn as sns

df = pd.read_csv("data_test.csv")
df.iloc[:, 0] = df.iloc[:, 0].str.strip()
df.iloc[:, 2] = df.iloc[:, 2].str.strip()

actual_labels = df[df.columns[0]].to_numpy()
movements = df[df.columns[2]].to_numpy()

# Example actual and predicted labels
# actual_labels = np.array([1, 0, 1, 1, 0, 1, 0, 0, 1, 0])
# predicted_labels = np.array([1, 1, 0, 1, 0, 1, 0, 1, 1, 0])
class_labels = ["Right", "Down", "Forward", "Roll\nLeft", "Pitch\nUp", "Yaw\nLeft", "Left", "Up", "Backward", "Roll\nRight", "Pitch\nDown", "Yaw\nRight"]
class_order = ["Right", "Down", "Forward", "Roll Left", "Pitch Up", "Yaw Left", "Left", "Up", "Backward", "Roll Right", "Pitch Down", "Yaw Right"]

# Create the confusion matrix
conf_matrix = confusion_matrix(actual_labels, movements, labels=class_order)

# Calculate the normalized confusion matrix
# normalized_conf_matrix = conf_matrix.astype('float') / conf_matrix.sum(axis=1)[:, np.newaxis]

# Print the normalized confusion matrix
print(conf_matrix)
# print(normalized_conf_matrix)

#set font properties
font = FontProperties()
font.set_weight('bold')

title_font = FontProperties(size=15)
title_font.set_weight('bold')

# Create a heatmap using seaborn
plt.figure(figsize=(8, 6))
sns.heatmap(conf_matrix, annot=True, fmt='d', cmap='Blues', cbar=False, xticklabels=class_labels, yticklabels=class_labels)
plt.xticks(rotation=0)
plt.xlabel('Subject Movement', fontproperties=font)
plt.ylabel('Cue Given', fontproperties=font)
plt.title('Free Space Correlation Confusion Matrix\n', fontproperties=title_font)
plt.show()