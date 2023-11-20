# importing libraries 
import matplotlib.pyplot as plt # This package is used to plot graphs
import numpy as np # This package is used for mathematical expressions
import csv # This package is used to read csv-files
import pandas as pd # This package is used to convert a .txt-file to a .csv-file
  
txt_path = 'raw_data/timing_diagram/txt_files/'
csv_path = 'raw_data/timing_diagram/csv_files/'
save_path = 'plots/timing_diagram/'
file_names = ['0C_tt','0C_ff','0C_fs','0C_sf','0C_ss','27C_tt','27C_ff','27C_fs','27C_sf','27C_ss','70C_tt','70C_ff','70C_fs','70C_sf','70C_ss']

clock_periode = 10E-9
lw = 1.0 # line witdh in plotted graphs

for file_name in file_names:

    # Reading the given txt-file and creating a dataframe called "txt_data"
    txt_data = pd.read_csv(txt_path + file_name + '.txt', delimiter = '\t') 
    # Store dataframe into csv file 
    txt_data.to_csv(csv_path + file_name + '.csv', index = None)

    # Beginning to read csv-file
    header = []
    data = []

    # Exports csv-file without its header
    file =  csv_path + file_name + '.csv'
    with open(file) as csvfile:
        csvreader = csv.reader(csvfile) # Creates the generator-object "csvreader"

        header = next(csvreader) # Reads the first row as header

        # Traverses alle data points in the csvreader
        for datapoint in csvreader:
            # Creates a list of values in every data point
            # Converts all values to float numbers
            values = [float(value) for value in datapoint]
            
            # Adds this list of values to the list of all data
            data.append(values)

    # Simple check to see what kind of data we get
    print(header)
    print(data[0])

    # Creates lists for all measurments
    time = [point[0] for point in data]
    vdd = [point[1] for point in data]
    clk = [point[2]+4 for point in data]
    sig = [point[3]+3 for point in data]
    en = [point[4]+2 for point in data]
    rst = [point[5]+1 for point in data]
    out = [point[6] for point in data]

    # Sets the size of the figure
    plt.figure(figsize=(12, 6))

    counter = 1E-9
    while counter < time[-1]:
        plt.vlines(x=counter, ymin=0, ymax=5, colors='gray', ls='--', linewidth = lw)
        counter += clock_periode
    
    # Plotting the voltage signals against time
    plt.plot(time, clk, 'k', linewidth = lw)
    plt.plot(time, sig, 'k', linewidth = lw)
    plt.plot(time, en, 'k', linewidth = lw)
    plt.plot(time, rst, 'k', linewidth = lw)
    plt.plot(time, out, 'k', linewidth = lw)

    plt.title("Timing diagram for register with transistors in " + file_name[-2:] + " corner at " + file_name[0:2] + " degrees Celsius.")
    plt.xlabel('Time [s]')
    plt.ylabel('Voltage signals [V]')
    
    # plt.legend(['CLock signal', 'Input signal', 'Enable signal', 'Reset signal', 'Output signal'])
    # plt.legend(bbox_to_anchor=(1.0, 1), loc='upper left') # place the legend outside
    
    plt.yticks([0.5, 1.5, 2.5, 3.5, 4.5], ['Output', 'Reset', 'Enable', 'Input', 'Clock'])
    plt.tight_layout()
    plt.savefig(save_path + file_name + '_timing_diagram.png')
    plt.show()