/*
 * Module: Control Flow (IF...ELSE)
 */

DECLARE @sales INT = 12000000;

IF @sales > 10000000
    PRINT 'Great! Target Achieved!';
ELSE
    PRINT 'Sales amount did not reach the target.';
