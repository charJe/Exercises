    .text   
main:       
    la      $a0, aa             
    li      $v0, 4              
    syscall                     

    .data
aa: .asciiz "hello it worked\n"
