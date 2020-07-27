import numpy as np
from keras.models import Sequential
from keras.layers import Dense, LSTM


def load_data():
    data = np.loadtxt('../data/p_ebni_cal.csv')
    labels = np.loadtxt('../data/q_host_cal.csv')

    return data, labels


def rolling_window(a, window_size):
    shape = (a.shape[0] - window_size + 1, window_size) + a.shape[1:]
    strides = (a.strides[0],) + a.strides

    return np.lib.stride_tricks.as_strided(a, shape=shape, strides=strides)


def build_model(look_back):
    model = Sequential()
    model.add(LSTM(5, input_shape=(look_back, 1)))
    model.add(Dense(1))
    model.compile(loss='mean_squared_error', optimizer='adam')

    return model


if __name__ == '__main__':
    WINDOW = 20

    # load data
    data, labels = load_data()

    # create rolling windows and their labels
    rolling_windows = np.expand_dims(rolling_window(data, WINDOW), axis=2)[:-1]
    labels = labels[WINDOW:]

    # create network
    model = build_model(WINDOW)

    # train data
    model.fit(rolling_windows, labels, validation_split=0.3, epochs=100)
    model.save('../data/lstm_model.h5')