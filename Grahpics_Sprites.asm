#########################################################
# Sprites.asm
# Contains all digit and bit box sprite data for MARS
# Bitmap Display (0x10008000)
#
# Open this file **together** with Graphics.asm
# Then choose “Assemble All Files” in MARS.
#########################################################

.data
#########################################################
# DIGIT SPRITES (8x8 each, white on black)
#########################################################

.globl digit0 digit1 digit2 digit3 digit4 digit5 digit6 digit7 digit8 digit9
.globl bit0_box bit1_box sprite_table

digit0:
    .word 0,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0
    .word 0xFFFFFF,0,0,0,0,0,0,0xFFFFFF
    .word 0xFFFFFF,0,0,0,0,0,0,0xFFFFFF
    .word 0xFFFFFF,0,0,0,0,0,0,0xFFFFFF
    .word 0xFFFFFF,0,0,0,0,0,0,0xFFFFFF
    .word 0xFFFFFF,0,0,0,0,0,0,0xFFFFFF
    .word 0xFFFFFF,0,0,0,0,0,0,0xFFFFFF
    .word 0,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0

digit1:
    .word 0,0,0,0xFFFFFF,0,0,0,0
    .word 0,0,0,0xFFFFFF,0,0,0,0
    .word 0,0,0,0xFFFFFF,0,0,0,0
    .word 0,0,0,0xFFFFFF,0,0,0,0
    .word 0,0,0,0xFFFFFF,0,0,0,0
    .word 0,0,0,0xFFFFFF,0,0,0,0
    .word 0,0,0,0xFFFFFF,0,0,0,0
    .word 0,0,0,0xFFFFFF,0,0,0,0

digit2:
    .word 0,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0
    .word 0xFFFFFF,0,0,0,0,0,0,0xFFFFFF
    .word 0,0,0,0,0,0,0xFFFFFF,0xFFFFFF
    .word 0,0,0,0,0,0xFFFFFF,0xFFFFFF,0
    .word 0,0,0,0,0xFFFFFF,0xFFFFFF,0,0
    .word 0,0,0,0xFFFFFF,0xFFFFFF,0,0,0
    .word 0,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0
    .word 0,0,0,0,0,0,0,0

digit3:
    .word 0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0
    .word 0,0,0,0,0,0,0,0xFFFFFF
    .word 0,0,0,0,0,0xFFFFFF,0xFFFFFF,0xFFFFFF
    .word 0,0,0,0,0,0,0,0xFFFFFF
    .word 0,0,0,0,0,0,0,0xFFFFFF
    .word 0,0,0,0,0,0,0,0xFFFFFF
    .word 0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0
    .word 0,0,0,0,0,0,0,0

digit4:
    .word 0xFFFFFF,0,0,0,0,0,0xFFFFFF,0
    .word 0xFFFFFF,0,0,0,0,0xFFFFFF,0xFFFFFF,0
    .word 0xFFFFFF,0,0,0,0xFFFFFF,0,0xFFFFFF,0
    .word 0xFFFFFF,0,0xFFFFFF,0,0xFFFFFF,0,0xFFFFFF,0
    .word 0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0
    .word 0,0,0,0,0,0,0xFFFFFF,0
    .word 0,0,0,0,0,0,0xFFFFFF,0
    .word 0,0,0,0,0,0,0xFFFFFF,0

digit5:
    .word 0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0
    .word 0xFFFFFF,0,0,0,0,0,0,0
    .word 0xFFFFFF,0,0,0,0,0,0,0
    .word 0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0
    .word 0,0,0,0,0,0,0,0xFFFFFF
    .word 0,0,0,0,0,0,0,0xFFFFFF
    .word 0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0
    .word 0,0,0,0,0,0,0,0

