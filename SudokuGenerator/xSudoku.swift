////
////  Sudoku.swift
////  SudokuGenerator
////
////  Created by Peter Yorke on 4/25/23.
////
//
//import Foundation
//
//class Sudoku {
//    var SIZE    = 0
//    var N       = 0
//    var Grid    = [[Int]]()
//
//    func solve() {
//        AlgorithmXSolver().run(Grid)
//    }
//    
////
////
////
//// /*****************************************************************************/
//// /* NOTE: YOU SHOULD NOT HAVE TO MODIFY ANY OF THE FUNCTIONS BELOW THIS LINE. */
//// /*****************************************************************************/
////
//// /* Default constructor.  This will initialize all positions to the default 0
////  * value.  Use the read() function to load the Sudoku puzzle from a file or
////  * the standard input. */
//// public Sudoku( int size )
//// {
////  SIZE = size;
////  N = size*size;
////
////  Grid = new int[N][N];
////  for( int i = 0; i < N; i++ )
////   for( int j = 0; j < N; j++ )
////    Grid[i][j] = 0;
//// }
////
////
//// /* readInteger is a helper function for the reading of the input file.  It reads
////  * words until it finds one that represents an integer. For convenience, it will also
////  * recognize the string "x" as equivalent to "0". */
//// static int readInteger( InputStream in ) throws Exception
//// {
////  int result = 0;
////  boolean success = false;
////
////  while( !success ) {
////   String word = readWord( in );
////
////   try {
////    result = Integer.parseInt( word );
////    success = true;
////   } catch( Exception e ) {
////    // Convert 'x' words into 0's
////    if( word.compareTo("x") == 0 ) {
////     result = 0;
////     success = true;
////    }
////    // Ignore all other words that are not integers
////   }
////  }
////
////  return result;
//// }
////
////
//// /* readWord is a helper function that reads a word separated by white space. */
//// static String readWord( InputStream in ) throws Exception
//// {
////  StringBuffer result = new StringBuffer();
////  int currentChar = in.read();
////  String whiteSpace = " \t\r\n";
////  // Ignore any leading white space
////  while( whiteSpace.indexOf(currentChar) > -1 ) {
////   currentChar = in.read();
////  }
////
////  // Read all characters until you reach white space
////  while( whiteSpace.indexOf(currentChar) == -1 ) {
////   result.append( (char) currentChar );
////   currentChar = in.read();
////  }
////  return result.toString();
//// }
////
////
//// /* This function reads a Sudoku puzzle from the input stream in.  The Sudoku
////  * grid is filled in one row at at time, from left to right.  All non-valid
////  * characters are ignored by this function and may be used in the Sudoku file
////  * to increase its legibility. */
//// public void read( InputStream in ) throws Exception
//// {
////  for( int i = 0; i < N; i++ ) {
////   for( int j = 0; j < N; j++ ) {
////    Grid[i][j] = readInteger( in );
////   }
////  }
//// }
////
////
//// /* Helper function for the printing of Sudoku puzzle.  This function will print
////  * out text, preceded by enough ' ' characters to make sure that the printint out
////  * takes at least width characters.  */
//// void printFixedWidth( String text, int width )
//// {
////  for( int i = 0; i < width - text.length(); i++ )
////   System.out.print( " " );
////  System.out.print( text );
//// }
////
////
//// /* The print() function outputs the Sudoku grid to the standard output, using
////  * a bit of extra formatting to make the result clearly readable. */
//// public void print()
//// {
////  // Compute the number of digits necessary to print out each number in the Sudoku puzzle
////  int digits = (int) Math.floor(Math.log(N) / Math.log(10)) + 1;
////
////  // Create a dashed line to separate the boxes
////  int lineLength = (digits + 1) * N + 2 * SIZE - 3;
////  StringBuffer line = new StringBuffer();
////  for( int lineInit = 0; lineInit < lineLength; lineInit++ )
////   line.append('-');
////
////  // Go through the Grid, printing out its values separated by spaces
////  for( int i = 0; i < N; i++ ) {
////   for( int j = 0; j < N; j++ ) {
////    printFixedWidth( String.valueOf( Grid[i][j] ), digits );
////    // Print the vertical lines between boxes
////    if( (j < N-1) && ((j+1) % SIZE == 0) )
////     System.out.print( " |" );
////    System.out.print( " " );
////   }
////   System.out.println();
////
////   // Print the horizontal line between boxes
////   if( (i < N-1) && ((i+1) % SIZE == 0) )
////    System.out.println( line.toString() );
////  }
//// }
////
////
//}
//
//
//
//
//
//
//
////class Sudoku
////{
//// /* SIZE is the size parameter of the Sudoku puzzle, and N is the square of the size.  For
////  * a standard Sudoku puzzle, SIZE is 3 and N is 9. */
//// int SIZE, N;
////
//// /* The grid contains all the numbers in the Sudoku puzzle.  Numbers which have
////  * not yet been revealed are stored as 0. */
//// int Grid[][];
////
////
//// /* The solve() method should remove all the unknown characters ('x') in the Grid
////  * and replace them with the numbers from 1-9 that satisfy the Sudoku puzzle. */
////
////
//// /************************************************************************************************************************************************************/
//// // DOCUMENTATION -- ALGORITHM X, EXACT COVER PROBLEM AND DANCING LINKS IMPLEMENTATION
////
//// // My class AlgorithmXSolver takes an unsolved Sudoku puzzled as int[][] (the Grid) and outputs the solved Sudoku puzzle.
//// // I convert the Sudoku puzzle into an Exact Cover problem, solve that using the Dancing Links algorithm as described by Dr Donald Knuth,
//// // and then get the solution and map it onto the Grid.
////
//// // EXACT COVER AND DANCING LINKS
//// /*An Exact Cover problem can be represented as a sparse matrix where the rows represent possibilities, and the columns
////  * represent constraints. Every row will have a 1 in every column (constraint) that it satisfies, and a 0 otherwise. A set
////  * of rows that together have exactly one 1 for each column can be said to be the solution set of the Exact Cover problem. Now,
////  * Dancing Links is an efficient way of solving such a problem. The idea is to take the Exact Cover matrix and put it into a
////  * a toroidal circular doubly-linked list. Thus, every node in such a list will be connected to 4 other nodes and the list will be circular
////  * i.e. the last element will point to the first one. In the case of Dancing Links, for every column of the linked list, there is a
////  * special ColumnNode (which extends the normal Node) that contains identifying information about that particular column as well as
////  * the size of the column i.e. the number of nodes in it. Each Node points to four other nodes as mentioned, as well as its ColumnNode.
////  *
////   // SOLVING
////  * To solve the Exact Cover problem i.e. come up with a set of rows that contain exactly one 1 for every column/constraint, we search
////  * recursively using the principles of backtracking. It chooses a column, 'covers' it i.e. removes that column from the linked list completely,
////  * store it in a solution list (which I implemented using an ArrayList), and then try to recursively solve the rest of the table. If
////  * it's not possible, backtrack, restore the column (uncover it), and try a different column. For this assignment I assumed that the
////  * Sudoku problem being provided has a solution.
////  *
////   // SUDOKU APPLICATION
////  * For Sudoku, there are 4 constraints. Only 1 instance of a number can be in a row, in a column, and in a block. In addition, there can
////  * be only one number in a cell. The rows represent every single possible position for every number. Every row would have 4 1s, representing
////  * one possible place for the number (satisfying all 4 constraints).
////  * To implement my solution, I created a class AlgorithmXSolver that contained all the methods and the data structures required to solve
////  * the problem. I instantiated an instance of this class in the solve() method, and then ran it.
////  * I had to convert the given Grid into a sparse matrix, accounting for the given clues (filled in values). Then, this matrix
////  * is converted into a linked list as talked about above and solved using the Dancing Links approach. We store
////  * possible solutions in an ArrayList 'solution'. Once we get a set of Nodes that solves the problem, we take the solution list
////  * and iterate over every single Node and map the solution over the original Grid.
////  *
////  // TESTING
////  * I tested my solver using the puzzles provided by Prof Blanchette by passing the sudoku text file as the args[] variable
////  * of the main method. I did this in Eclipse by editing the Run Configuration (and providing the full path to the text file
////  * in the Arguments tab).
////  */
////
//// // CREDITS:
//// // (1) Dr Donald Knuth's original paper (http://www.ocf.berkeley.edu/~jchu/publicportal/sudoku/0011047.pdf) on Dancing Links
//// // (2) Jonathan Chu's paper for the pseudocode for the Dancing Links implementation (http://www.ocf.berkeley.edu/~jchu/publicportal/sudoku/sudoku.paper.html)
//// // (3) The Wikipedia pages on Dancing Links, Exact Cover problem, Algorithm X for helping to understand Knuth's paper
//// // (4) This StackOverflow discussion to intuitively understand the Dancing Links implementation: http://stackoverflow.com/questions/1518335/the-dancing-links-algorithm-an-explanation-that-is-less-explanatory-but-more-o
//// // (5) Xi Chen's implementation in C to get an understanding of the data structures (http://uaa.wtf.im/?page_id=27)
//// // (6) Alex Rudnick's implementation in Python for getting ideas on how to implement some of the methods (https://code.google.com/p/narorumo/wiki/SudokuDLX)
//// /************************************************************************************************************************************************************/
//// public void solve()
//// {
////  AlgorithmXSolver solver= new AlgorithmXSolver();
////  solver.run(Grid);
//// }
////
////
////
//// /*****************************************************************************/
//// /* NOTE: YOU SHOULD NOT HAVE TO MODIFY ANY OF THE FUNCTIONS BELOW THIS LINE. */
//// /*****************************************************************************/
////
//// /* Default constructor.  This will initialize all positions to the default 0
////  * value.  Use the read() function to load the Sudoku puzzle from a file or
////  * the standard input. */
//// public Sudoku( int size )
//// {
////  SIZE = size;
////  N = size*size;
////
////  Grid = new int[N][N];
////  for( int i = 0; i < N; i++ )
////   for( int j = 0; j < N; j++ )
////    Grid[i][j] = 0;
//// }
////
////
//// /* readInteger is a helper function for the reading of the input file.  It reads
////  * words until it finds one that represents an integer. For convenience, it will also
////  * recognize the string "x" as equivalent to "0". */
//// static int readInteger( InputStream in ) throws Exception
//// {
////  int result = 0;
////  boolean success = false;
////
////  while( !success ) {
////   String word = readWord( in );
////
////   try {
////    result = Integer.parseInt( word );
////    success = true;
////   } catch( Exception e ) {
////    // Convert 'x' words into 0's
////    if( word.compareTo("x") == 0 ) {
////     result = 0;
////     success = true;
////    }
////    // Ignore all other words that are not integers
////   }
////  }
////
////  return result;
//// }
////
////
//// /* readWord is a helper function that reads a word separated by white space. */
//// static String readWord( InputStream in ) throws Exception
//// {
////  StringBuffer result = new StringBuffer();
////  int currentChar = in.read();
////  String whiteSpace = " \t\r\n";
////  // Ignore any leading white space
////  while( whiteSpace.indexOf(currentChar) > -1 ) {
////   currentChar = in.read();
////  }
////
////  // Read all characters until you reach white space
////  while( whiteSpace.indexOf(currentChar) == -1 ) {
////   result.append( (char) currentChar );
////   currentChar = in.read();
////  }
////  return result.toString();
//// }
////
////
//// /* This function reads a Sudoku puzzle from the input stream in.  The Sudoku
////  * grid is filled in one row at at time, from left to right.  All non-valid
////  * characters are ignored by this function and may be used in the Sudoku file
////  * to increase its legibility. */
//// public void read( InputStream in ) throws Exception
//// {
////  for( int i = 0; i < N; i++ ) {
////   for( int j = 0; j < N; j++ ) {
////    Grid[i][j] = readInteger( in );
////   }
////  }
//// }
////
////
//// /* Helper function for the printing of Sudoku puzzle.  This function will print
////  * out text, preceded by enough ' ' characters to make sure that the printint out
////  * takes at least width characters.  */
//// void printFixedWidth( String text, int width )
//// {
////  for( int i = 0; i < width - text.length(); i++ )
////   System.out.print( " " );
////  System.out.print( text );
//// }
////
////
//// /* The print() function outputs the Sudoku grid to the standard output, using
////  * a bit of extra formatting to make the result clearly readable. */
//// public void print()
//// {
////  // Compute the number of digits necessary to print out each number in the Sudoku puzzle
////  int digits = (int) Math.floor(Math.log(N) / Math.log(10)) + 1;
////
////  // Create a dashed line to separate the boxes
////  int lineLength = (digits + 1) * N + 2 * SIZE - 3;
////  StringBuffer line = new StringBuffer();
////  for( int lineInit = 0; lineInit < lineLength; lineInit++ )
////   line.append('-');
////
////  // Go through the Grid, printing out its values separated by spaces
////  for( int i = 0; i < N; i++ ) {
////   for( int j = 0; j < N; j++ ) {
////    printFixedWidth( String.valueOf( Grid[i][j] ), digits );
////    // Print the vertical lines between boxes
////    if( (j < N-1) && ((j+1) % SIZE == 0) )
////     System.out.print( " |" );
////    System.out.print( " " );
////   }
////   System.out.println();
////
////   // Print the horizontal line between boxes
////   if( (i < N-1) && ((i+1) % SIZE == 0) )
////    System.out.println( line.toString() );
////  }
//// }
////
////
////}
