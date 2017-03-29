SRC=Common.cpp Socket.cpp
EXEC_SRC=Server.cpp Client.cpp ServerSelective.cpp ClientSelective.cpp
INCLUDES= include/Socket.h include/Common.h

CFLAGS= -g -fPIC
LFLAGS=
LIB=
INCDIR= -I.

OBJECTS:= $(SRC:%.cpp=obj/%.o)
EXEC_OBJS:=$(EXEC_SRC:%.cpp=obj/%.o)
TARGETS:= $(EXEC_SRC:%.cpp=bin/%)

OBJDIR:= obj
BINDIR:= bin

.phony: OBJDIR

all: $(OBJDIR) $(BINDIR) $(OBJECTS) $(TARGETS)

bin/%: obj/%.o $(OBJECTS) 
	g++ $(LFLAGS) $(LIB) $^ -o $@

$(OBJDIR):
	mkdir -p obj

$(BINDIR):
	mkdir -p bin

obj/%.o: src/%.cpp $(INCLUDES)
	g++ $(INCDIR) $(CFLAGS) -c $<  -o $@

clean:
	@rm -f obj/*
	@rm -f bin/*

