#LineInitlization
.globl Fill
.globl Set
.data
 Line: .space 64 #s0 is line address

.text
 Fill:
  li $t3, 7
  la $t1,0($a0)
  slt $t0, $t2, $t3
  beq $t0,$zero, Fill_End
  addi $t1,$t1, 4
  addi $t2,$t2,1
  sw $zero, 0($t1)
  j $ra
  Set:  # set needs $a0,$a1 argument of two arrays of int[] Stores $a1,$a2 into $t12
  la $t1, 0($s0)
  la $t3,0($a0)
  la $t4,0($a1)
  li $t5, 7
  slt $t0,$t2,$t4
  beq $t0, $zero, Set_End
  addi $t3,$t3,4
  addi $t4,$t4,4
  addi $t2,$t2,1
  sw $t2,0($t3)
  j $ra
  Fill_End:
  Set_End:  
