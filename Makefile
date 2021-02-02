SOURCES=$(wildcard src/*.cpp)
OBJECTS=$(patsubst %.cpp, %.o, $(SOURCES))
CPPFLAGS=-Iinclude -I/usr/local/Cellar/sdl/1.2.15_3/include/SDL -std=c++17 -g -O0 -fsanitize=address
LDFLAGS=-lSDL -lcairo -g -I/usr/local/Cellar/sdl/1.2.15_3/lib -lSDLmain -framework Cocoa
CXX=clang++

all: $(OBJECTS)
	$(CXX) -o html_engine $(OBJECTS) $(LDFLAGS) -fsanitize=address

clean:
	rm -rf html_engine $(OBJECTS)

run: all
	# ./html_engine tests/test9.html
	./html_engine

.PHONY: all clean run
