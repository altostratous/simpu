# simpu
This is a simple CPU designed usign Quartus altera lite edition for the Computer Architecture course in Sharif University of Technology.

## Documentation
All the docs can be found in the docs folder.
 
## Installation
Just clone the repository and the submodule to your PC and open the project file using Quartus and then build whole the project.

## Test
The project has passed functional simulations with clock equal to 10.0 nanoseconds. This project depends on the assembler project [simpasm](https://github.com/altostratous/simpasm).

There are two major tests to run, test_array_mul_minimal and test_array_sort_minimal. To run the tests first compile the project once
to ensure that there's no problem with the files and the Quartus/ModelSim version. 

Then you can load a program using the following commands in the project directory: 

    load.bat test_array_mul_minimal
    
Or
    
    load.bat test_sort_minimal
    
The script load.bat assembles (ensure that the submodule simpasm is cloned correctly) and loads instmemory.v and datamemory.v files into the project. 
    
After that go to Quartus and compile the project. Then open the ProgrammerTest.wvf or UniversalTest.wvf and run functional simulation. 

In the UniversalTest.wvf result you can see signal details and in the ProgrammerTest.wvf you can see clock cycles and register values.

## Running your own programs
To run your own program you can write your assembly as is described in the simpasm submodule and put it in the tests folder with 'asm' extension; test_x.asm for example. To put specific data in the data memory write your own datamemory.v file using the datamemory.v file template and put it in the tests folder with 'v' extension; test_x.v for example. 

Now you can run the following command for you program named test_x to load it to the memory files:

    load.bat test_x
    
After that you have to compile the project in the Quartus and follow the steps described in the Test section to run and test your program. 
