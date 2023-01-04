# a: $a0
# t: $f12
# n: $a1
# oldg: $f2
# g: $f4
# s: $f0
# k: $t0

    .data
x0: .float 0.0
x1: .float 1.0
x2: .float -1.0

    .text
    .globl func3
func3:
   
   la $t1, x2
   l.s $f2, 0($t1) # float oldg = -1.0
   
   la $t2, x1
   l.s $f4, 0($t2) # float g = 1.0
   
   la $t3, x0
   l.s $f0, 0($t3) # float s = 0.0
   
   li $t0, 0 # k = 0
for:
   bge $t0, $a1, endfor
   
   sub.s $f6, $f4, $f2 # g - oldg
while:
   c.le.s $f6, $f12
   bc1t endw # while( (g-oldg) > t)
   mov.s $f2, $f4 # oldg = g
   
   sll $t4, $t0, 2 # k*4
   addu $t5, $a0, $t4 # a + k
   l.s $f8, 0($t5) # a[k]
   
   add.s $f8, $f4, $f8 # g + a[k]
   div.s $f4, $f8, $f12 # g = (g + a[k]) / t
   j while
endw:
   add.d $f0, $f0, $f4 # s = s + g == s += g
   s.s $f4, 0($t5) # a[k] = g
   
   addi $t0, $t0, 1 # k++
   j for
endfor:
   mtc1 $a1, $f10
   cvt.s.w $f10, $f10 # (float)n
   div.s $f0, $f0, $f10 # s / (float)n
   jr $ra
    
    
   
