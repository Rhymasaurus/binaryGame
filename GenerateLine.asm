#LineGeneration
.globl GenerateLine
.globl ConvertLineToInt
.text

#length
GenerateLine:
  li $t2, 0
  li $t4, 7 
  la $t0,$s0 # loads line address
  slt $t1, $t2,$t4
  beq $t1,$zero, GenerateLine_Exit
  addi $t2,$t2, 1
  addi $t0,$t0,4
  jal GenerateBoolean
  sw $t3,0($t0)
GenerateLine_Exit:
j Exit  
GenerateBoolean
li $t3, 0
li $v0, 42
li $a0, 1
syscall
move $t3,$s0
j $ra


ConvertLineToInt
la $t0,32($s0)
li $t1,0 #i = 0 or 2^i for bit * 2^i = value
li $t2,0 #value 
li $t3,0 #x index
li $t5,0 #hold
li $t6,1 #holds 1 
ConvertLineToInt_Loop
slt $t1,$t3, $t4
beq $t1,$zero, ConvertLineToInt_Loop_Exit
sll $t5,$t6,$t1
add $t2,$t2,$t3
addi $t3,$t3,1
subi $t0,$t0,4
ConvertLineToInt_Loop_Exit
#returns Value in $v0
move $v0,$t3
j $ra

Exit:
