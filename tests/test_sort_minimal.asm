                ADDI    $29 $29 5           Fill the memory
fill_next       SWNDR   $29 $28
                ADDI    $28 $28 1
                ADDI    $29 $29 -1
                BNEQ    $29 $0  fill_next
                ADDI    $0  $0  0           Zero value
                ADDI    $30 $30 5           Point to memory zero value
                ADDI    $1  $1  5           100 counter
outer_loop      MOV     $2  $0
                ADDI    $2  $2  2           First pointer to array
                MOV     $3  $0
                ADDI    $3  $3  4           Second pointer to array
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