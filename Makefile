MNIST = examples/mnist
MNIST_ALL = $(MNIST)/mnist_conv.native $(MNIST)/mnist_nn.native $(MNIST)/mnist_linear.native $(MNIST)/mnist_svm.native
ALL = tensorflow_core.lib tensorflow.lib gen.native examples/basics/linear_regression.native examples/basics/forty_two.native examples/basics/save_and_load.native examples/char_rnn/char_rnn.native $(MNIST_ALL)

tensorflow_core.lib: .FORCE
	ocamlbuild tensorflow_core.cmxa tensorflow_core.cma tensorflow_core.cmxs tensorflow_core.cmx

tensorflow.lib: .FORCE
	ocamlbuild tensorflow.cmxa tensorflow.cma tensorflow.cmxs tensorflow.cmx

%.native: .FORCE
	ocamlbuild $@

gen.native: .FORCE
	ocamlbuild src/gen_ops/gen.native

src/graph/ops_generated: gen.native
	LD_LIBRARY_PATH=./lib:$(LD_LIBRARY_PATH) ./gen.native

lr_gnuplot: examples/basics/linear_regression_gnuplot.native
	LD_LIBRARY_PATH=./lib:$(LD_LIBRARY_PATH) ./linear_regression_gnuplot.native

nn_gnuplot: examples/basics/nn_gnuplot.native
	LD_LIBRARY_PATH=./lib:$(LD_LIBRARY_PATH) ./nn_gnuplot.native

rnn_gru_gnuplot: examples/basics/rnn_gru_gnuplot.native
	LD_LIBRARY_PATH=./lib:$(LD_LIBRARY_PATH) ./rnn_gru_gnuplot.native

mnist_nn: examples/mnist/mnist_nn.native
	LD_LIBRARY_PATH=./lib:$(LD_LIBRARY_PATH) ./mnist_nn.native

mnist_resnet: examples/mnist/mnist_resnet.native
	LD_LIBRARY_PATH=./lib:$(LD_LIBRARY_PATH) ./mnist_resnet.native

mnist_linear: examples/mnist/mnist_linear.native
	LD_LIBRARY_PATH=./lib:$(LD_LIBRARY_PATH) ./mnist_linear.native

mnist_conv: examples/mnist/mnist_conv.native
	LD_LIBRARY_PATH=./lib:$(LD_LIBRARY_PATH) ./mnist_conv.native

mnist_svm: examples/mnist/mnist_svm.native
	LD_LIBRARY_PATH=./lib:$(LD_LIBRARY_PATH) ./mnist_svm.native

clean:
	rm -Rf _build/ *.native

.FORCE:

runtests: tests/operator_tests.native tests/gradient_tests.native
	LD_LIBRARY_PATH=./lib:$(LD_LIBRARY_PATH) ./operator_tests.native
	LD_LIBRARY_PATH=./lib:$(LD_LIBRARY_PATH) ./gradient_tests.native

all: $(ALL)
