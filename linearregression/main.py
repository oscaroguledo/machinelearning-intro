import pandas as pd 
import numpy as np
import sklearn
from sklearn import linear_model
from sklearn.utils import shuffle

#read the data in the csv
data = pd.read_csv('student-mat.csv', sep=';')

print(data.head())

data = data[['G1','G2','G3','studytime','failures' ,'absences']]
label = 'G3'
x = np.array(data.drop([label], 1))
y = np.array(data[label])

x_train, y_train,x_test, y_test = sklearn.model_selection.train_test_split(x,y, test_size=0.1)