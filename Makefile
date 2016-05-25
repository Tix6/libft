# ---------------------------------------------------------------------------- #
# PROJECT DATA
# ---------------------------------------------------------------------------- #

NAME		=	libft.a

# ---------------------------------------------------------------------------- #

SRCS		=	
# ---------------------------------------------------------------------------- #
# PROJECT CONFIGURATION
# ---------------------------------------------------------------------------- #

CFLAGS		=	\
				-g 								\
				-Wall -Wextra -Werror			\

# >>> REQUIRED FOR LIBRARIES >>> THINK ABOUT CHANGING THE *LIBS rules

CPPFLAGS	=	\
				-I $(DIRINC)					\

LDFLAGS		=	\

LDLIBS		=	\

# GLOBAL SETUP
AR			=	ar
CC			=	clang
RM			=	rm
MKDIR		=	mkdir
MAKE		=	make

DIRSRC		=	./srcs/
DIROBJ		=	./.objs/
DIRINC		=	./incs/
DIRLIB		=	./libs/

# EXTRA COLOR
C_DFL		=	\033[0m
C_GRA		=	\033[30m
C_RED		=	\033[31m
C_GRE		=	\033[32m
C_YEL		=	\033[33m
C_BLUE		=	\033[34m
C_MAG		=	\033[35m
C_CYA		=	\033[36m
C_WHI		=	\033[37m

# ============================================================================ #

# ---------------------------------------------------------------------------- #
# SOURCES NORMALIZATION
# ---------------------------------------------------------------------------- #

SRC			=	$(addprefix $(DIRSRC), $(SRCS))
OBJ			=	$(addprefix $(DIROBJ), $(notdir $(SRC:.c=.o)))

# ---------------------------------------------------------------------------- #
# RULES
# ---------------------------------------------------------------------------- #

all			:	libs $(NAME)
	@printf "$(C_GRE)[ $(NAME) ] [ %-6s ]$(C_DFL) build completed\n" "$(MAKE)"

$(NAME)		:	$(DIROBJ) $(OBJ)
	@printf "$(C_GRE)[ $(NAME) ] [ %-6s ]$(C_DFL) linking objects\n" "$(CC)"
	@$(AR) rc $(NAME) $(OBJ)
	@printf "$(C_GRE)[ $(NAME) ] [ %-6s ]$(C_DFL) index project\n" "ranlib"
	@ranlib $(NAME)

# ---------------------------------------------------------------------------- #
# CUSTOMISABLE RULES

libs		:

fcleanlibs	:

# ---------------------------------------------------------------------------- #

clean		:
	@printf "$(C_GRE)[ $(NAME) ] [ %-6s ]$(C_DFL) remove objects\n" "$(RM)"
	@$(RM) -rf $(DIROBJ)

fclean		:	fcleanlibs clean
	@printf "$(C_GRE)[ $(NAME) ] [ %-6s ]$(C_DFL) remove binaries\n" "$(RM)"
	@$(RM) -f $(NAME)

re			:	fclean all

$(DIROBJ)	:
	@$(MKDIR) -p $(DIROBJ)

depend		:
	@sed -e '/^#start/,/^end/d' Makefile > .mftmp && mv .mftmp Makefile
	@printf "#start\n\n" >> Makefile
	@$(foreach s, $(SRC),													\
		printf '$$(DIROBJ)'										>> Makefile	&& \
		$(CC) -MM $(s) $(CPPFLAGS)								>> Makefile	&& \
																			\
		printf '\t\t@printf "$$(C_GRE)[ $(NAME) ] '				>> Makefile && \
		printf '[ %%-6s ]$$(C_DFL) " "$(CC)"\n'					>> Makefile && \
		printf '\t\t@printf "compiling $(s)\\n"\n'				>> Makefile	&& \
																			\
		printf '\t\t@$$(CC) -c $(s) -o '						>> Makefile	&& \
		printf '$(addprefix $(DIROBJ), $(notdir $(s:.c=.o))) '	>> Makefile	&& \
		printf '$$(CPPFLAGS) $$(CFLAGS) \n\n'					>> Makefile	&& \
																			\
		printf "$(C_GRE)[ $(NAME) ] [ %-6s ]$(C_DFL) " "dep"				&& \
		printf "$(s) rule generated\n"										|| \
																			\
		(sed -e '/^#start/,$$d' Makefile > .mftmp && mv .mftmp Makefile		&& \
		printf "#start\n\n"										>> Makefile	&& \
		printf "$(C_RED)[ $(NAME) ] [ %-6s ]$(C_DFL) " "dep"				&& \
		printf "$(s) rule generation failed\n"								) \
	;)
	@printf "\n#end\n" >> Makefile

.PHONY	:	 libs

# ---------------------------------------------------------------------------- #
# AUTO-GENERATED SECTION - do not modify
# ---------------------------------------------------------------------------- #

#start

#end
