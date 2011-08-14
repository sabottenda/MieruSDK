########################################################################
#  MIPS Instruction Test Benchmark for MieruPC   Arch Lab. TOKYO TECH  #
#   Dual licensed under New BSD or GPL v2.                             #
#   See COPYING file on the base directory for more information.       #
########################################################################

        .data
        .globl  BENCH_NAME
BENCH_NAME:
        .asciiz "143.bc1tl lt single"
        .align  2
        .text
        .set    noat
        .globl  BENCH_BODY
        .ent    BENCH_BODY
        .set    noreorder
BENCH_BODY:        
        la      $2, BENCH_DATA
        l.s     $f0, 0($2)
        l.s     $f2, 4($2)
        l.s     $f4, 8($2)
        move    $2, $0

        c.lt.s  $f0, $f0
        bc1tl   next1
        addi    $2, $2, 1
        li      $3, 1
next1:  
        c.lt.s  $f0, $f2
        bc1tl   next2
        addi    $2, $2, 1
        li      $4, 1
next2:
        c.lt.s  $f0, $f4
        bc1tl   next3
        addi    $2, $2, 1
        li      $5, 1
next3:
        c.lt.s  $f2, $f0
        bc1tl   next4
        addi    $2, $2, 1
        li      $6, 1
next4:
        c.lt.s  $f2, $f2
        bc1tl   next5
        addi    $2, $2, 1
        li      $7, 1
next5:
        c.lt.s  $f2, $f4
        bc1tl   next6
        addi    $2, $2, 1
        li      $8, 1
next6:
        c.lt.s  $f4, $f0
        bc1tl   next7
        addi    $2, $2, 1
        li      $9, 1
next7:
        c.lt.s  $f4, $f2
        bc1tl   next8
        addi    $2, $2, 1
        li      $10, 1
next8:
        c.lt.s  $f4, $f4
        bc1tl   next9
        addi    $2, $2, 1
        li      $11, 1
next9:
        j       BENCH_END
        nop
        .end    BENCH_BODY
        .data
BENCH_DATA:
        .float 1,1e+30,-9.876e-30

        # $f0     1
        # $f2     1.234e+30
        # $f4     -9.876e-30

        # $2  00000003
        # $3  1
        # $4  0
        
        # $5  1
        # $6  1
        # $7  1
        # $8  1
        # $9  0
        
        # $10 0
        # $11 1    
