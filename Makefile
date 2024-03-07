BIN = enterprise

CFLAGS += -Wall -Wextra -pedantic -fsanitize=address,undefined -g

SRC = src/main.c
OBJ = $(SRC:.c=.o)

LIBS = -lm

$(BIN): prepare
	$(CC) $(SRC) $(CFLAGS) -o bin/native/$(BIN) $(LIBS)

web: prepare
	emcc $(SRC) -Os -o bin/web/index.html -idirafter/usr/include/

prepare:
	rm -rf bin/
	mkdir -p bin/native && mkdir -p bin/web/