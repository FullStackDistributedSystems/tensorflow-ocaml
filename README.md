The tensorflow-ocaml project provides some [OCaml](http://ocaml.org) bindings for [TensorFlow](http://tensorflow.org).

These bindings are in an early stage of their development. Some operators are not supported and the API is likely to change in the future. You may also encounter some segfaults. That being said they already contain the necessary to train a convolution network using various optimizers.

## Installation

The easiest way is probably to use opam.

```bash
opam pin add tensorflow-ocaml git://github.com/LaurentMazare/tensorflow-ocaml
```

After that you have to get/build the TensorFlow library `libtensorflow.so`, you can either build it from source by following these steps:
* [Install the Bazel build system](http://bazel.io/docs/install.html)
* Clone the TensorFlow repo `git clone --recurse-submodules https://github.com/tensorflow/tensorflow`
* In `tensorflow` run `./configure` then `bazel build -c opt tensorflow:libtensorflow.so`

Or an alternative is to [install TensorFlow using pip](https://www.tensorflow.org/versions/r0.7/get_started/os_setup.html#pip-installation) then copy the `.so` file in `libtensorflow.so`. You may have to tweak the following command depending on where TensorFlow was installed by pip.
```bash
cp ~/.local/lib/python2.7/site-packages/tensorflow/python/_pywrap_tensorflow.so libtensorflow.so
```

Adjust your LD_LIBRARY_PATH to include the directory in which you've put `libtensorflow.so` and finally download a [very simple example](https://github.com/LaurentMazare/tensorflow-ocaml/tree/master/examples/basics/forty_two.ml) and compile it with the following command:
```bash
ocamlbuild forty_two.native -package ctypes -package ctypes.foreign -package core_kernel -package tensorflow-ocaml -cflags -w,-40
```

Enjoy!

## Examples

The MNIST tutorials from TensorFlow have been converted in OCaml and can be found [here](https://github.com/LaurentMazare/tensorflow-ocaml/tree/master/examples/mnist). For these examples, you will have to unzip the [MNIST data files](http://yann.lecun.com/exdb/mnist/) in `data/`.

* `examples/load/load.ml` contains a simple example where the TensorFlow graph is loaded from a file (this graph has been generated by `examples/load.py`).
* `examples/basics` contains some curve fitting examples. You will need gnuplot to be installed via opam to run the gnuplot versions.

## Generating the TensorFlow Graph from OCaml

The TensorFlow graph operators are defined in `src/graph/ops_generated.ml`. This file has been automatically generated from `src/gen_ops/ops.pbtxt` which comes from the TensorFlow distribution.
Only the basic operators are likely to work for now.

## Dependencies

* [ocaml-ctypes](https://github.com/ocamllabs/ocaml-ctypes) is used for the C bindings.
* [Core_kernel](https://github.com/janestreet/core_kernel) is only necessary when generating the graph from OCaml, the wrapper itself does not need it.
* The code in the piqi directory comes from the [Piqi project](http://piqi.org). There is no need to install piqi though.
