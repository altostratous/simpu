                ADDI    $29 $29 5           Fill the memory
fill_next       SWNDR   $29 $28
                ADDI    $28 $28 1
                BNEQ    $29 $0  fill_next
                ADDI    $29 $29 -1          [SLOT]
                ADDI    $0  $0  0           Zero value
                ADDI    $30 $30 5           Point to memory zero value
                ADDI    $1  $1  5           100 counter
outer_loop      MOV     $2  $0
                ADDI    $2  $2  3           First pointer to array
                MOV     $3  $0
                ADDI    $3  $3  4           Second pointer to array
inner_loop      ADDNDR  $4  $2  $30         Load first element to $4
                ADDNDR  $5  $3  $30         Load second element to $5
                SLT     $6  $5  $4          Compare
                BEQ     $0  $6  skip        Skip swapping the elements
                ADD     $0  $0  $0          [SLOT]
                SWNDR   $3  $4              Swap the two elements
                SWNDR   $2  $5
skip            ADDI    $3  $3  -1          Step to next array element
                ADDI    $2  $2  -1          Step to next array element
                BNEQ    $3  $0  inner_loop
                ADD     $0  $0  $0          [SLOT]
                ADDI    $1  $1  -1          Decrement
                BNEQ    $0  $1  outer_loop
                MOV     $29 $0
                MOV     $28 $0
                ADDI    $29 $29 5           Read the memory
read_next       ADDNDR  $4  $28  $30
                ADDI    $29 $29 -1
                ADDI    $28 $28 1
                BNEQ    $29 $0  read_next