#include "mlir/Conversion/SCFToControlFlow/SCFToControlFlow.h"
#include "mlir/Dialect/Linalg/Passes.h"
#include "mlir/IR/DialectRegistry.h"
#include "mlir/IR/MLIRContext.h"
#include "mlir/Parser/Parser.h"
#include "mlir/Support/FileUtilities.h"
#include "mlir/Support/LogicalResult.h"
#include "mlir/Support/ToolUtilities.h"
#include "mlir/IR/BuiltinOps.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/InitLLVM.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/ToolOutputFile.h"
#include "llvm/Support/raw_ostream.h"
#include "mlir/IR/Operation.h"
#include <string>
// Dialect headers
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/Linalg/IR/Linalg.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/Dialect/Tensor/IR/Tensor.h"
#include "mlir/Dialect/LLVMIR/LLVMDialect.h"
#include "mlir/InitAllDialects.h"

// This are for adding the passes
#include "mlir/Transforms/Passes.h"
#include "mlir/Pass/PassManager.h"
#include "mlir/Transforms/GreedyPatternRewriteDriver.h"
#include "mlir/Conversion/Passes.h"
#include "mlir/InitAllPasses.h"
#include "mlir/Target/LLVMIR/Export.h"

using namespace mlir;

int main(int argc, char **argv) {
  llvm::InitLLVM y(argc, argv);

  llvm::cl::opt<std::string> inputFilename(llvm::cl::Positional, llvm::cl::desc("<input file>"), llvm::cl::Required);
  llvm::cl::ParseCommandLineOptions(argc, argv, "MLIR driver\n");

  // Set up context
  MLIRContext context;
  context.disableMultithreading(); 
  context.loadDialect<func::FuncDialect,
                      linalg::LinalgDialect,
                      affine::AffineDialect,
                      memref::MemRefDialect,
                      scf::SCFDialect,
                      tensor::TensorDialect>();

  // Load file
  std::string errorMessage;
  auto file = openInputFile(inputFilename, &errorMessage);
  if (!file) {
    llvm::errs() << "Failed to open input file: " << errorMessage << "\n";
    return 1;
  }

  llvm::SourceMgr sourceMgr;
  sourceMgr.AddNewSourceBuffer(std::move(file), llvm::SMLoc());

  // Parse MLIR module
  OwningOpRef<ModuleOp> module = parseSourceFile<ModuleOp>(sourceMgr, &context);
  if (!module) {
    llvm::errs() << "Failed to parse MLIR file.\n";
    return 1;
  }

  mlir::PassManager pm(&context);

  pm.enableIRPrinting(); //enables debugging output for passmanager

  pm.addPass(mlir::createCanonicalizerPass());
  pm.addPass(mlir::createCSEPass());

  // pass pipeline
  if (mlir::failed(pm.run(*module))){
    llvm::errs() << "Failed to run passes\n";
    return 1;
  }

  module->getOperation()->dump();
  return 0;
}
