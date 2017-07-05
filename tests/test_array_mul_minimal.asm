            ADDI    $31 $31 27
            ADDI    $0  $0  0           Zero value
            MOV     $1  $0
            ADDI    $3  $3  3           Three value
            MOV     $2  $0
            ADDI    $1  $1  3           Row index
next_row    ADDI    $2  $2  3           Column index
            ADDI    $1  $1  -1
next_column ADDI    $2  $2  -1
            MUL     $30 $4  $3  $1
            MOV     $5  $0
            ADD     $5  $5  $2
            MOV     $13 $0
            ADD     $13 $13 $4
            ADD     $13 $13 $5
            ADDI    $13 $13 18
            ADDI    $5  $5  9
            MOV     $6  $0
            ADDI    $6  $6  2
            MOV     $7  $0
next        ADDNDR  $8  $31 $4
            ADDNDR  $9  $31 $5
            MUL     $30 $12 $8  $9
            ADD     $7  $7  $12
            ADDI    $4  $4  1
            ADDI    $5  $5  3
            BNEQ    $6  $0  next
            ADDI    $6  $6  -1
            SWNDR   $13 $7
            BNEQ    $2  $0  next_column
            ADD     $0  $0  $0
            BNEQ    $1  $0  next_row
            ADD     $0  $0  $0