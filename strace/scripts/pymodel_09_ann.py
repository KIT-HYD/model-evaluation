import numpy as np
import pandas as pd
from keras.models import Sequential
from keras.layers import Dense


def load_data():
    q_host_cal = pd.read_csv('../data/q_host_cal.csv', header=None, names=['input']).to_numpy()
    p1 = np.roll(q_host_cal, 1)
    p2 = np.roll(q_host_cal, 2)
    p3 = np.roll(q_host_cal, 3)
    data = np.hstack((p1, p2, p3))
    labels = q_host_cal

    return data, labels


def build_network(neurons_in_hidden_layer, training_data):
    mdl = Sequential()
    mdl.add(Dense(units=neurons_in_hidden_layer, activation="softplus", input_shape=training_data.shape[1:]))
    mdl.add(Dense(1, activation="linear"))

    mdl.compile(loss="mse", optimizer="RMSprop")

    return mdl


def train(mdl, training_data, training_labels):
    mdl.fit(training_data, training_labels, batch_size=16, epochs=100, validation_split=0.3)


if __name__ == "__main__":
    # load data
    data, labels = load_data()

    # create network
    hidden_layer_size = 5
    model = build_network(hidden_layer_size, data)

    # train network
    train(model, data, labels)
    model.save('../data/ann_model.h5')
