import sklearn
import pandas as pd
from sklearn import preprocessing

# coba label encoding dan one hot encoder
data = pd.read_csv('coba.csv')

le = preprocessing.LabelEncoder()
data['country'] = le.fit_transform(data['country'])
print(data)

onehotencoder = preprocessing.OneHotEncoder(categories=['country'])
data['country'] = onehotencoder.fit_transform(data['country']).toarray()
