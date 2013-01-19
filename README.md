This is a "Hello world!" mruby program that compiles into a self-executing binary. This is
good because you can give it to anyone to download and run (provided they have the same
system as you, obviously), without them first needing to install ruby or rubygems or
whatever.

Instructions
============

To try this out:

Step 1. Install mruby:

    git clone https://github.com/mruby/mruby
    cd mruby
    make
    export MRUBY_HOME=$(pwd)

Step 2. Install mruby-example

    git clone https://github.com/ConradIrwin/mruby-example
    cd mruby-example
    make
    ./example

Meta-Fu
=======
This code is released into the public domain.