digit6:
    .word 0,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0,0
    .word 0xFFFFFF,0,0,0,0,0,0,0
    .word 0xFFFFFF,0,0,0,0,0,0,0
    .word 0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0,0
    .word 0xFFFFFF,0,0,0,0,0,0,0xFFFFFF
    .word 0xFFFFFF,0,0,0,0,0,0,0xFFFFFF
    .word 0,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0,0
    .word 0,0,0,0,0,0,0,0

digit7:
    .word 0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0
    .word 0,0,0,0,0,0,0xFFFFFF,0
    .word 0,0,0,0,0,0xFFFFFF,0,0
    .word 0,0,0,0,0xFFFFFF,0,0,0
    .word 0,0,0,0xFFFFFF,0,0,0,0
    .word 0,0,0xFFFFFF,0,0,0,0,0
    .word 0,0xFFFFFF,0,0,0,0,0,0
    .word 0,0,0,0,0,0,0,0

digit8:
    .word 0,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0,0
    .word 0xFFFFFF,0,0,0,0,0,0xFFFFFF,0
    .word 0xFFFFFF,0,0,0,0,0,0xFFFFFF,0
    .word 0,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0,0
    .word 0xFFFFFF,0,0,0,0,0,0xFFFFFF,0
    .word 0xFFFFFF,0,0,0,0,0,0xFFFFFF,0
    .word 0,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0,0
    .word 0,0,0,0,0,0,0,0

digit9:
    .word 0,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0,0
    .word 0xFFFFFF,0,0,0,0,0,0xFFFFFF,0
    .word 0xFFFFFF,0,0,0,0,0,0xFFFFFF,0
    .word 0,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0
    .word 0,0,0,0,0,0,0,0xFFFFFF
    .word 0,0,0,0,0,0,0,0xFFFFFF
    .word 0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF,0,0
    .word 0,0,0,0,0,0,0,0

#########################################################
# BIT BOX SPRITES (colored boxes for 0 and 1)
#########################################################

bit0_box:
    .word 0x550000,0x550000,0x550000,0x550000,0x550000,0x550000,0x550000,0x550000
    .word 0x550000,0,0,0,0,0,0,0x550000
    .word 0x550000,0,0,0,0,0,0,0x550000
    .word 0x550000,0,0,0,0,0,0,0x550000
    .word 0x550000,0,0,0,0,0,0,0x550000
    .word 0x550000,0,0,0,0,0,0,0x550000
    .word 0x550000,0,0,0,0,0,0,0x550000
    .word 0x550000,0x550000,0x550000,0x550000,0x550000,0x550000,0x550000,0x550000

bit1_box:
    .word 0x00FF00,0x00FF00,0x00FF00,0x00FF00,0x00FF00,0x00FF00,0x00FF00,0x00FF00
    .word 0x00FF00,0,0,0,0,0,0,0x00FF00
    .word 0x00FF00,0,0,0,0,0,0,0x00FF00
    .word 0x00FF00,0,0,0,0,0,0,0x00FF00
    .word 0x00FF00,0,0,0,0,0,0,0x00FF00
    .word 0x00FF00,0,0,0,0,0,0,0x00FF00
    .word 0x00FF00,0,0,0,0,0,0,0x00FF00
    .word 0x00FF00,0x00FF00,0x00FF00,0x00FF00,0x00FF00,0x00FF00,0x00FF00,0x00FF00
    
DISPLAY_BASE: .word 0x10008000

#########################################################
# SPRITE TABLE (used by display_number)
#########################################################

sprite_table:
    .word digit0, digit1, digit2, digit3, digit4, digit5, digit6, digit7, digit8, digit9

.text
draw_pixel:
    # $a0 = x, $a1 = y, $a2 = color
    la $t0, DISPLAY_BASE
    lw $t0, 0($t0)           # load base address
    li $t1, 512              # screen width
    mul $t2, $a1, $t1        # y * width
    add $t2, $t2, $a0        # + x
    sll $t2, $t2, 2          # *4 bytes per pixel
    add $t2, $t2, $t0        # full address
    sw $a2, 0($t2)           # store color
    jr $ra
   # draw_box(x, y, color)
