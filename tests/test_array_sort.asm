                ADDI    $0  $0  0           Zero value
                ADDI    $30 $30 100         Point to memory zero value
                ADDI    $1  $1  100         100 counter
outer_loop      MOV     $2  $0
                ADDI    $2  $2  98          First pointer to array
                MOV     $3  $0
                ADDI    $3  $3  99          Second pointer to array
inner_loop      ADDNDR  $4  $2  $30         Load first element to $4
                ADDNDR  $5  $3  $30         Load second element to $5
                SLT     $6  $5  $4          Compare
                BEQ     $0  $6  skip        Skip swapping the elements
                SWNDR   $3  $4              Swap the two elements
                SWNDR   $2  $5
skip            ADDI    $3  $3  -1          Step to next array element
                ADDI    $2  $2  -1          Step to next array element
                BNEQ    $2  $0  inner_loop
                ADDI    $1  $1  -1          Decrement
                BNEQ    $0  $1  outer_loop