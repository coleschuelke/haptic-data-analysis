import numpy as np
from sklearn.metrics import confusion_matrix
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.font_manager import FontProperties
import matplotlib.ticker as ticker
import seaborn as sns



# read file and strip any whitespace (adjust rows for free space which is shifted down)
df = pd.read_csv("freespace_correlation.csv")
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

# actual and predicted labels
# actual_labels = np.array([1, 0, 1, 1, 0, 1, 0, 0, 1, 0])
# predicted_labels = np.array([1, 1, 0, 1, 0, 1, 0, 1, 1, 0])
class_order = ["Right", "Left", "Up", "Down", "Forward", "Backward", "Roll Right", "Roll Left", "Pitch Up", "Pitch Down", "Yaw Right", "Yaw Left", "NR"]
class_labels = ["Right", "Left", "Up", "Down", "Fwd", "Bwd", "Roll\nRight", "Roll\nLeft", "Pitch\nUp", "Pitch\nDown", "Yaw\nRight", "Yaw\nLeft", "NR"]
# Create the confusion matrix
conf_matrix = confusion_matrix(actual_labels, movements, labels=class_order)

# Calculate the normalized confusion matrix
normalized_conf_matrix = conf_matrix.astype('float') / conf_matrix.sum(axis=1)[:, np.newaxis]
normalized_conf_matrix = np.nan_to_num(normalized_conf_matrix, nan=0)

# Print the normalized confusion matrix
print(normalized_conf_matrix)
# print(normalized_conf_matrix)

#set font properties
font = FontProperties(size=15)
font.set_weight('bold')

title_font = FontProperties(size=25)
title_font.set_weight('bold')

# Create a heatmap using seaborn
plt.figure(figsize=(12, 8))
sns.heatmap(normalized_conf_matrix, annot=True, fmt=".1f", cmap='Blues', cbar=False, xticklabels=class_labels, yticklabels=class_labels, annot_kws={'size': 16})
plt.xticks(rotation=45, fontsize=13)
plt.yticks(rotation=45, fontsize=13)
# Remove the ticks for both x and y axes
plt.tick_params(axis='both', which='both', length=0)
plt.xlabel('User Response', fontproperties=font)
plt.ylabel('Guidance Command', fontproperties=font)
# plt.title('Free Space Correlation Confusion Matrix\n', fontproperties=title_font)

# make colorbar
# cbar = plt.colorbar()
# cbar.set_label('Count', rotation=270, labelpad=15)  # Add a label for the colorbar
plt.savefig("freespace_corr_matrix.png", dpi=300)
plt.show()


#################################################################
                    ### RESPONE TIME BOX PLOTS ###
#################################################################

# # read in the response times
# response_times = df[df.columns[3]].to_numpy()

# # init buckets
# right = []
# down = []
# forward = []
# roll_l = []
# pitch_u = []
# yaw_l = []
# left = []
# up = []
# backward = []
# roll_r = []
# pitch_d = []
# yaw_r = []

# # break the values into buckets
# ############################################################
#                 ### Lambda ###
# for i in range(len(response_times)):
#     if i % 12 == 0:
#         right.append(response_times[i])
#     elif i % 12 == 1:
#         forward.append(response_times[i])
#     elif i % 12 == 2:
#         roll_l.append(response_times[i])
#     elif i % 12 == 3:
#         pitch_d.append(response_times[i])
#     elif i % 12 == 4:
#         left.append(response_times[i])
#     elif i % 12 == 5:
#         backward.append(response_times[i])
#     elif i % 12 == 6:
#         down.append(response_times[i])
#     elif i % 12 == 7:
#         up.append(response_times[i])
#     elif i % 12 == 8:
#         roll_r.append(response_times[i])
#     elif i % 12 == 9:
#         pitch_u.append(response_times[i])
#     elif i % 12 == 10:
#         yaw_l.append(response_times[i])
#     elif i % 12 == 11:
#         yaw_r.append(response_times[i])

# # convert back to np array
# right = np.array(right)
# down = np.array(down)
# forward = np.array(forward)
# roll_l = np.array(roll_l)
# pitch_u = np.array(pitch_u)
# yaw_l = np.array(yaw_l)
# left = np.array(left)
# up = np.array(up)
# backward = np.array(backward)
# roll_r = np.array(roll_r)
# pitch_d = np.array(pitch_d)
# yaw_r = np.array(yaw_r)

# # rm all nans
# right = right[~np.isnan(right)]
# down = down[~np.isnan(down)]
# forward = forward[~np.isnan(forward)]
# roll_l = roll_l[~np.isnan(roll_l)]
# pitch_u = pitch_u[~np.isnan(pitch_u)]
# yaw_l = yaw_l[~np.isnan(yaw_l)]
# left = left[~np.isnan(left)]
# up = up[~np.isnan(up)]
# backward = backward[~np.isnan(backward)]
# roll_r = roll_r[~np.isnan(roll_r)]
# pitch_d = pitch_d[~np.isnan(pitch_d)]
# yaw_r = yaw_r[~np.isnan(yaw_r)]

# # make the box plots
# xtick_positions = range(1, 13)

# plt.figure(figsize=(8, 10))  # Adjust the figure size as needed
# sns.boxplot(data=[right, down, forward, roll_l, pitch_u, yaw_l, left, up, backward, roll_r, pitch_d, yaw_r], orient="v", width=0.5, palette="Blues")  # Create a horizontal box plot
# plt.tick_params(axis='both', which='both', length=0)
# plt.xticks(xtick_positions, class_labels[:-1], rotation=45)
# plt.xlabel('Axis Command', fontproperties=font)
# plt.ylabel('Seconds', fontproperties=font)
# plt.title('Lambda Response Times\n', fontproperties=title_font)
# plt.savefig("lambda_corr_boxplots.png", dpi=300)
# plt.show()




# ###############
# # to do it in loops, just put all the original lists into a list and work with the elements 