# draws an 8x8 square starting at (x, y)
draw_box:
    move $t0, $a0   # x
    move $t1, $a1   # y
    li $t2, 8       # height
outer:
    li $t3, 8       # width
    move $t4, $t0
inner:
    move $a0, $t4
    move $a1, $t1
    move $a2, $a2   # color already in $a2
    jal draw_pixel
    addi $t4, $t4, 1
    addi $t3, $t3, -1
    bnez $t3, inner
    addi $t1, $t1, 1
    addi $t2, $t2, -1
    bnez $t2, outer
    jr $ra
    
.globl draw_sprite
draw_sprite:
    addi $sp, $sp, -20       # reserve 5 words (keep 8-byte alignment)
    sw   $ra, 0($sp)
    sw   $t0, 4($sp)
    sw   $t1, 8($sp)
    sw   $t2, 12($sp)
    sw   $t3, 16($sp)

    li   $t0, 0x10008000     # Bitmap base address
    li   $t1, 512            # Screen width
    move $t2, $a0            # Sprite address pointer
    li   $t3, 0              # row index = 0

row_loop:
    li   $t4, 0              # col index = 0

col_loop:
    lw   $t5, 0($t2)         # color word
    add  $t6, $a2, $t3       # y + row
    mul  $t6, $t6, $t1       # * width
    add  $t6, $t6, $a1       # + x
    add  $t6, $t6, $t4       # + col
    sll  $t6, $t6, 2         # *4 (byte offset)
    add  $t6, $t6, $t0       # + base address

    beqz $t5, skip_pixel
    sw   $t5, 0($t6)         # draw pixel
skip_pixel:

    addi $t2, $t2, 4         # next color word
    addi $t4, $t4, 1
    blt  $t4, 8, col_loop    # loop until 8 columns done

    addi $t3, $t3, 1
    blt  $t3, 8, row_loop    # loop until 8 rows done

    # Restore registers and return
    lw $ra, 0($sp)
    lw $t0, 4($sp)
    lw $t1, 8($sp)
    lw $t2, 12($sp)
    lw $t3, 16($sp)
    addi $sp, $sp, 20
    jr $ra

#########################################################
# display_number($a0=number, $a1=x, $a2=y)
# Draws 0–255 number using digit sprites
#########################################################
display_number:
    # Save registers
    addi $sp, $sp, -20
    sw $ra, 0($sp)
    sw $t0, 4($sp)
    sw $t1, 8($sp)
    sw $t2, 12($sp)
    sw $t3, 16($sp)

    # Split number into hundreds, tens, ones
    move $t0, $a0
    li $t1, 100
    divu $t0, $t1
    mflo $t2       # hundreds
    mfhi $t3       # remainder
    li $t1, 10
    divu $t3, $t1
    mflo $t4       # tens
    mfhi $t5       # ones

    # Draw hundreds digit only if nonzero
    beqz $t2, skip_hundreds
    la $t6, sprite_table
    sll $t7, $t2, 2
    add $t6, $t6, $t7
    lw $a0, 0($t6)
    move $a1, $a1
    move $a2, $a2
    jal draw_sprite
    addi $a1, $a1, 10  # space between digits
skip_hundreds:

    # Draw tens
    la $t6, sprite_table
    sll $t7, $t4, 2
    add $t6, $t6, $t7
    lw $a0, 0($t6)
    move $a2, $a2
    jal draw_sprite
    addi $a1, $a1, 10

    # Draw ones
    la $t6, sprite_table
    sll $t7, $t5, 2
    add $t6, $t6, $t7
    lw $a0, 0($t6)
    move $a2, $a2
    jal draw_sprite

    # Restore and return
    lw $ra, 0($sp)
    lw $t0, 4($sp)
    lw $t1, 8($sp)
    lw $t2, 12($sp)
    lw $t3, 16($sp)
    addi $sp, $sp, 20
    jr $ra

