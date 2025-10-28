#########################################################
# Graphics_Background.asm
# Fills entire 512x512 MARS Bitmap Display with a color
# Base address: 0x10008000
#########################################################

.data 0x10020000                 # keep data separate from display memory
ScreenWidth:    .word 512
ScreenHeight:   .word 512

.text
.globl Draw_Background

#########################################################
# Draw_Background($a0 = color)
# Fills every pixel on screen with color in $a0
# Works with Bitmap Display base 0x10008000
#
# Notes:
# - Each pixel is 4 bytes (ARGB/RGB).
# - Bitmap Display settings (Tools → Bitmap Display):
#     Base Address: 0x10008000
#     Display Width/Height: 512 x 512
#     Unit Width/Height: 4 x 4 (or 1 x 1 if you prefer)
#     Connect to MIPS
#########################################################

Draw_Background:
    # Prologue
    addi $sp, $sp, -28
    sw   $ra, 0($sp)
    sw   $t0, 4($sp)
    sw   $t1, 8($sp)
    sw   $t2, 12($sp)
    sw   $t3, 16($sp)
    sw   $t4, 20($sp)
    sw   $t5, 24($sp)

    # Load width/height
    la   $t0, ScreenWidth
    lw   $t0, 0($t0)           # t0 = width  (512)
    la   $t1, ScreenHeight
    lw   $t1, 0($t1)           # t1 = height (512)

    # Base address of bitmap display
    li   $t2, 0x10008000       # t2 = base

    # y loop counter
    li   $t3, 0                # t3 = y = 0

OuterLoop_Y:
    bge  $t3, $t1, Done        # if y >= height → done
    li   $t4, 0                # t4 = x = 0

OuterLoop_X:
    bge  $t4, $t0, NextRow     # if x >= width → next row

    # offset = (y * width + x) * 4
    # Compute y * width
    mul  $t5, $t3, $t0         # t5 = y*width
    add  $t5, $t5, $t4         # t5 = y*width + x
    sll  $t5, $t5, 2           # t5 = (y*width + x) * 4 (byte offset)

    # addr = base + offset
    add  $t5, $t2, $t5

    # Store pixel color (from $a0)
    sw   $a0, 0($t5)

    # x++
    addi $t4, $t4, 1
    b    OuterLoop_X

NextRow:
    # y++
    addi $t3, $t3, 1
    b    OuterLoop_Y

Done:
    # Epilogue
    lw   $ra, 0($sp)
    lw   $t0, 4($sp)
    lw   $t1, 8($sp)
    lw   $t2, 12($sp)
    lw   $t3, 16($sp)
    lw   $t4, 20($sp)
    lw   $t5, 24($sp)
    addi $sp, $sp, 28
    jr   $ra

