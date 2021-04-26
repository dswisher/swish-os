
org 0x7C00

; Reset disk system
mov ah, 0
int 0x13            ; 0x13 ah=0 dl = drive number

; Read from harddrive and write to RAM
mov bx, 0x8000      ; bx = address to write the kernel to
mov al, 1 		    ; al = amount of sectors to read
mov ch, 0           ; cylinder/track = 0
mov dh, 0           ; head           = 0
mov cl, 2           ; sector         = 2
mov ah, 2           ; ah = 2: read from drive
int 0x13   		    ; => ah = status, al = amount read

; Pass execution to kernel
jmp 0x8000

; $ = address of current position, $$ = address for start of segment, so ($-$$) = amount of already filled bytes of this segment
; pads everything from here up to 510 with 0's, also gives compiler errors if not possible which
; might happen if we already wrote more than 510 bytes in this segment and thus causes ($-$$) to be negative
; this is very useful as it makes sure that the resulting binary has a size multiple of 512 which is required to make everything work
times 510-($-$$) db 0
dw 0xaa55 

