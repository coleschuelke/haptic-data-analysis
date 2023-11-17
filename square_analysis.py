import matplotlib.pyplot as plt
import pandas as pd

# import data from csv
overshoot_df = pd.read_csv('')
turnaround_df = pd.read_csv('')

# extract overshoot per direction
overshoot_up = overshoot_df["Up"]
overshoot_down = overshoot_df["Down"]
overshoot_left = overshoot_df["Left"]
overshoot_right = overshoot_df["Right"]
overshoot_fwd = overshoot_df["Forward"]
overshoot_bwd = overshoot_df["Backward"]

# combine to plot on a single figure
overshoot = []

# extract turnaround per direction
turnaround_up = turnaround_df["Up"]
turnaround_down = turnaround_df["Down"]
turnaround_left = turnaround_df["Left"]
turnaround_right = turnaround_df["Right"]
turnaround_fwd = turnaround_df["Forward"]
turnaround_bwd = turnaround_df["Backward"]

# combine to plot on a single figure
turnaround = []



o_fig, o_ax = plt.subplots()
o_ax.boxplot(overshoot)

o_ax.set_xticklabels([])

plt.title('Overshoot Per Direction')
plt.xlabel('Direction')
plt.ylabel('Overshoot')

plt.show()

t_fig, t_ax = plt.subplots()
t_ax.boxplot(turnaround)

t_ax.set_xticklabels([])

plt.title('Turnarounds Per Direction')
plt.xlabel('Direction')
plt.ylabel('Number of Turnarounds')

plt.show()