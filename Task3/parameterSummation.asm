segment .data
     two: dq 2.0
section .text
global parameterSummation

parameterSummation:                 
      push    rbp
        mov     rbp, rsp
        sub     rsp, 88
        mov     DWORD  [rbp-196], edi
        mov     QWORD  [rbp-168], rsi
        mov     QWORD  [rbp-160], rdx
        mov     QWORD  [rbp-152], rcx
        mov     QWORD  [rbp-144], r8
        mov     QWORD  [rbp-136], r9
        test    al, al
        je      .setuploop
        movaps    [rbp-128], xmm0
        movaps    [rbp-112], xmm1
        movaps    [rbp-96], xmm2
        movaps    [rbp-80], xmm3
        movaps    [rbp-64], xmm4
        movaps    [rbp-48], xmm5
        movaps    [rbp-32], xmm6
        movaps    [rbp-16], xmm7
.setuploop:
        pxor    xmm0, xmm0
        movsd   QWORD  [rbp-184], xmm0
        xor rbx, rbx
        mov rbx, -128
        mov     DWORD  [rbp-188], 1
        jmp     .endit
.insideloop:
        movsd   xmm1, QWORD  [rbp-184]
        movsd   xmm0, QWORD  [rbp+rbx]
        

        pxor xmm2, xmm2
        cvtsi2sd   xmm2,  DWORD  [rbp-188]
        mulsd    xmm0, xmm2

        addsd   xmm0, xmm1

        movsd   QWORD  [rbp-184], xmm0
        add     DWORD  [rbp-188], 1

        add rbx, 16

        cmp rbx, 0
        je .switchit

        cmp rbx,0
        jg .switched
     
        jmp .endswitchit

        .switchit:
          mov  rbx, 16
          jmp .endswitchit

          .switched:
          sub rbx, 8


        .endswitchit:

       
        
.endit:
        mov     eax, DWORD  [rbp-188]
        cmp     eax, DWORD  [rbp-196]
        jle      .insideloop
        movsd   xmm0, QWORD  [rbp-184]
        leave
        ret