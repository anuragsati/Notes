CXX = g++
CXXFLAGS = -Wall -Wextra -Wno-sign-conversion -Wshadow -D_GLIBCXX_DEBUG -D_GLIBCXX_ASSERTIONS -fsanitize=address,undefined

% : %.cpp
	@ $(CXX) $(CXXFLAGS) $@.cpp -o $@.out
	@ MallocNanoZone=0 ./$@.out
	@ rm $@.out
	@ echo "\n\n\n\n\n"

clean :
	rm *.out