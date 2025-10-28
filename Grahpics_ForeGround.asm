#########################################################
# Graphics_ForeGround.asm
# High-level drawing routines for numbers, bytes, and boxes
# Safe for MARS Bitmap Display (base 0x10008000)
#########################################################

.data 0x10020000        # avoid overlap with bitmap display
ScreenWidth:   .word 512
ScreenHeight:  .word 512

.text
.globl display_number
.globl display_byte
.globl display_box_outline
.globl draw_box_outline


#########################################################
# display_number($a0=0–255, $a1=x, $a2=y)
#########################################################

display_number:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    move $t0, $a0        # number
    move $t1, $a1        # x
    move $t2, $a2        # y

    li   $t3, 100
    divu $t0, $t3
    mflo $t4
    mfhi $t5

    li   $t3, 10
    divu $t5, $t3
    mflo $t6
    mfhi $t7

    la   $t8, sprite_table

    bnez $t4, dn_hundreds
    bnez $t6, dn_tens_only

dn_ones_only:
    sll  $t9, $t7, 2
    add  $t9, $t9, $t8
    lw   $a0, 0($t9)
    move $a1, $t1
    move $a2, $t2
    jal  draw_sprite
    b    dn_done

dn_tens_only:
    sll  $t9, $t6, 2
    add  $t9, $t9, $t8
    lw   $a0, 0($t9)
    move $a1, $t1
    move $a2, $t2
    jal  draw_sprite
    addi $t1, $t1, 10

    sll  $t9, $t7, 2
    add  $t9, $t9, $t8
    lw   $a0, 0($t9)
    move $a1, $t1
    move $a2, $t2
    jal  draw_sprite
    b    dn_done

dn_hundreds:
    sll  $t9, $t4, 2
    add  $t9, $t9, $t8
    lw   $a0, 0($t9)
    move $a1, $t1
    move $a2, $t2
    jal  draw_sprite
    addi $t1, $t1, 10

    sll  $t9, $t6, 2
    add  $t9, $t9, $t8
    lw   $a0, 0($t9)
    move $a1, $t1
    move $a2, $t2
    jal  draw_sprite
    addi $t1, $t1, 10

    sll  $t9, $t7, 2
    add  $t9, $t9, $t8
    lw   $a0, 0($t9)
    move $a1, $t1
    move $a2, $t2
    jal  draw_sprite

dn_done:
    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra


#########################################################
# display_byte($a0=0–255, $a1=x, $a2=y)
#########################################################

display_byte:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    move $t0, $a0         # byte value
    move $t1, $a1         # x
    move $t2, $a2         # y
    li   $t3, 10          # spacing
    li   $t4, 7           # MSB index

db_loop:
    srlv $t5, $t0, $t4
    andi $t5, $t5, 1

    beqz $t5, db_zero
    la   $t6, bit1_box
    b    db_have
db_zero:
    la   $t6, bit0_box
db_have:
    move $a0, $t6
    move $a1, $t1
    move $a2, $t2
    jal  draw_sprite

    move $a0, $t1
    move $a1, $t2
    li   $a2, 8
    li   $a3, 0xFFFFFF
    jal  draw_box_outline

    addi $t1, $t1, 10
    addi $t4, $t4, -1
    bge  $t4, $zero, db_loop

    addi $t1, $t1, 8
    move $a0, $t0
    move $a1, $t1
    move $a2, $t2
    jal  display_number

    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra


#########################################################
# display_box_outline($a0=x, $a1=y, $a2=count, $a3=color)
#########################################################

display_box_outline:
    addi $sp, $sp, -24
    sw   $ra, 0($sp)
    sw   $t0, 4($sp)
    sw   $t1, 8($sp)
    sw   $t2, 12($sp)
    sw   $t3, 16($sp)
    sw   $t4, 20($sp)

    move $t0, $a0
    move $t1, $a1
    move $t2, $a2
    move $t3, $a3
    li   $t4, 10
    li   $t5, 8

dbo_loop:
    blez $t2, dbo_done

    move $a0, $t0
    move $a1, $t1
    move $a2, $t5
    move $a3, $t3
    jal  draw_box_outline

    addi $t0, $t0, 10
    addi $t2, $t2, -1
    b    dbo_loop

