load_model(decision_tree_model):- consult(decision_tree_model).

classify(SepalLength, SepalWidth, PetalLength, PetalWidth) :-
(
    PetalWidth =< 0.8,
    write('Iris-setosa')
    ;
    PetalLength =< 4.75,
    PetalWidth =< 1.65,
    PetalWidth >= 0.8,
    write('Iris-versicolor')
    ;
    PetalLength =< 4.75,
    PetalWidth >= 1.65,
    PetalWidth >= 0.8,
    write('Iris-virginica')
    ;
    PetalLength >= 4.75,
    PetalWidth >= 0.8,
    PetalWidth =< 1.75,
    PetalLength =< 4.95,
    write('Iris-versicolor')
    ;
    PetalLength >= 4.75,
    PetalWidth >= 0.8,
    PetalWidth =< 1.55,
    PetalLength =< 4.95,
    write('Iris-virginica')
    ;
    PetalLength >= 4.95,
    PetalWidth =< 1.75,
    PetalWidth >= 1.55,
    SepalLength =< 6.95,
    write('Iris-versicolor')
    ;
    PetalLength >= 4.95,
    PetalWidth =< 1.75,
    PetalWidth >= 1.55,
    SepalLength >= 6.95,
    write('Iris-virginica')
    ;
    PetalLength >= 2.45,
    PetalLength =< 4.85,+
    PetalWidth >= 1.75,
    SepalWidth =< 3.1,
    write('Iris-virginica')
    ;
    PetalLength >= 4.75,
    PetalWidth >= 1.75,
    PetalLength =< 4.85,
    SepalWidth >= 3.1,
    write('Iris-versicolor')
    ;
    PetalWidth >= 1.75,
    PetalLength >= 4.85,
    write('Iris-virginica')
).



