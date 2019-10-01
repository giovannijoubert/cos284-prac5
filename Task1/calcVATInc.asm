
segment .data
y: dq 100.0

section .text
global calcVATInc

calcVATInc:
          push    rbp
        mov     rbp, rsp
        movsd   xmm2, [y]
        movsd   qword  [rbp - 8], xmm0
        movsd   qword  [rbp - 16], xmm1
        movsd   xmm0, qword  [rbp - 8] 
        movsd   qword  [rbp - 24], xmm0
        movsd   xmm0, qword  [rbp - 8]
        mulsd   xmm0, qword  [rbp - 16]
        movsd   qword  [rbp - 32], xmm0
        movsd   xmm0, qword  [rbp - 32] 
        divsd   xmm0, xmm2
        movsd   qword  [rbp - 40], xmm0
        movsd   xmm0, qword  [rbp - 24] 
        addsd   xmm0, qword  [rbp - 40]
        pop     rbp
        ret