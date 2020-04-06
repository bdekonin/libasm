# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: bdekonin <bdekonin@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/15 18:26:05 by bdekonin      #+#    #+#                  #
#    Updated: 2020/04/04 22:19:22 by bdekonin      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

RM = rm -f
LIB = ar rcs

CC = gcc
CCFLAGS = -g -Wall -Wextra -fomit-frame-pointer

NASM = nasm
NASMFLAGS = -f macho64

NAME = libasm.a
ASMSRC = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s \
		 ft_strdup.s

ASMOBJ = $(ASMSRC:.s=.o)

all: $(NAME)

$(NAME): $(ASMOBJ)
	$(LIB) $(NAME) $(ASMOBJ)

test: all
	$(CC) main.c $(NAME)

%.o: %.s
	$(NASM) $(NASMFLAGS) -o $@ $<

clean:
	$(RM) $(ASMOBJ)

fclean: clean
	$(RM) $(NAME)

re: fclean all