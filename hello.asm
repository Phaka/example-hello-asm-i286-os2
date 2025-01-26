.8086                           ; Target processor
.model small                    ; Memory model
.stack 200h                     ; Stack size

.data
msg     db      'Hello, World!', 0dh, 0ah    ; Message with CR/LF
msglen  equ     $ - msg                      ; Length of message
written dw      0                            ; Bytes written storage

.code
        public  main                         ; OpenWatcom expects 'main'
main    proc    near
        mov     ax, @data                    ; Set up data segment
        mov     ds, ax

        ; DosWrite (API function 0x0040)
        mov     ax, 0040h                    ; DosWrite function
        mov     bx, 1                        ; File handle (stdout)
        push    ds                           ; Segment of bytes written
        lea     si, written                  ; Offset of bytes written
        push    si
        mov     cx, msglen                   ; Length of message
        push    ds                           ; Segment of message
        lea     dx, msg                      ; Offset of message
        push    dx
        int     21h                          ; Call OS/2 API

        ; DosExit (API function 0x004C)
        mov     dx, 004Ch                    ; DosExit function
        xor     ax, ax                       ; Return code 0
        int     21h                          ; Call OS/2 API
main    endp

        end     main
