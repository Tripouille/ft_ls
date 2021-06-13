BIN		= ft_ls
SRCS	= $(addprefix srcs/, main.c)
OBJS	= $(SRCS:srcs/%.c=objs/%.o)
DEPS	= $(SRCS:srcs/%.c=deps/%.d)

CC		= gcc
CFLAGS	= -Wall -Werror -Wextra -g3 -Iincludes
DFLAGS	= -MT $@ -MMD -MP -MF deps/$*.d

all: $(BIN)

objs/%.o: srcs/%.c
	$(CC) $(CFLAGS) $(DFLAGS) -c $< -o $@

$(BIN): $(OBJS)
	$(CC) $(CFLAGS) $^ -o $@

clean:
	rm -rf $(OBJS) $(DEPS) *.dSYM

fclean: clean
	rm -rf $(BIN)

re: fclean all

.PHONY: all clean fclean re
-include $(DEPS)
