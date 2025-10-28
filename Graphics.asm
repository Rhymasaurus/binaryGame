#########################################################
# Test_Lines.asm
# Verifies draw_horizontal_line and draw_vertical_line
#########################################################

.text
.globl main


#########################################################
# main
#########################################################
main:
    la   $sp, 0x7fffeffc

    #################################################
    # 1. Fill background blue to make lines visible
    #################################################
    li   $a0, 0x0000FF
    jal  Draw_Background        # <-- optional; if you have it linked
  
     li   $a0, 150        # x
    li   $a1, 50         # y
    li   $a2, 200        # height
    li   $a3, 0xFFFF00   # color yellow
    jal  draw_vertical_line
    #################################################
    # 2. Draw a horizontal white line
    #################################################
    li   $a0, 50         # x
    li   $a1, 100        # y
    li   $a2, 200        # width
    li   $a3, 0xFFFFFF   # color white
    jal  draw_horizontal_line
