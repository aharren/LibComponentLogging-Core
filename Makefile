
CC ?= cc
CFLAGS = -std=c99 -Wall -Wextra -Ideps -I. -Itest
LDFLAGS =""
SRC = $(wildcard *.c)
SRC += $(wildcard deps/*/*.c)
SRC += $(wildcard test/helper/*.c)
OBJS = $(SRC:.c=.o)
TESTS = $(wildcard test/*.c)

test: $(TESTS)
	@ $(foreach t, $(TESTS), rm -f $(basename $(t));)
	@ rm -rf *.o
	@ rm test/helper/*.o

$(TESTS): $(OBJS)
	@ $(CC) $(CFLAGS) -o $(basename $@) $@ $(OBJS) $(LDFLAGS)
	@ ./$(basename $@)

%.o: %.c
	@ $(CC) $< -c -o $@ $(CFLAGS)

clean:
	$(foreach t, $(TESTS), rm -f $(basename $(t));)
	rm -rf *.o
	rm -rf test/helper/*.o

.PHONY: test $(TESTS)
