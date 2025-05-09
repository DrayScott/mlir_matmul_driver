cmake_minimum_required(VERSION 3.13)
project(MatmulMLIR)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_PREFIX_PATH "~/dev/mlir-install")

find_package(MLIR REQUIRED CONFIG)

# Enable warnings 
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti")

# Include directories and definitions
include_directories(${MLIR_INCLUDE_DIRS})
link_directories(${MLIR_LIBRARY_DIRS})
add_definitions(${MLIR_DEFINITIONS})

# Required includes from MLIR config
include(${MLIR_CMAKE_DIR}/MLIRConfig.cmake)
include(${MLIR_CMAKE_DIR}/MLIRTargets.cmake)
include(${MLIR_CMAKE_DIR}/AddMLIR.cmake)

# List of dialects you need (add more as your code uses them)
set(MLIR_DIALECT_LIBS
  MLIRFuncDialect
  MLIRAffineDialect
  MLIRLinalgDialect
  MLIRMemRefDialect
  MLIRSCFDialect
  MLIRTensorDialect
  MLIRLLVMDialect
)

# List of required MLIR libraries
set(MLIR_LIBS
  MLIRIR
  MLIRParser
  MLIRSupport
  MLIRPass
  MLIRTransforms
  MLIRExecutionEngine
  MLIRTargetLLVMIRExport
  MLIRTargetLLVMIRImport
  MLIRLLVMIRTransforms
  MLIRLLVMIRToLLVMTranslation
  MLIRTranslateLib
  ${MLIR_DIALECT_LIBS}
)
# Optional: If you’re JIT-running
find_package(LLVM REQUIRED CONFIG)
list(APPEND MLIR_LIBS
  LLVMCore
  LLVMSupport
  LLVMExecutionEngine
  LLVMOrcJIT
)

add_executable(matmul-driver src/main.cpp)

target_link_libraries(matmul-driver PRIVATE ${MLIR_LIBS})
target_include_directories(matmul-driver PRIVATE ${MLIR_INCLUDE_DIRS})