dbo_done:
    lw   $ra, 0($sp)
    lw   $t0, 4($sp)
    lw   $t1, 8($sp)
    lw   $t2, 12($sp)
    lw   $t3, 16($sp)
    lw   $t4, 20($sp)
    addi $sp, $sp, 24
    jr   $ra


#########################################################
# draw_box_outline($a0=x, $a1=y, $a2=size, $a3=color)
#########################################################

draw_box_outline:
    addi $sp, $sp, -20
    sw   $ra, 0($sp)
    sw   $t0, 4($sp)
    sw   $t1, 8($sp)
    sw   $t2, 12($sp)
    sw   $t3, 16($sp)

    move $t0, $a0
    move $t1, $a1
    move $t2, $a2
    move $t3, $a3

    # top
#########################################################
# draw_horizontal_line($a0=x, $a1=y, $a2=width, $a3=color)
# Draws a horizontal line starting at (x, y)
# Extends right for 'width' pixels.
#########################################################
#########################################################
# draw_horizontal_line($a0=x, $a1=y, $a2=width, $a3=color)
#########################################################

.globl draw_horizontal_line
draw_horizontal_line:
    addi $sp, $sp, -28
    sw   $ra, 0($sp)
    sw   $t0, 4($sp)
    sw   $t1, 8($sp)
    sw   $t2, 12($sp)
    sw   $t3, 16($sp)
    sw   $t4, 20($sp)
    sw   $t5, 24($sp)

    move $t0, $a0      # x
    move $t1, $a1      # y
    move $t2, $a2      # width (pixels)
    move $t3, $a3      # color

    blez $t2, dh_done

    li   $t4, 0x10008000   # bitmap base address
    li   $t5, 512           # screen width in pixels
    mul  $t5, $t1, $t5      # y * width
    add  $t5, $t5, $t0      # y*width + x
    sll  $t5, $t5, 2        # byte offset (4 bytes per pixel)
    add  $t4, $t4, $t5      # pointer to starting pixel

dh_loop:
    blez $t2, dh_done
    sw   $t3, 0($t4)        # store pixel color
    addi $t4, $t4, 4        # advance to next pixel to the right
    addi $t2, $t2, -1
    b    dh_loop

dh_done:
    lw   $ra, 0($sp)
    lw   $t0, 4($sp)
    lw   $t1, 8($sp)
    lw   $t2, 12($sp)
    lw   $t3, 16($sp)
    lw   $t4, 20($sp)
    lw   $t5, 24($sp)
    addi $sp, $sp, 28
    jr   $ra


#########################################################
# draw_vertical_line($a0=x, $a1=y, $a2=height, $a3=color)
#########################################################

.globl draw_vertical_line
draw_vertical_line:
    addi $sp, $sp, -28
    sw   $ra, 0($sp)
    sw   $t0, 4($sp)
    sw   $t1, 8($sp)
    sw   $t2, 12($sp)
    sw   $t3, 16($sp)
    sw   $t4, 20($sp)
    sw   $t5, 24($sp)

    move $t0, $a0      # x
    move $t1, $a1      # y
    move $t2, $a2      # height (pixels)
    move $t3, $a3      # color

    blez $t2, dv_done

    li   $t4, 0x10008000   # bitmap base address
    li   $t5, 512           # screen width in pixels
    mul  $t5, $t1, $t5      # y * width
    add  $t5, $t5, $t0      # y*width + x
    sll  $t5, $t5, 2        # byte offset
    add  $t4, $t4, $t5      # pointer to starting pixel

    li   $t5, 512
    sll  $t5, $t5, 2        # bytes per row (2048)

dv_loop:
    blez $t2, dv_done
    sw   $t3, 0($t4)        # store pixel color
    add  $t4, $t4, $t5      # move to pixel directly below
    addi $t2, $t2, -1
    b    dv_loop

dv_done:
    lw   $ra, 0($sp)
    lw   $t0, 4($sp)
    lw   $t1, 8($sp)
    lw   $t2, 12($sp)
    lw   $t3, 16($sp)
    lw   $t4, 20($sp)
    lw   $t5, 24($sp)
    addi $sp, $sp, 28
    jr   $ra
