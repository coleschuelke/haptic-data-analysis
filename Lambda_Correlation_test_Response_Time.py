import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns

# Sample data for 12 fields (replace this with your actual data)

data = [
    [0.45, 0.62, 0.5, 0.51, 1.08, 0.67, 0.69, 1.19, 0.56, 4.91, 0.46, 1.72, 0.53, 1.76], #right
    [2.4, 2.23, 1.08, 2.4, 1.24, 2.95, 1.13, 1.35, 2.67, 1.1, 0.98, 2.03, 1.33],    # left
    [1.39, 1.16, 0.57, 1.25, 0.9, 1.73], #fwd
    [1.32, 1.52, 0.73, 2.9, 1.46, 1.01, 1.36, 2.97, 1.68, 0.64, 0.64, 2.5, 1.65], # bwd
    [5.4, 0.55, 2.55, 1.79, 2.36, 1.14, 1.11, 1.19, 0.66, 2.81, 1.32], # up
    [0.76, .7, 2.73, 1.67, 0.62, 0.49, 1.61, 0.97, 0.74, 1.54, 0.78, 1.4, 0.99], #down 
    [1.27, 0.82, 3.1, 0.56, 1.15, 0.53, 1.32, 0.27, 1.14, 0.45, 1.09, 1.54, 1.02, 0.97], # roll r
    [2, 2.1, 2.2, 3.2, 2.84, 3.36, 0.61, 2.9, 2.49], # roll l
    [0.92, 0.73, 1.4, 0.4, 0.62, 0.76, 1.5, 1.2, 1.9, 1.56, 0.83, 1.89, 1.54], #pitch u
    [1.12, 1.1, 1.93, 0.53, 2.66, 1.64, 1.27, 1.26, 1.44, 0.77, 2.6, 1.96], #pitch d
    [3.2, 1.82, 2.03, 2.88, 0.7, 0.95, 2.11, 2.05, 0.75, 1.27, 2.3, 2.72], # yaw riht 
    [3.68, 3.5, 1.06, 1.96, 2.49, 1.23, 1.46, 3.97, 2.9, 2.23, 1.4, 1.89, 1.02]]    #yaw left
    
#data = np.random.randn(100, 12)  # Generating random data for demonstration

# Creating a box plot
plt.figure(figsize=(10, 6))  # Adjust the figure size if necessary
#plt.boxplot(data, vert=True)
sns.boxplot(data=data, orient='h')

sns.set_style("whitegrid")
sns.despine(left=False, bottom = False)

# Adding labels to the x-axis for each field
field_labels = ['Right', 'Left', 'Forward', 'Backward', 'Up', 'Down', 'Roll \nRight', 'Roll \nLeft', 'Pitch \nUp', 'Pitch \nDown', 'Yaw \nRight', 'Yaw \nLeft']
plt.yticks(np.arange(0, len(field_labels)), field_labels, ha='right')

# Adding labels to the axes
plt.xlabel('Time (s)', fontweight='bold')
plt.ylabel('Guidance Cue', fontweight='bold')

# Adding a title
#plt.title('Box Plot for 12 Fields')

# Display the plot
plt.show()
