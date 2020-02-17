import pandas as pd
from keras.models import Sequential
from keras.layers import Dense, Dropout


def build_network(neurons_in_hidden_layer, training_data):
    mdl = Sequential()
    mdl.add(Dense(units=neurons_in_hidden_layer, activation="sigmoid", input_shape=training_data.shape[1:]))
    mdl.add(Dropout(0.1))
    mdl.add(Dense(1, activation="linear"))

    mdl.compile(loss="mse", optimizer="adam")

    return mdl


def train(mdl, training_data, training_labels):
    mdl.fit(training_data, training_labels, batch_size=16, epochs=200, shuffle=True, validation_split=0.3)


if __name__ == "__main__":
    # load data
    p_ebni = pd.read_csv('p_ebni.csv', header=None, names=['input']).to_numpy()
    q_host = pd.read_csv('q_host.csv', header=None, names=['input']).to_numpy()

    # create network
    hidden_layer_size = 10
    model = build_network(hidden_layer_size, p_ebni)

    # train network
    train(model, p_ebni, q_host)
    model.save('ann_model.h5')
