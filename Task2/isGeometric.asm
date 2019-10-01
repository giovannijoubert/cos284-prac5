segment .data

section .text
global isGeometric

isGeometric:                 
      push    rbp
        mov     rbp, rsp
        mov     QWORD  [rbp-24], rdi
        mov     DWORD  [rbp-28], esi
        mov     rax, QWORD  [rbp-24]
        add     rax, 8
        movsd   xmm0, QWORD  [rax]
        mov     rax, QWORD  [rbp-24]
        movsd   xmm1, QWORD  [rax]
        divsd   xmm0, xmm1
        movsd   QWORD  [rbp-16], xmm0
        mov     DWORD  [rbp-4], 0
        jmp     .forloop
.comparison:
        mov     eax, DWORD  [rbp-4]
        cdqe
        add     rax, 1
        lea     rdx, [0+rax*8]
        mov     rax, QWORD  [rbp-24]
        add     rax, rdx
        movsd   xmm0, QWORD  [rax]
        mov     eax, DWORD  [rbp-4]
        cdqe
        lea     rdx, [0+rax*8]
        mov     rax, QWORD  [rbp-24]
        add     rax, rdx
        movsd   xmm1, QWORD  [rax]
        divsd   xmm0, xmm1
        ucomisd xmm0, QWORD  [rbp-16]
        jp      .returnzero
        ucomisd xmm0, QWORD  [rbp-16]
        je      .increasecounter
.returnzero:
        mov     eax, 0
        jmp     .endit
.increasecounter:
        add     DWORD  [rbp-4], 1
.forloop:
        mov     eax, DWORD  [rbp-28]
        sub     eax, 1
        cmp     DWORD  [rbp-4], eax
        jl      .comparison
        mov     eax, 1
.endit:
        pop     rbp
        ret