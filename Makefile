RUBY_FILES=example.rb
EXE=./example

# Build the program. Make lean if it's too big
all: ${EXE}

# Clean the build directory
clean:
	rm -f build/*

# Remove some extra bytes from the output
lean: ${EXE}
	strip ${EXE}

# Build all the C code that is created below
${EXE}: build/ruby.c build/wrap.c
	gcc -I${MRUBY_HOME}/include -c build/wrap.c -o build/wrap.o
	gcc -o ${EXE} build/wrap.o ${MRUBY_HOME}/build/host/mrblib/mrblib.o ${MRUBY_HOME}/build/host/lib/libmruby.a -lm

# Convert ruby source code to C
build/ruby.c: ${RUBY_FILES}
	${MRUBY_HOME}/bin/mrbc -Cruby -obuild/ruby.c ${RUBY_FILES}

# Generate the C wrapper needed to create a self-executing mruby program
build/wrap.c:
	echo '#include "ruby.c"\nint main(void){ mrb_state *mrb; mrb = mrb_open(); ruby(mrb); mrb_close(mrb); return 0; }' > build/wrap.c
