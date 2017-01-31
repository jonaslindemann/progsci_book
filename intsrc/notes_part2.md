# Procedures as argument

 * procedures in Fortran 95 can take procedures as arguments
 * Properties of ?dummy? procedure arguments must agree
 * The procedure type is declared in the specification part
 * Internal procedures can?t be used

# Exempel 31

# Keyword and optional arugments

 * Many procedures have long argument lists
  * All arguments not needed
 * Procedural arguments in Fortran can be given the attribute optional 
  * real, optional :: a
 * Optional arguments can be omitted in the procedure call
  * Presence of an argument can be tested with the present function.
 * Arguments can be specified with keywords


