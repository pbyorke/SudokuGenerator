////
////  Main.swift
////  SudokuGenerator
////
////  Created by Peter Yorke on 4/26/23.
////
//
//import Foundation
//
//// /* The main function reads in a Sudoku puzzle from the standard input,
////  * unless a file name is provided as a run-time argument, in which case the
////  * Sudoku puzzle is loaded from that file.  It then solves the puzzle, and
////  * outputs the completed puzzle to the standard output. */
//// public static void main( String args[] ) throws Exception
//// {
////  InputStream in;
////  if( args.length > 0 )
////   in = new FileInputStream( args[0] );
////  else
////   in = System.in;
////
////  // The first number in all Sudoku files must represent the size of the puzzle.  See
////  // the example files for the file format.
////  int puzzleSize = readInteger( in );
////  if( puzzleSize > 100 || puzzleSize < 1 ) {
////   System.out.println("Error: The Sudoku puzzle size must be between 1 and 100.");
////   System.exit(-1);
////  }
////
////  Sudoku s = new Sudoku( puzzleSize );
////
////  // read the rest of the Sudoku puzzle
////  s.read( in );
////
////  // Solve the puzzle.  We don't currently check to verify that the puzzle can be
////  // successfully completed.  You may add that check if you want to, but it is not
////  // necessary.
////  long startTime = System.currentTimeMillis(); // test
////  s.solve();
////  long endTime = System.currentTimeMillis(); // test
////  System.out.println(endTime-startTime); // test
////  //  s.solve();
////
////  // Print out the (hopefully completed!) puzzle
////  s.print();
//// }
