import numpy as np
import matplotlib.pyplot as plt
import sys

#with open('data1.txt') as f:
#   lines = f.readlines()

def inv(A):
    #Augment with an identity matrix of required order: Here it's 2 :
    if A.shape(0)!= A.shape(1):
       sys.exit('Not Invertible!')
    n = A.shape(0)
    a = np.concatenate((A,np.identity(n,dtype = float)),axis = 1)
    # Applying Gauss Jordan Elimination:
    for i in range(n):
        if a[i][i] == 0.0:
           sys.exit('Not Invertible!') 
        for j in range(n):
            if i != j:
               ratio = a[j][i]/a[i][i]
               for k in range(2*n):
                   a[j][k] = a[j][k] - ratio*a[i][k]
    #Row operation to make principal diagonal element to 1:
    for i in range(n):
        divisor = a[i][i]
        for j in range(2*n):
            a[i][j] = a[i][j]/divisor
    #Displaying the Inverted matrix:
    #print('\nINVERTED MATRIX IS:')
    #for i in range(n):
    #    for j in range(n,2*n):
    #        print(a[i][j],end ='\t')
    #    print()
    #Returning the inverted matrix
    b = np.zeros([n,n])
    for i in range(n):
        for j in range(n,2*n):
            b[i-n][j-n] = a[i][j]
    return b

def linreg(filename, number_of_datapoints):
    m = number_of_datapoints
    #Load the data set from .txt files:
    data = np.loadtxt(filename , dtype = float)
    data_x = np.array(data[0:m,1]).reshape(m,1)
    data_y = np.array(data[0:m,0]).reshape(m,1)
    #Adding a column of all ones (intercept term) to data_x:
    data_X = np.concatenate((np.ones([m,1]),data_x),axis = 1)
    #We now apply the Normal Equation:
    X_transpose =np.transpose(data_X)
    theta = np.linalg.inv(X_transpose.dot(data_X)).dot(X_transpose).dot(data_y)
    #Plotting the linear regression:
    plt.plot(data_X[:,1],data_X.dot(theta),'-')
    #Plotting raw data to compare:
    plt.scatter(data_x,data_y,s=8,marker = 'x')
    plt.title('Linear Regression & Raw Data of first data points')
    plt.xlabel('X')
    plt.ylabel('Y')
    plt.autoscale()
    plt.show()
    return theta[0],theta[1]

#The following loop generates the plot and slope, intercept values one by one:
for filename in ['data1.txt','data2.txt','data3.txt']:
    for m in [50,100,200]:
        intercept , slope = linreg(filename,m)
        print(filename,' : ', m,' Data Points ', 'intercept = ',intercept, ' slope = ',slope)



