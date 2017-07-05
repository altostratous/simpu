                ADDI    $0  $0  0                   Zero value
                ADDI    $30 $30 75                  Memory zero value pointer
                ADDI    $5  $5  5                   Five value
                ADDI    $1  $1  5                   Row index
next_row        ADDI    $1  $1  -1                  Step to next row
                MUL     $31 $3  $5  $1              Point $3 to the current row in first array
                ADDI    $2  $2  5                   Column index
next_col        ADDI    $2  $2  -1                  Step to next column
                MOV     $10 $0                      Reset result array pointer
                ADD     $10 $3  $2                  Add result array offset
                ADDI    $10 $10 50                  Add result array address
                MOV     $4  $2                      Point $4 to the current column in the second array
                ADDI    $4  $4  25                  The second array address
                MOV     $6  $0                      Reset accumulator
                MOV     $7  $5                      Initialize counter
next_elem       ADDNDR  $8  $3  $30                 $8 = Mem[$3}
                ADDNDR  $9  $4  $30                 $8 = Mem[$4}
                MUL     $11 $12  $8  $9              Multiplication
                ADD     $6  $6  $12                  Accumulation
                ADDI    $7  $7  -1                  Count down
                ADDI    $3  $3  1                   Step over first array
                BNEQ    $7  $0  next_elem           Go to next element
                ADDI    $4  $4  5                   [SLOT] Step over second array
                BNEQ    $2  $0  next_col            Go to next column
                SWNDR   $10 $6                      [SLOT] Store the accumulation to the target cell
                BNEQ    $1  $0  next_row            Go to next row