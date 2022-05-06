
.//Obj/W806.elf:     file format elf32-csky-little


Disassembly of section .text:

08010400 <__Vectors>:
 8010400:	00 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010410:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010420:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010430:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010440:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010450:	d0 05 01 08 d0 05 01 08 18 06 01 08 d0 05 01 08     ................
 8010460:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010470:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010480:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010490:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104a0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 94 1f 01 08     ................
 80104b0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104c0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104d0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104e0:	d0 05 01 08 60 1f 01 08 d0 05 01 08 d0 05 01 08     ....`...........
 80104f0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................

08010500 <Reset_Handler>:
    .align  2
    .globl  Reset_Handler
    .type   Reset_Handler, %function
Reset_Handler:
#ifdef CONFIG_KERNEL_NONE
    lrw     r0, 0xe0000200
 8010500:	1019      	lrw      	r0, 0xe0000200	// 8010564 <__exit+0x4>
#else
    lrw     r0, 0x80000200
    mtcr    r0, psr
#endif
    mtcr    r0, psr
 8010502:	c0006420 	mtcr      	r0, cr<0, 0>

    lrw     r0, g_top_irqstack
 8010506:	1019      	lrw      	r0, 0x20001160	// 8010568 <__exit+0x8>
    mov     sp, r0
 8010508:	6f83      	mov      	r14, r0

/*
 *	move __Vectors to irq_vectors
 */
    lrw     r1, __Vectors
 801050a:	1039      	lrw      	r1, 0x8010400	// 801056c <__exit+0xc>
    lrw     r2, __vdata_start__
 801050c:	1059      	lrw      	r2, 0x20000000	// 8010570 <__exit+0x10>
    lrw     r3, __vdata_end__
 801050e:	107a      	lrw      	r3, 0x20000100	// 8010574 <__exit+0x14>

    subu    r3, r2
 8010510:	60ca      	subu      	r3, r2
    cmpnei  r3, 0
 8010512:	3b40      	cmpnei      	r3, 0
    bf      .L_loopv0_done
 8010514:	0c08      	bf      	0x8010524	// 8010524 <Reset_Handler+0x24>

.L_loopv0:
    ldw     r0, (r1, 0)
 8010516:	9100      	ld.w      	r0, (r1, 0x0)
    stw     r0, (r2, 0)
 8010518:	b200      	st.w      	r0, (r2, 0x0)
    addi    r1, 4
 801051a:	2103      	addi      	r1, 4
    addi    r2, 4
 801051c:	2203      	addi      	r2, 4
    subi    r3, 4
 801051e:	2b03      	subi      	r3, 4
    cmpnei  r3, 0
 8010520:	3b40      	cmpnei      	r3, 0
    bt      .L_loopv0
 8010522:	0bfa      	bt      	0x8010516	// 8010516 <Reset_Handler+0x16>
 *    __data_start__: VMA of start of the section to copy to
 *    __data_end__: VMA of end of the section to copy to
 *
 *  All addresses must be aligned to 4 bytes boundary.
 */
    lrw     r1, __erodata
 8010524:	1035      	lrw      	r1, 0x8013dd4	// 8010578 <__exit+0x18>
    lrw     r2, __data_start__
 8010526:	1056      	lrw      	r2, 0x20000100	// 801057c <__exit+0x1c>
    lrw     r3, __data_end__
 8010528:	1076      	lrw      	r3, 0x20000160	// 8010580 <__exit+0x20>

    subu    r3, r2
 801052a:	60ca      	subu      	r3, r2
    cmpnei  r3, 0
 801052c:	3b40      	cmpnei      	r3, 0
    bf      .L_loop0_done
 801052e:	0c08      	bf      	0x801053e	// 801053e <Reset_Handler+0x3e>

.L_loop0:
    ldw     r0, (r1, 0)
 8010530:	9100      	ld.w      	r0, (r1, 0x0)
    stw     r0, (r2, 0)
 8010532:	b200      	st.w      	r0, (r2, 0x0)
    addi    r1, 4
 8010534:	2103      	addi      	r1, 4
    addi    r2, 4
 8010536:	2203      	addi      	r2, 4
    subi    r3, 4
 8010538:	2b03      	subi      	r3, 4
    cmpnei  r3, 0
 801053a:	3b40      	cmpnei      	r3, 0
    bt      .L_loop0
 801053c:	0bfa      	bt      	0x8010530	// 8010530 <Reset_Handler+0x30>
 *    __bss_end__: end of the BSS section.
 *
 *  Both addresses must be aligned to 4 bytes boundary.
 */
 #if 1
    lrw     r1, __bss_start__
 801053e:	1032      	lrw      	r1, 0x20000160	// 8010584 <__exit+0x24>
    lrw     r2, __bss_end__
 8010540:	1052      	lrw      	r2, 0x20001910	// 8010588 <__exit+0x28>

    movi    r0, 0
 8010542:	3000      	movi      	r0, 0

    subu    r2, r1
 8010544:	6086      	subu      	r2, r1
    cmpnei  r2, 0
 8010546:	3a40      	cmpnei      	r2, 0
    bf      .L_loop1_done
 8010548:	0c06      	bf      	0x8010554	// 8010554 <Reset_Handler+0x54>

.L_loop1:
    stw     r0, (r1, 0)
 801054a:	b100      	st.w      	r0, (r1, 0x0)
    addi    r1, 4
 801054c:	2103      	addi      	r1, 4
    subi    r2, 4
 801054e:	2a03      	subi      	r2, 4
    cmpnei  r2, 0
 8010550:	3a40      	cmpnei      	r2, 0
    bt      .L_loop1
 8010552:	0bfc      	bt      	0x801054a	// 801054a <Reset_Handler+0x4a>
.L_loop1_done:
#endif

#ifndef __NO_SYSTEM_INIT
    jbsr    SystemInit
 8010554:	e0000d3a 	bsr      	0x8011fc8	// 8011fc8 <SystemInit>
#endif

#ifndef __NO_BOARD_INIT
    jbsr    board_init
 8010558:	e0000d8e 	bsr      	0x8012074	// 8012074 <board_init>
#endif

    jbsr    main
 801055c:	e0000c16 	bsr      	0x8011d88	// 8011d88 <main>

08010560 <__exit>:
    .size   Reset_Handler, . - Reset_Handler

__exit:
    br      __exit
 8010560:	0400      	br      	0x8010560	// 8010560 <__exit>
 8010562:	0000      	.short	0x0000
 8010564:	e0000200 	.long	0xe0000200
 8010568:	20001160 	.long	0x20001160
 801056c:	08010400 	.long	0x08010400
 8010570:	20000000 	.long	0x20000000
 8010574:	20000100 	.long	0x20000100
 8010578:	08013dd4 	.long	0x08013dd4
 801057c:	20000100 	.long	0x20000100
 8010580:	20000160 	.long	0x20000160
 8010584:	20000160 	.long	0x20000160
 8010588:	20001910 	.long	0x20001910

0801058c <trap>:
 * default exception handler
 ******************************************************************************/
    .global trap
    .type   trap, %function
trap:
    psrset  ee
 801058c:	c1007420 	psrset      	ee

    subi    sp, 4
 8010590:	1421      	subi      	r14, r14, 4
    stw     r13, (sp)
 8010592:	ddae2000 	st.w      	r13, (r14, 0x0)
    addi    sp, 4
 8010596:	1401      	addi      	r14, r14, 4

    lrw     r13, g_trap_sp
 8010598:	ea8d000f 	lrw      	r13, 0x20001360	// 80105d4 <BLE_IRQHandler+0x4>
    stw     sp, (r13)
 801059c:	ddcd2000 	st.w      	r14, (r13, 0x0)

    lrw     sp, g_top_trapstack
 80105a0:	ea8e000e 	lrw      	r14, 0x20001360	// 80105d8 <BLE_IRQHandler+0x8>

    subi    sp, 72
 80105a4:	1432      	subi      	r14, r14, 72
    stm     r0-r12, (sp)
 80105a6:	d40e1c2c 	stm      	r0-r12, (r14)

    lrw     r0, g_trap_sp
 80105aa:	100b      	lrw      	r0, 0x20001360	// 80105d4 <BLE_IRQHandler+0x4>
    ldw     r0, (r0)
 80105ac:	9000      	ld.w      	r0, (r0, 0x0)

    stw     r0, (sp, 56) /* save r14 */
 80105ae:	b80e      	st.w      	r0, (r14, 0x38)

    subi    r0, 4
 80105b0:	2803      	subi      	r0, 4
    ldw     r13, (r0)
 80105b2:	d9a02000 	ld.w      	r13, (r0, 0x0)
    stw     r13, (sp, 52)
 80105b6:	ddae200d 	st.w      	r13, (r14, 0x34)

    stw     r15, (sp, 60)
 80105ba:	ddee200f 	st.w      	r15, (r14, 0x3c)
    mfcr    r0, epsr
 80105be:	c0026020 	mfcr      	r0, cr<2, 0>
    stw     r0, (sp, 64)
 80105c2:	b810      	st.w      	r0, (r14, 0x40)
    mfcr    r0, epc
 80105c4:	c0046020 	mfcr      	r0, cr<4, 0>
    stw     r0, (sp, 68)
 80105c8:	b811      	st.w      	r0, (r14, 0x44)

    mov     r0, sp
 80105ca:	6c3b      	mov      	r0, r14

    jbsr    trap_c
 80105cc:	e0000d16 	bsr      	0x8011ff8	// 8011ff8 <trap_c>

080105d0 <BLE_IRQHandler>:

    .align  2
    .weak   Default_Handler
    .type   Default_Handler, %function
Default_Handler:
    br      trap
 80105d0:	07de      	br      	0x801058c	// 801058c <trap>
 80105d2:	0000      	.short	0x0000
 80105d4:	20001360 	.long	0x20001360
 80105d8:	20001360 	.long	0x20001360

080105dc <cpu_yeild>:
 *
 ********************************************************************/
.global cpu_yeild
.type   cpu_yeild, %function
cpu_yeild:
    lrw    r0, VIC_TSPDR
 80105dc:	1106      	lrw      	r0, 0xe000ec08	// 8010674 <tspend_handler+0x5c>
    bgeni  r1, 0
 80105de:	ea010001 	movi      	r1, 1
    stw    r1, (r0)
 80105e2:	b020      	st.w      	r1, (r0, 0x0)
    rts
 80105e4:	783c      	jmp      	r15

080105e6 <vPortStartTask>:
 *
 ********************************************************************/
.global vPortStartTask
.type   vPortStartTask, %function
vPortStartTask:
    psrclr   ie
 80105e6:	c0807020 	psrclr      	ie
    lrw      r4, pxCurrentTCB
 80105ea:	1184      	lrw      	r4, 0x20001364	// 8010678 <tspend_handler+0x60>
    ld.w     r4, (r4)
 80105ec:	9480      	ld.w      	r4, (r4, 0x0)
    ld.w     sp, (r4)
 80105ee:	d9c42000 	ld.w      	r14, (r4, 0x0)

    ldw      r0, (sp, 192)
 80105f2:	9910      	ld.w      	r0, (r14, 0xc0)
    mtcr     r0, epc
 80105f4:	c0006424 	mtcr      	r0, cr<4, 0>
    ldw      r0, (sp, 188)
 80105f8:	990f      	ld.w      	r0, (r14, 0xbc)
    mtcr     r0, epsr
 80105fa:	c0006422 	mtcr      	r0, cr<2, 0>

    ldm      r0-r13, (sp)
 80105fe:	d00e1c2d 	ldm      	r0-r13, (r14)
    ldw      r15, (sp, 56)
 8010602:	d9ee200e 	ld.w      	r15, (r14, 0x38)
    addi     sp, 60
 8010606:	140f      	addi      	r14, r14, 60
    ldm      r16-r31, (sp)
 8010608:	d20e1c2f 	ldm      	r16-r31, (r14)
    addi     sp, 64
 801060c:	1410      	addi      	r14, r14, 64
    fldms    vr0-vr15, (sp)
 801060e:	f5ee3000 	fldms      	fr0-fr15, (r14)
    addi     sp, 72
 8010612:	1412      	addi      	r14, r14, 72

    rte
 8010614:	c0004020 	rte

08010618 <tspend_handler>:
 *
 ********************************************************************/
.global tspend_handler
.type   tspend_handler, %function
tspend_handler:
    subi     sp, 196
 8010618:	1531      	subi      	r14, r14, 196
    stm      r0-r13, (sp)
 801061a:	d40e1c2d 	stm      	r0-r13, (r14)
    stw      r15, (sp, 56)
 801061e:	ddee200e 	st.w      	r15, (r14, 0x38)
    addi     r0, sp, 60
 8010622:	180f      	addi      	r0, r14, 60
    stm      r16-r31, (r0)
 8010624:	d6001c2f 	stm      	r16-r31, (r0)
    addi     r0, 64
 8010628:	203f      	addi      	r0, 64
    fstms    vr0-vr15, (r0)
 801062a:	f5e03400 	fstms      	fr0-fr15, (r0)
    mfcr     r1, epsr
 801062e:	c0026021 	mfcr      	r1, cr<2, 0>
    stw      r1, (r0, 64)
 8010632:	b030      	st.w      	r1, (r0, 0x40)
    mfcr     r1, epc
 8010634:	c0046021 	mfcr      	r1, cr<4, 0>
    stw      r1, (r0, 68)
 8010638:	b031      	st.w      	r1, (r0, 0x44)

    lrw      r2, pxCurrentTCB
 801063a:	1050      	lrw      	r2, 0x20001364	// 8010678 <tspend_handler+0x60>
    ld.w     r3, (r2)
 801063c:	9260      	ld.w      	r3, (r2, 0x0)
    st.w     sp, (r3)
 801063e:	ddc32000 	st.w      	r14, (r3, 0x0)

    jbsr     vTaskSwitchContext
 8010642:	e0001949 	bsr      	0x80138d4	// 80138d4 <vTaskSwitchContext>

    lrw      r4, pxCurrentTCB
 8010646:	108d      	lrw      	r4, 0x20001364	// 8010678 <tspend_handler+0x60>
    ld.w     r4, (r4)
 8010648:	9480      	ld.w      	r4, (r4, 0x0)
    ld.w     sp, (r4)
 801064a:	d9c42000 	ld.w      	r14, (r4, 0x0)

    ldw      r0, (sp, 192)
 801064e:	9910      	ld.w      	r0, (r14, 0xc0)
    mtcr     r0, epc
 8010650:	c0006424 	mtcr      	r0, cr<4, 0>
    ldw      r0, (sp, 188)
 8010654:	990f      	ld.w      	r0, (r14, 0xbc)
    mtcr     r0, epsr
 8010656:	c0006422 	mtcr      	r0, cr<2, 0>

    ldm      r0-r13, (sp)
 801065a:	d00e1c2d 	ldm      	r0-r13, (r14)
    ldw      r15, (sp, 56)
 801065e:	d9ee200e 	ld.w      	r15, (r14, 0x38)
    addi     sp, 60
 8010662:	140f      	addi      	r14, r14, 60
    ldm      r16-r31, (sp)
 8010664:	d20e1c2f 	ldm      	r16-r31, (r14)
    addi     sp, 64
 8010668:	1410      	addi      	r14, r14, 64
    fldms    vr0-vr15, (sp)
 801066a:	f5ee3000 	fldms      	fr0-fr15, (r14)
    addi     sp, 72
 801066e:	1412      	addi      	r14, r14, 72

    rte
 8010670:	c0004020 	rte
 8010674:	e000ec08 	.long	0xe000ec08
 8010678:	20001364 	.long	0x20001364

0801067c <__fixunsdfsi>:
 801067c:	14d2      	push      	r4-r5, r15
 801067e:	3200      	movi      	r2, 0
 8010680:	ea2341e0 	movih      	r3, 16864
 8010684:	6d03      	mov      	r4, r0
 8010686:	6d47      	mov      	r5, r1
 8010688:	e00006a2 	bsr      	0x80113cc	// 80113cc <__gedf2>
 801068c:	e9a00007 	bhsz      	r0, 0x801069a	// 801069a <__fixunsdfsi+0x1e>
 8010690:	6c13      	mov      	r0, r4
 8010692:	6c57      	mov      	r1, r5
 8010694:	e000070c 	bsr      	0x80114ac	// 80114ac <__fixdfsi>
 8010698:	1492      	pop      	r4-r5, r15
 801069a:	3200      	movi      	r2, 0
 801069c:	ea2341e0 	movih      	r3, 16864
 80106a0:	6c13      	mov      	r0, r4
 80106a2:	6c57      	mov      	r1, r5
 80106a4:	e00004ae 	bsr      	0x8011000	// 8011000 <__subdf3>
 80106a8:	e0000702 	bsr      	0x80114ac	// 80114ac <__fixdfsi>
 80106ac:	ea238000 	movih      	r3, 32768
 80106b0:	600c      	addu      	r0, r3
 80106b2:	1492      	pop      	r4-r5, r15

080106b4 <__udivdi3>:
 80106b4:	14c5      	push      	r4-r8
 80106b6:	6f4b      	mov      	r13, r2
 80106b8:	6d4f      	mov      	r5, r3
 80106ba:	6d03      	mov      	r4, r0
 80106bc:	6f07      	mov      	r12, r1
 80106be:	e9230054 	bnez      	r3, 0x8010766	// 8010766 <__udivdi3+0xb2>
 80106c2:	6484      	cmphs      	r1, r2
 80106c4:	0870      	bt      	0x80107a4	// 80107a4 <__udivdi3+0xf0>
 80106c6:	eb02ffff 	cmphsi      	r2, 65536
 80106ca:	0cc4      	bf      	0x8010852	// 8010852 <__udivdi3+0x19e>
 80106cc:	c6e05023 	bmaski      	r3, 24
 80106d0:	648c      	cmphs      	r3, r2
 80106d2:	3518      	movi      	r5, 24
 80106d4:	3310      	movi      	r3, 16
 80106d6:	c4a30c40 	inct      	r5, r3, 0
 80106da:	01dc      	lrw      	r6, 0x8013984	// 80109e4 <__udivdi3+0x330>
 80106dc:	c4a24043 	lsr      	r3, r2, r5
 80106e0:	d0660023 	ldr.b      	r3, (r6, r3 << 0)
 80106e4:	614c      	addu      	r5, r3
 80106e6:	3320      	movi      	r3, 32
 80106e8:	60d6      	subu      	r3, r5
 80106ea:	e903000c 	bez      	r3, 0x8010702	// 8010702 <__udivdi3+0x4e>
 80106ee:	c462402d 	lsl      	r13, r2, r3
 80106f2:	c4a04045 	lsr      	r5, r0, r5
 80106f6:	c4614022 	lsl      	r2, r1, r3
 80106fa:	c445242c 	or      	r12, r5, r2
 80106fe:	c4604024 	lsl      	r4, r0, r3
 8010702:	c60d4841 	lsri      	r1, r13, 16
 8010706:	c42c8022 	divu      	r2, r12, r1
 801070a:	c4228423 	mult      	r3, r2, r1
 801070e:	630e      	subu      	r12, r3
 8010710:	c60c4823 	lsli      	r3, r12, 16
 8010714:	c40d55e5 	zext      	r5, r13, 15, 0
 8010718:	c604484c 	lsri      	r12, r4, 16
 801071c:	c4458420 	mult      	r0, r5, r2
 8010720:	6f0c      	or      	r12, r3
 8010722:	6430      	cmphs      	r12, r0
 8010724:	0808      	bt      	0x8010734	// 8010734 <__udivdi3+0x80>
 8010726:	6334      	addu      	r12, r13
 8010728:	6770      	cmphs      	r12, r13
 801072a:	5a63      	subi      	r3, r2, 1
 801072c:	0c03      	bf      	0x8010732	// 8010732 <__udivdi3+0x7e>
 801072e:	6430      	cmphs      	r12, r0
 8010730:	0d56      	bf      	0x80109dc	// 80109dc <__udivdi3+0x328>
 8010732:	6c8f      	mov      	r2, r3
 8010734:	6302      	subu      	r12, r0
 8010736:	c42c8020 	divu      	r0, r12, r1
 801073a:	7c40      	mult      	r1, r0
 801073c:	6306      	subu      	r12, r1
 801073e:	c60c482c 	lsli      	r12, r12, 16
 8010742:	c40455e4 	zext      	r4, r4, 15, 0
 8010746:	7d40      	mult      	r5, r0
 8010748:	6d30      	or      	r4, r12
 801074a:	6550      	cmphs      	r4, r5
 801074c:	6c43      	mov      	r1, r0
 801074e:	0808      	bt      	0x801075e	// 801075e <__udivdi3+0xaa>
 8010750:	6134      	addu      	r4, r13
 8010752:	6750      	cmphs      	r4, r13
 8010754:	5863      	subi      	r3, r0, 1
 8010756:	0d21      	bf      	0x8010998	// 8010998 <__udivdi3+0x2e4>
 8010758:	6550      	cmphs      	r4, r5
 801075a:	091f      	bt      	0x8010998	// 8010998 <__udivdi3+0x2e4>
 801075c:	2901      	subi      	r1, 2
 801075e:	4210      	lsli      	r0, r2, 16
 8010760:	6c04      	or      	r0, r1
 8010762:	3100      	movi      	r1, 0
 8010764:	1485      	pop      	r4-r8
 8010766:	64c4      	cmphs      	r1, r3
 8010768:	0c6b      	bf      	0x801083e	// 801083e <__udivdi3+0x18a>
 801076a:	eb03ffff 	cmphsi      	r3, 65536
 801076e:	0c6b      	bf      	0x8010844	// 8010844 <__udivdi3+0x190>
 8010770:	c6e0502c 	bmaski      	r12, 24
 8010774:	64f0      	cmphs      	r12, r3
 8010776:	ea0d0018 	movi      	r13, 24
 801077a:	ea0c0010 	movi      	r12, 16
 801077e:	c58d0c20 	incf      	r12, r13, 0
 8010782:	0386      	lrw      	r4, 0x8013984	// 80109e4 <__udivdi3+0x330>
 8010784:	c583404d 	lsr      	r13, r3, r12
 8010788:	d1a4002d 	ldr.b      	r13, (r4, r13 << 0)
 801078c:	6370      	addu      	r13, r12
 801078e:	3520      	movi      	r5, 32
 8010790:	6176      	subu      	r5, r13
 8010792:	e925006c 	bnez      	r5, 0x801086a	// 801086a <__udivdi3+0x1b6>
 8010796:	644c      	cmphs      	r3, r1
 8010798:	0d0d      	bf      	0x80109b2	// 80109b2 <__udivdi3+0x2fe>
 801079a:	6480      	cmphs      	r0, r2
 801079c:	c4000500 	mvc      	r0
 80107a0:	6c57      	mov      	r1, r5
 80107a2:	1485      	pop      	r4-r8
 80107a4:	e9220006 	bnez      	r2, 0x80107b0	// 80107b0 <__udivdi3+0xfc>
 80107a8:	ea0d0001 	movi      	r13, 1
 80107ac:	c44d802d 	divu      	r13, r13, r2
 80107b0:	eb0dffff 	cmphsi      	r13, 65536
 80107b4:	0c55      	bf      	0x801085e	// 801085e <__udivdi3+0x1aa>
 80107b6:	c6e05023 	bmaski      	r3, 24
 80107ba:	674c      	cmphs      	r3, r13
 80107bc:	3518      	movi      	r5, 24
 80107be:	3310      	movi      	r3, 16
 80107c0:	c4a30c40 	inct      	r5, r3, 0
 80107c4:	0357      	lrw      	r2, 0x8013984	// 80109e4 <__udivdi3+0x330>
 80107c6:	c4ad4043 	lsr      	r3, r13, r5
 80107ca:	d0620023 	ldr.b      	r3, (r2, r3 << 0)
 80107ce:	614c      	addu      	r5, r3
 80107d0:	3620      	movi      	r6, 32
 80107d2:	6196      	subu      	r6, r5
 80107d4:	e926009f 	bnez      	r6, 0x8010912	// 8010912 <__udivdi3+0x25e>
 80107d8:	c5a10082 	subu      	r2, r1, r13
 80107dc:	c60d4846 	lsri      	r6, r13, 16
 80107e0:	c40d55e5 	zext      	r5, r13, 15, 0
 80107e4:	3101      	movi      	r1, 1
 80107e6:	c4c2802c 	divu      	r12, r2, r6
 80107ea:	c4cc8423 	mult      	r3, r12, r6
 80107ee:	608e      	subu      	r2, r3
 80107f0:	4250      	lsli      	r2, r2, 16
 80107f2:	4c70      	lsri      	r3, r4, 16
 80107f4:	c4ac8420 	mult      	r0, r12, r5
 80107f8:	6cc8      	or      	r3, r2
 80107fa:	640c      	cmphs      	r3, r0
 80107fc:	0809      	bt      	0x801080e	// 801080e <__udivdi3+0x15a>
 80107fe:	60f4      	addu      	r3, r13
 8010800:	674c      	cmphs      	r3, r13
 8010802:	e44c1000 	subi      	r2, r12, 1
 8010806:	0c03      	bf      	0x801080c	// 801080c <__udivdi3+0x158>
 8010808:	640c      	cmphs      	r3, r0
 801080a:	0ce5      	bf      	0x80109d4	// 80109d4 <__udivdi3+0x320>
 801080c:	6f0b      	mov      	r12, r2
 801080e:	60c2      	subu      	r3, r0
 8010810:	c4c38020 	divu      	r0, r3, r6
 8010814:	7d80      	mult      	r6, r0
 8010816:	60da      	subu      	r3, r6
 8010818:	4370      	lsli      	r3, r3, 16
 801081a:	c40455e4 	zext      	r4, r4, 15, 0
 801081e:	7d40      	mult      	r5, r0
 8010820:	6cd0      	or      	r3, r4
 8010822:	654c      	cmphs      	r3, r5
 8010824:	6c83      	mov      	r2, r0
 8010826:	0808      	bt      	0x8010836	// 8010836 <__udivdi3+0x182>
 8010828:	60f4      	addu      	r3, r13
 801082a:	674c      	cmphs      	r3, r13
 801082c:	2800      	subi      	r0, 1
 801082e:	0cb3      	bf      	0x8010994	// 8010994 <__udivdi3+0x2e0>
 8010830:	654c      	cmphs      	r3, r5
 8010832:	08b1      	bt      	0x8010994	// 8010994 <__udivdi3+0x2e0>
 8010834:	2a01      	subi      	r2, 2
 8010836:	c60c4820 	lsli      	r0, r12, 16
 801083a:	6c08      	or      	r0, r2
 801083c:	1485      	pop      	r4-r8
 801083e:	3100      	movi      	r1, 0
 8010840:	6c07      	mov      	r0, r1
 8010842:	1485      	pop      	r4-r8
 8010844:	eb0300ff 	cmphsi      	r3, 256
 8010848:	c400050d 	mvc      	r13
 801084c:	c46d482c 	lsli      	r12, r13, 3
 8010850:	0799      	br      	0x8010782	// 8010782 <__udivdi3+0xce>
 8010852:	eb0200ff 	cmphsi      	r2, 256
 8010856:	3308      	movi      	r3, 8
 8010858:	c4a30c40 	inct      	r5, r3, 0
 801085c:	073f      	br      	0x80106da	// 80106da <__udivdi3+0x26>
 801085e:	eb0d00ff 	cmphsi      	r13, 256
 8010862:	3308      	movi      	r3, 8
 8010864:	c4a30c40 	inct      	r5, r3, 0
 8010868:	07ae      	br      	0x80107c4	// 80107c4 <__udivdi3+0x110>
 801086a:	c5a24046 	lsr      	r6, r2, r13
 801086e:	70d4      	lsl      	r3, r5
 8010870:	6d8c      	or      	r6, r3
 8010872:	c5a14044 	lsr      	r4, r1, r13
 8010876:	4ef0      	lsri      	r7, r6, 16
 8010878:	c4e48023 	divu      	r3, r4, r7
 801087c:	c4a1402c 	lsl      	r12, r1, r5
 8010880:	c5a04041 	lsr      	r1, r0, r13
 8010884:	c4e3842d 	mult      	r13, r3, r7
 8010888:	6c70      	or      	r1, r12
 801088a:	6136      	subu      	r4, r13
 801088c:	c40655ec 	zext      	r12, r6, 15, 0
 8010890:	4490      	lsli      	r4, r4, 16
 8010892:	c601484d 	lsri      	r13, r1, 16
 8010896:	c46c8428 	mult      	r8, r12, r3
 801089a:	6f50      	or      	r13, r4
 801089c:	6634      	cmphs      	r13, r8
 801089e:	7094      	lsl      	r2, r5
 80108a0:	0806      	bt      	0x80108ac	// 80108ac <__udivdi3+0x1f8>
 80108a2:	6358      	addu      	r13, r6
 80108a4:	65b4      	cmphs      	r13, r6
 80108a6:	5b83      	subi      	r4, r3, 1
 80108a8:	088d      	bt      	0x80109c2	// 80109c2 <__udivdi3+0x30e>
 80108aa:	6cd3      	mov      	r3, r4
 80108ac:	6362      	subu      	r13, r8
 80108ae:	c4ed8024 	divu      	r4, r13, r7
 80108b2:	7dd0      	mult      	r7, r4
 80108b4:	635e      	subu      	r13, r7
 80108b6:	c60d482d 	lsli      	r13, r13, 16
 80108ba:	c48c8427 	mult      	r7, r12, r4
 80108be:	c40155ec 	zext      	r12, r1, 15, 0
 80108c2:	6f34      	or      	r12, r13
 80108c4:	65f0      	cmphs      	r12, r7
 80108c6:	0806      	bt      	0x80108d2	// 80108d2 <__udivdi3+0x21e>
 80108c8:	6318      	addu      	r12, r6
 80108ca:	65b0      	cmphs      	r12, r6
 80108cc:	5c23      	subi      	r1, r4, 1
 80108ce:	0875      	bt      	0x80109b8	// 80109b8 <__udivdi3+0x304>
 80108d0:	6d07      	mov      	r4, r1
 80108d2:	4370      	lsli      	r3, r3, 16
 80108d4:	6cd0      	or      	r3, r4
 80108d6:	c40355e1 	zext      	r1, r3, 15, 0
 80108da:	c40255e4 	zext      	r4, r2, 15, 0
 80108de:	c603484d 	lsri      	r13, r3, 16
 80108e2:	4a50      	lsri      	r2, r2, 16
 80108e4:	c4818426 	mult      	r6, r1, r4
 80108e8:	7d34      	mult      	r4, r13
 80108ea:	7c48      	mult      	r1, r2
 80108ec:	7f48      	mult      	r13, r2
 80108ee:	6050      	addu      	r1, r4
 80108f0:	4e50      	lsri      	r2, r6, 16
 80108f2:	6084      	addu      	r2, r1
 80108f4:	6508      	cmphs      	r2, r4
 80108f6:	631e      	subu      	r12, r7
 80108f8:	0804      	bt      	0x8010900	// 8010900 <__udivdi3+0x24c>
 80108fa:	ea210001 	movih      	r1, 1
 80108fe:	6344      	addu      	r13, r1
 8010900:	4a30      	lsri      	r1, r2, 16
 8010902:	6344      	addu      	r13, r1
 8010904:	6770      	cmphs      	r12, r13
 8010906:	0c53      	bf      	0x80109ac	// 80109ac <__udivdi3+0x2f8>
 8010908:	6772      	cmpne      	r12, r13
 801090a:	0c49      	bf      	0x801099c	// 801099c <__udivdi3+0x2e8>
 801090c:	6c0f      	mov      	r0, r3
 801090e:	3100      	movi      	r1, 0
 8010910:	1485      	pop      	r4-r8
 8010912:	7358      	lsl      	r13, r6
 8010914:	c4a1404c 	lsr      	r12, r1, r5
 8010918:	c4c14022 	lsl      	r2, r1, r6
 801091c:	c4c04024 	lsl      	r4, r0, r6
 8010920:	c60d4846 	lsri      	r6, r13, 16
 8010924:	c4a04045 	lsr      	r5, r0, r5
 8010928:	c4cc8020 	divu      	r0, r12, r6
 801092c:	c4c08421 	mult      	r1, r0, r6
 8010930:	c4452423 	or      	r3, r5, r2
 8010934:	6306      	subu      	r12, r1
 8010936:	c40d55e5 	zext      	r5, r13, 15, 0
 801093a:	c60c482c 	lsli      	r12, r12, 16
 801093e:	4b30      	lsri      	r1, r3, 16
 8010940:	c4058422 	mult      	r2, r5, r0
 8010944:	6c70      	or      	r1, r12
 8010946:	6484      	cmphs      	r1, r2
 8010948:	080a      	bt      	0x801095c	// 801095c <__udivdi3+0x2a8>
 801094a:	6074      	addu      	r1, r13
 801094c:	6744      	cmphs      	r1, r13
 801094e:	e5801000 	subi      	r12, r0, 1
 8010952:	0c3f      	bf      	0x80109d0	// 80109d0 <__udivdi3+0x31c>
 8010954:	6484      	cmphs      	r1, r2
 8010956:	083d      	bt      	0x80109d0	// 80109d0 <__udivdi3+0x31c>
 8010958:	2801      	subi      	r0, 2
 801095a:	6074      	addu      	r1, r13
 801095c:	604a      	subu      	r1, r2
 801095e:	c4c1802c 	divu      	r12, r1, r6
 8010962:	c4cc8422 	mult      	r2, r12, r6
 8010966:	5949      	subu      	r2, r1, r2
 8010968:	4250      	lsli      	r2, r2, 16
 801096a:	c40355e3 	zext      	r3, r3, 15, 0
 801096e:	c5858421 	mult      	r1, r5, r12
 8010972:	6c8c      	or      	r2, r3
 8010974:	6448      	cmphs      	r2, r1
 8010976:	080b      	bt      	0x801098c	// 801098c <__udivdi3+0x2d8>
 8010978:	60b4      	addu      	r2, r13
 801097a:	6748      	cmphs      	r2, r13
 801097c:	e46c1000 	subi      	r3, r12, 1
 8010980:	0c26      	bf      	0x80109cc	// 80109cc <__udivdi3+0x318>
 8010982:	6448      	cmphs      	r2, r1
 8010984:	0824      	bt      	0x80109cc	// 80109cc <__udivdi3+0x318>
 8010986:	e58c1001 	subi      	r12, r12, 2
 801098a:	60b4      	addu      	r2, r13
 801098c:	6086      	subu      	r2, r1
 801098e:	4030      	lsli      	r1, r0, 16
 8010990:	6c70      	or      	r1, r12
 8010992:	072a      	br      	0x80107e6	// 80107e6 <__udivdi3+0x132>
 8010994:	6c83      	mov      	r2, r0
 8010996:	0750      	br      	0x8010836	// 8010836 <__udivdi3+0x182>
 8010998:	6c4f      	mov      	r1, r3
 801099a:	06e2      	br      	0x801075e	// 801075e <__udivdi3+0xaa>
 801099c:	4250      	lsli      	r2, r2, 16
 801099e:	c40655e6 	zext      	r6, r6, 15, 0
 80109a2:	c4a04021 	lsl      	r1, r0, r5
 80109a6:	6098      	addu      	r2, r6
 80109a8:	6484      	cmphs      	r1, r2
 80109aa:	0bb1      	bt      	0x801090c	// 801090c <__udivdi3+0x258>
 80109ac:	5b03      	subi      	r0, r3, 1
 80109ae:	3100      	movi      	r1, 0
 80109b0:	1485      	pop      	r4-r8
 80109b2:	6c57      	mov      	r1, r5
 80109b4:	3001      	movi      	r0, 1
 80109b6:	1485      	pop      	r4-r8
 80109b8:	65f0      	cmphs      	r12, r7
 80109ba:	0b8b      	bt      	0x80108d0	// 80108d0 <__udivdi3+0x21c>
 80109bc:	2c01      	subi      	r4, 2
 80109be:	6318      	addu      	r12, r6
 80109c0:	0789      	br      	0x80108d2	// 80108d2 <__udivdi3+0x21e>
 80109c2:	6634      	cmphs      	r13, r8
 80109c4:	0b73      	bt      	0x80108aa	// 80108aa <__udivdi3+0x1f6>
 80109c6:	2b01      	subi      	r3, 2
 80109c8:	6358      	addu      	r13, r6
 80109ca:	0771      	br      	0x80108ac	// 80108ac <__udivdi3+0x1f8>
 80109cc:	6f0f      	mov      	r12, r3
 80109ce:	07df      	br      	0x801098c	// 801098c <__udivdi3+0x2d8>
 80109d0:	6c33      	mov      	r0, r12
 80109d2:	07c5      	br      	0x801095c	// 801095c <__udivdi3+0x2a8>
 80109d4:	e58c1001 	subi      	r12, r12, 2
 80109d8:	60f4      	addu      	r3, r13
 80109da:	071a      	br      	0x801080e	// 801080e <__udivdi3+0x15a>
 80109dc:	2a01      	subi      	r2, 2
 80109de:	6334      	addu      	r12, r13
 80109e0:	06aa      	br      	0x8010734	// 8010734 <__udivdi3+0x80>
 80109e2:	0000      	.short	0x0000
 80109e4:	08013984 	.long	0x08013984

080109e8 <__umoddi3>:
 80109e8:	14c6      	push      	r4-r9
 80109ea:	6d4b      	mov      	r5, r2
 80109ec:	6f4f      	mov      	r13, r3
 80109ee:	6d83      	mov      	r6, r0
 80109f0:	6f07      	mov      	r12, r1
 80109f2:	e923004a 	bnez      	r3, 0x8010a86	// 8010a86 <__umoddi3+0x9e>
 80109f6:	6484      	cmphs      	r1, r2
 80109f8:	086b      	bt      	0x8010ace	// 8010ace <__umoddi3+0xe6>
 80109fa:	eb02ffff 	cmphsi      	r2, 65536
 80109fe:	0cc0      	bf      	0x8010b7e	// 8010b7e <__umoddi3+0x196>
 8010a00:	c6e05023 	bmaski      	r3, 24
 8010a04:	648c      	cmphs      	r3, r2
 8010a06:	ea0d0018 	movi      	r13, 24
 8010a0a:	3310      	movi      	r3, 16
 8010a0c:	c5a30c40 	inct      	r13, r3, 0
 8010a10:	0281      	lrw      	r4, 0x8013984	// 8010d08 <__umoddi3+0x320>
 8010a12:	c5a24043 	lsr      	r3, r2, r13
 8010a16:	d0640023 	ldr.b      	r3, (r4, r3 << 0)
 8010a1a:	634c      	addu      	r13, r3
 8010a1c:	3420      	movi      	r4, 32
 8010a1e:	6136      	subu      	r4, r13
 8010a20:	e904000b 	bez      	r4, 0x8010a36	// 8010a36 <__umoddi3+0x4e>
 8010a24:	7050      	lsl      	r1, r4
 8010a26:	c5a0404d 	lsr      	r13, r0, r13
 8010a2a:	c4824025 	lsl      	r5, r2, r4
 8010a2e:	c42d242c 	or      	r12, r13, r1
 8010a32:	c4804026 	lsl      	r6, r0, r4
 8010a36:	c605484d 	lsri      	r13, r5, 16
 8010a3a:	c5ac8021 	divu      	r1, r12, r13
 8010a3e:	c5a18422 	mult      	r2, r1, r13
 8010a42:	c40555e0 	zext      	r0, r5, 15, 0
 8010a46:	c44c0082 	subu      	r2, r12, r2
 8010a4a:	c4208423 	mult      	r3, r0, r1
 8010a4e:	4250      	lsli      	r2, r2, 16
 8010a50:	4e30      	lsri      	r1, r6, 16
 8010a52:	6c48      	or      	r1, r2
 8010a54:	64c4      	cmphs      	r1, r3
 8010a56:	0808      	bt      	0x8010a66	// 8010a66 <__umoddi3+0x7e>
 8010a58:	6054      	addu      	r1, r5
 8010a5a:	6544      	cmphs      	r1, r5
 8010a5c:	0c05      	bf      	0x8010a66	// 8010a66 <__umoddi3+0x7e>
 8010a5e:	5954      	addu      	r2, r1, r5
 8010a60:	64c4      	cmphs      	r1, r3
 8010a62:	c4220c20 	incf      	r1, r2, 0
 8010a66:	604e      	subu      	r1, r3
 8010a68:	c5a18023 	divu      	r3, r1, r13
 8010a6c:	7f4c      	mult      	r13, r3
 8010a6e:	6076      	subu      	r1, r13
 8010a70:	7c0c      	mult      	r0, r3
 8010a72:	4130      	lsli      	r1, r1, 16
 8010a74:	c40655e3 	zext      	r3, r6, 15, 0
 8010a78:	6cc4      	or      	r3, r1
 8010a7a:	640c      	cmphs      	r3, r0
 8010a7c:	0c69      	bf      	0x8010b4e	// 8010b4e <__umoddi3+0x166>
 8010a7e:	5b01      	subu      	r0, r3, r0
 8010a80:	7011      	lsr      	r0, r4
 8010a82:	3100      	movi      	r1, 0
 8010a84:	1486      	pop      	r4-r9
 8010a86:	64c4      	cmphs      	r1, r3
 8010a88:	0ffe      	bf      	0x8010a84	// 8010a84 <__umoddi3+0x9c>
 8010a8a:	eb03ffff 	cmphsi      	r3, 65536
 8010a8e:	0c6b      	bf      	0x8010b64	// 8010b64 <__umoddi3+0x17c>
 8010a90:	c6e0502d 	bmaski      	r13, 24
 8010a94:	64f4      	cmphs      	r13, r3
 8010a96:	3518      	movi      	r5, 24
 8010a98:	ea0d0010 	movi      	r13, 16
 8010a9c:	c5a50c20 	incf      	r13, r5, 0
 8010aa0:	03a5      	lrw      	r5, 0x8013984	// 8010d08 <__umoddi3+0x320>
 8010aa2:	c5a34044 	lsr      	r4, r3, r13
 8010aa6:	d0850025 	ldr.b      	r5, (r5, r4 << 0)
 8010aaa:	6174      	addu      	r5, r13
 8010aac:	3420      	movi      	r4, 32
 8010aae:	6116      	subu      	r4, r5
 8010ab0:	e924006d 	bnez      	r4, 0x8010b8a	// 8010b8a <__umoddi3+0x1a2>
 8010ab4:	644c      	cmphs      	r3, r1
 8010ab6:	0c03      	bf      	0x8010abc	// 8010abc <__umoddi3+0xd4>
 8010ab8:	6480      	cmphs      	r0, r2
 8010aba:	0d20      	bf      	0x8010cfa	// 8010cfa <__umoddi3+0x312>
 8010abc:	5889      	subu      	r4, r0, r2
 8010abe:	6500      	cmphs      	r0, r4
 8010ac0:	c461008c 	subu      	r12, r1, r3
 8010ac4:	6443      	mvcv      	r1
 8010ac6:	6306      	subu      	r12, r1
 8010ac8:	6c13      	mov      	r0, r4
 8010aca:	6c73      	mov      	r1, r12
 8010acc:	1486      	pop      	r4-r9
 8010ace:	e9220005 	bnez      	r2, 0x8010ad8	// 8010ad8 <__umoddi3+0xf0>
 8010ad2:	3501      	movi      	r5, 1
 8010ad4:	c4458025 	divu      	r5, r5, r2
 8010ad8:	eb05ffff 	cmphsi      	r5, 65536
 8010adc:	0c4b      	bf      	0x8010b72	// 8010b72 <__umoddi3+0x18a>
 8010ade:	c6e05023 	bmaski      	r3, 24
 8010ae2:	654c      	cmphs      	r3, r5
 8010ae4:	ea0d0018 	movi      	r13, 24
 8010ae8:	3310      	movi      	r3, 16
 8010aea:	c5a30c40 	inct      	r13, r3, 0
 8010aee:	0358      	lrw      	r2, 0x8013984	// 8010d08 <__umoddi3+0x320>
 8010af0:	c5a54043 	lsr      	r3, r5, r13
 8010af4:	d0620023 	ldr.b      	r3, (r2, r3 << 0)
 8010af8:	634c      	addu      	r13, r3
 8010afa:	3420      	movi      	r4, 32
 8010afc:	6136      	subu      	r4, r13
 8010afe:	e92400af 	bnez      	r4, 0x8010c5c	// 8010c5c <__umoddi3+0x274>
 8010b02:	c4a1008c 	subu      	r12, r1, r5
 8010b06:	4df0      	lsri      	r7, r5, 16
 8010b08:	c40555e2 	zext      	r2, r5, 15, 0
 8010b0c:	c4ec8021 	divu      	r1, r12, r7
 8010b10:	c4e18423 	mult      	r3, r1, r7
 8010b14:	630e      	subu      	r12, r3
 8010b16:	c60c482c 	lsli      	r12, r12, 16
 8010b1a:	c4418423 	mult      	r3, r1, r2
 8010b1e:	4e30      	lsri      	r1, r6, 16
 8010b20:	6c70      	or      	r1, r12
 8010b22:	64c4      	cmphs      	r1, r3
 8010b24:	0808      	bt      	0x8010b34	// 8010b34 <__umoddi3+0x14c>
 8010b26:	6054      	addu      	r1, r5
 8010b28:	6544      	cmphs      	r1, r5
 8010b2a:	0c05      	bf      	0x8010b34	// 8010b34 <__umoddi3+0x14c>
 8010b2c:	5914      	addu      	r0, r1, r5
 8010b2e:	64c4      	cmphs      	r1, r3
 8010b30:	c4200c20 	incf      	r1, r0, 0
 8010b34:	604e      	subu      	r1, r3
 8010b36:	c4e18020 	divu      	r0, r1, r7
 8010b3a:	7dc0      	mult      	r7, r0
 8010b3c:	605e      	subu      	r1, r7
 8010b3e:	4130      	lsli      	r1, r1, 16
 8010b40:	c40655e6 	zext      	r6, r6, 15, 0
 8010b44:	7c08      	mult      	r0, r2
 8010b46:	c4c12423 	or      	r3, r1, r6
 8010b4a:	640c      	cmphs      	r3, r0
 8010b4c:	0808      	bt      	0x8010b5c	// 8010b5c <__umoddi3+0x174>
 8010b4e:	60d4      	addu      	r3, r5
 8010b50:	654c      	cmphs      	r3, r5
 8010b52:	0c05      	bf      	0x8010b5c	// 8010b5c <__umoddi3+0x174>
 8010b54:	614c      	addu      	r5, r3
 8010b56:	640c      	cmphs      	r3, r0
 8010b58:	c4650c20 	incf      	r3, r5, 0
 8010b5c:	5b01      	subu      	r0, r3, r0
 8010b5e:	7011      	lsr      	r0, r4
 8010b60:	3100      	movi      	r1, 0
 8010b62:	1486      	pop      	r4-r9
 8010b64:	eb0300ff 	cmphsi      	r3, 256
 8010b68:	c4000505 	mvc      	r5
 8010b6c:	c465482d 	lsli      	r13, r5, 3
 8010b70:	0798      	br      	0x8010aa0	// 8010aa0 <__umoddi3+0xb8>
 8010b72:	eb0500ff 	cmphsi      	r5, 256
 8010b76:	3308      	movi      	r3, 8
 8010b78:	c5a30c40 	inct      	r13, r3, 0
 8010b7c:	07b9      	br      	0x8010aee	// 8010aee <__umoddi3+0x106>
 8010b7e:	eb0200ff 	cmphsi      	r2, 256
 8010b82:	3308      	movi      	r3, 8
 8010b84:	c5a30c40 	inct      	r13, r3, 0
 8010b88:	0744      	br      	0x8010a10	// 8010a10 <__umoddi3+0x28>
 8010b8a:	70d0      	lsl      	r3, r4
 8010b8c:	c4a24047 	lsr      	r7, r2, r5
 8010b90:	6dcc      	or      	r7, r3
 8010b92:	c4a14046 	lsr      	r6, r1, r5
 8010b96:	c481402c 	lsl      	r12, r1, r4
 8010b9a:	c4a04041 	lsr      	r1, r0, r5
 8010b9e:	6c70      	or      	r1, r12
 8010ba0:	c607484c 	lsri      	r12, r7, 16
 8010ba4:	c5868028 	divu      	r8, r6, r12
 8010ba8:	c4824023 	lsl      	r3, r2, r4
 8010bac:	c5888422 	mult      	r2, r8, r12
 8010bb0:	618a      	subu      	r6, r2
 8010bb2:	c40755ed 	zext      	r13, r7, 15, 0
 8010bb6:	46d0      	lsli      	r6, r6, 16
 8010bb8:	4950      	lsri      	r2, r1, 16
 8010bba:	c50d8429 	mult      	r9, r13, r8
 8010bbe:	6c98      	or      	r2, r6
 8010bc0:	6648      	cmphs      	r2, r9
 8010bc2:	7010      	lsl      	r0, r4
 8010bc4:	0807      	bt      	0x8010bd2	// 8010bd2 <__umoddi3+0x1ea>
 8010bc6:	609c      	addu      	r2, r7
 8010bc8:	65c8      	cmphs      	r2, r7
 8010bca:	e4c81000 	subi      	r6, r8, 1
 8010bce:	088a      	bt      	0x8010ce2	// 8010ce2 <__umoddi3+0x2fa>
 8010bd0:	6e1b      	mov      	r8, r6
 8010bd2:	60a6      	subu      	r2, r9
 8010bd4:	c5828026 	divu      	r6, r2, r12
 8010bd8:	7f18      	mult      	r12, r6
 8010bda:	60b2      	subu      	r2, r12
 8010bdc:	4250      	lsli      	r2, r2, 16
 8010bde:	c40155e1 	zext      	r1, r1, 15, 0
 8010be2:	7f58      	mult      	r13, r6
 8010be4:	6c48      	or      	r1, r2
 8010be6:	6744      	cmphs      	r1, r13
 8010be8:	0806      	bt      	0x8010bf4	// 8010bf4 <__umoddi3+0x20c>
 8010bea:	605c      	addu      	r1, r7
 8010bec:	65c4      	cmphs      	r1, r7
 8010bee:	5e43      	subi      	r2, r6, 1
 8010bf0:	0874      	bt      	0x8010cd8	// 8010cd8 <__umoddi3+0x2f0>
 8010bf2:	6d8b      	mov      	r6, r2
 8010bf4:	c6084822 	lsli      	r2, r8, 16
 8010bf8:	6c98      	or      	r2, r6
 8010bfa:	c40255e8 	zext      	r8, r2, 15, 0
 8010bfe:	c603484c 	lsri      	r12, r3, 16
 8010c02:	4a50      	lsri      	r2, r2, 16
 8010c04:	c5a1008d 	subu      	r13, r1, r13
 8010c08:	c40355e1 	zext      	r1, r3, 15, 0
 8010c0c:	c4288426 	mult      	r6, r8, r1
 8010c10:	7c48      	mult      	r1, r2
 8010c12:	7e30      	mult      	r8, r12
 8010c14:	7cb0      	mult      	r2, r12
 8010c16:	6204      	addu      	r8, r1
 8010c18:	c606484c 	lsri      	r12, r6, 16
 8010c1c:	6320      	addu      	r12, r8
 8010c1e:	6470      	cmphs      	r12, r1
 8010c20:	0804      	bt      	0x8010c28	// 8010c28 <__umoddi3+0x240>
 8010c22:	ea210001 	movih      	r1, 1
 8010c26:	6084      	addu      	r2, r1
 8010c28:	c60c4841 	lsri      	r1, r12, 16
 8010c2c:	6048      	addu      	r1, r2
 8010c2e:	6474      	cmphs      	r13, r1
 8010c30:	c60c482c 	lsli      	r12, r12, 16
 8010c34:	c40655e6 	zext      	r6, r6, 15, 0
 8010c38:	6318      	addu      	r12, r6
 8010c3a:	0c46      	bf      	0x8010cc6	// 8010cc6 <__umoddi3+0x2de>
 8010c3c:	6476      	cmpne      	r13, r1
 8010c3e:	0c60      	bf      	0x8010cfe	// 8010cfe <__umoddi3+0x316>
 8010c40:	c42d0081 	subu      	r1, r13, r1
 8010c44:	6cf3      	mov      	r3, r12
 8010c46:	586d      	subu      	r3, r0, r3
 8010c48:	64c0      	cmphs      	r0, r3
 8010c4a:	6743      	mvcv      	r13
 8010c4c:	6076      	subu      	r1, r13
 8010c4e:	c4a14025 	lsl      	r5, r1, r5
 8010c52:	c4834040 	lsr      	r0, r3, r4
 8010c56:	6c14      	or      	r0, r5
 8010c58:	7051      	lsr      	r1, r4
 8010c5a:	1486      	pop      	r4-r9
 8010c5c:	7150      	lsl      	r5, r4
 8010c5e:	c5a14048 	lsr      	r8, r1, r13
 8010c62:	4df0      	lsri      	r7, r5, 16
 8010c64:	c5a0404d 	lsr      	r13, r0, r13
 8010c68:	7050      	lsl      	r1, r4
 8010c6a:	6c74      	or      	r1, r13
 8010c6c:	c4e8802d 	divu      	r13, r8, r7
 8010c70:	c4ed8423 	mult      	r3, r13, r7
 8010c74:	c40555e2 	zext      	r2, r5, 15, 0
 8010c78:	620e      	subu      	r8, r3
 8010c7a:	c5a2842c 	mult      	r12, r2, r13
 8010c7e:	c6084828 	lsli      	r8, r8, 16
 8010c82:	c601484d 	lsri      	r13, r1, 16
 8010c86:	6f60      	or      	r13, r8
 8010c88:	6734      	cmphs      	r13, r12
 8010c8a:	c4804026 	lsl      	r6, r0, r4
 8010c8e:	0804      	bt      	0x8010c96	// 8010c96 <__umoddi3+0x2ae>
 8010c90:	6354      	addu      	r13, r5
 8010c92:	6574      	cmphs      	r13, r5
 8010c94:	082d      	bt      	0x8010cee	// 8010cee <__umoddi3+0x306>
 8010c96:	6372      	subu      	r13, r12
 8010c98:	c4ed8023 	divu      	r3, r13, r7
 8010c9c:	c4e3842c 	mult      	r12, r3, r7
 8010ca0:	6372      	subu      	r13, r12
 8010ca2:	c60d482c 	lsli      	r12, r13, 16
 8010ca6:	c40155e1 	zext      	r1, r1, 15, 0
 8010caa:	7cc8      	mult      	r3, r2
 8010cac:	6f04      	or      	r12, r1
 8010cae:	64f0      	cmphs      	r12, r3
 8010cb0:	0809      	bt      	0x8010cc2	// 8010cc2 <__umoddi3+0x2da>
 8010cb2:	6314      	addu      	r12, r5
 8010cb4:	6570      	cmphs      	r12, r5
 8010cb6:	0c06      	bf      	0x8010cc2	// 8010cc2 <__umoddi3+0x2da>
 8010cb8:	c4ac0021 	addu      	r1, r12, r5
 8010cbc:	64f0      	cmphs      	r12, r3
 8010cbe:	c5810c20 	incf      	r12, r1, 0
 8010cc2:	630e      	subu      	r12, r3
 8010cc4:	0724      	br      	0x8010b0c	// 8010b0c <__umoddi3+0x124>
 8010cc6:	c46c0083 	subu      	r3, r12, r3
 8010cca:	64f0      	cmphs      	r12, r3
 8010ccc:	605e      	subu      	r1, r7
 8010cce:	65c3      	mvcv      	r7
 8010cd0:	605e      	subu      	r1, r7
 8010cd2:	c42d0081 	subu      	r1, r13, r1
 8010cd6:	07b8      	br      	0x8010c46	// 8010c46 <__umoddi3+0x25e>
 8010cd8:	6744      	cmphs      	r1, r13
 8010cda:	0b8c      	bt      	0x8010bf2	// 8010bf2 <__umoddi3+0x20a>
 8010cdc:	2e01      	subi      	r6, 2
 8010cde:	605c      	addu      	r1, r7
 8010ce0:	078a      	br      	0x8010bf4	// 8010bf4 <__umoddi3+0x20c>
 8010ce2:	6648      	cmphs      	r2, r9
 8010ce4:	0b76      	bt      	0x8010bd0	// 8010bd0 <__umoddi3+0x1e8>
 8010ce6:	e5081001 	subi      	r8, r8, 2
 8010cea:	609c      	addu      	r2, r7
 8010cec:	0773      	br      	0x8010bd2	// 8010bd2 <__umoddi3+0x1ea>
 8010cee:	c4ad0023 	addu      	r3, r13, r5
 8010cf2:	6734      	cmphs      	r13, r12
 8010cf4:	c5a30c20 	incf      	r13, r3, 0
 8010cf8:	07cf      	br      	0x8010c96	// 8010c96 <__umoddi3+0x2ae>
 8010cfa:	6d03      	mov      	r4, r0
 8010cfc:	06e6      	br      	0x8010ac8	// 8010ac8 <__umoddi3+0xe0>
 8010cfe:	6700      	cmphs      	r0, r12
 8010d00:	0fe3      	bf      	0x8010cc6	// 8010cc6 <__umoddi3+0x2de>
 8010d02:	6cf3      	mov      	r3, r12
 8010d04:	3100      	movi      	r1, 0
 8010d06:	07a0      	br      	0x8010c46	// 8010c46 <__umoddi3+0x25e>
 8010d08:	08013984 	.long	0x08013984

08010d0c <_fpadd_parts>:
 8010d0c:	14c8      	push      	r4-r11
 8010d0e:	1423      	subi      	r14, r14, 12
 8010d10:	9060      	ld.w      	r3, (r0, 0x0)
 8010d12:	3501      	movi      	r5, 1
 8010d14:	64d4      	cmphs      	r5, r3
 8010d16:	0871      	bt      	0x8010df8	// 8010df8 <_fpadd_parts+0xec>
 8010d18:	d9812000 	ld.w      	r12, (r1, 0x0)
 8010d1c:	6714      	cmphs      	r5, r12
 8010d1e:	086f      	bt      	0x8010dfc	// 8010dfc <_fpadd_parts+0xf0>
 8010d20:	3b44      	cmpnei      	r3, 4
 8010d22:	0cef      	bf      	0x8010f00	// 8010f00 <_fpadd_parts+0x1f4>
 8010d24:	eb4c0004 	cmpnei      	r12, 4
 8010d28:	0c6a      	bf      	0x8010dfc	// 8010dfc <_fpadd_parts+0xf0>
 8010d2a:	eb4c0002 	cmpnei      	r12, 2
 8010d2e:	0cc7      	bf      	0x8010ebc	// 8010ebc <_fpadd_parts+0x1b0>
 8010d30:	3b42      	cmpnei      	r3, 2
 8010d32:	0c65      	bf      	0x8010dfc	// 8010dfc <_fpadd_parts+0xf0>
 8010d34:	9062      	ld.w      	r3, (r0, 0x8)
 8010d36:	d9812002 	ld.w      	r12, (r1, 0x8)
 8010d3a:	c583008d 	subu      	r13, r3, r12
 8010d3e:	c40d0208 	abs      	r8, r13
 8010d42:	eb28003f 	cmplti      	r8, 64
 8010d46:	90c3      	ld.w      	r6, (r0, 0xc)
 8010d48:	90e4      	ld.w      	r7, (r0, 0x10)
 8010d4a:	b8c0      	st.w      	r6, (r14, 0x0)
 8010d4c:	b8e1      	st.w      	r7, (r14, 0x4)
 8010d4e:	d9412003 	ld.w      	r10, (r1, 0xc)
 8010d52:	d9612004 	ld.w      	r11, (r1, 0x10)
 8010d56:	0856      	bt      	0x8010e02	// 8010e02 <_fpadd_parts+0xf6>
 8010d58:	64f1      	cmplt      	r12, r3
 8010d5a:	0cc9      	bf      	0x8010eec	// 8010eec <_fpadd_parts+0x1e0>
 8010d5c:	ea0a0000 	movi      	r10, 0
 8010d60:	ea0b0000 	movi      	r11, 0
 8010d64:	9001      	ld.w      	r0, (r0, 0x4)
 8010d66:	9121      	ld.w      	r1, (r1, 0x4)
 8010d68:	6442      	cmpne      	r0, r1
 8010d6a:	0c82      	bf      	0x8010e6e	// 8010e6e <_fpadd_parts+0x162>
 8010d6c:	d98e2000 	ld.w      	r12, (r14, 0x0)
 8010d70:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010d74:	e90000b8 	bez      	r0, 0x8010ee4	// 8010ee4 <_fpadd_parts+0x1d8>
 8010d78:	6730      	cmphs      	r12, r12
 8010d7a:	c58a010c 	subc      	r12, r10, r12
 8010d7e:	c5ab010d 	subc      	r13, r11, r13
 8010d82:	e98d00c9 	blz      	r13, 0x8010f14	// 8010f14 <_fpadd_parts+0x208>
 8010d86:	3100      	movi      	r1, 0
 8010d88:	b221      	st.w      	r1, (r2, 0x4)
 8010d8a:	b262      	st.w      	r3, (r2, 0x8)
 8010d8c:	dd822003 	st.w      	r12, (r2, 0xc)
 8010d90:	dda22004 	st.w      	r13, (r2, 0x10)
 8010d94:	6c33      	mov      	r0, r12
 8010d96:	6c77      	mov      	r1, r13
 8010d98:	3840      	cmpnei      	r0, 0
 8010d9a:	c4210c81 	decf      	r1, r1, 1
 8010d9e:	2800      	subi      	r0, 1
 8010da0:	c7605023 	bmaski      	r3, 28
 8010da4:	644c      	cmphs      	r3, r1
 8010da6:	0c71      	bf      	0x8010e88	// 8010e88 <_fpadd_parts+0x17c>
 8010da8:	64c6      	cmpne      	r1, r3
 8010daa:	0d0d      	bf      	0x8010fc4	// 8010fc4 <_fpadd_parts+0x2b8>
 8010dac:	9262      	ld.w      	r3, (r2, 0x8)
 8010dae:	3600      	movi      	r6, 0
 8010db0:	3700      	movi      	r7, 0
 8010db2:	ea0a0000 	movi      	r10, 0
 8010db6:	2b00      	subi      	r3, 1
 8010db8:	2e00      	subi      	r6, 1
 8010dba:	2f00      	subi      	r7, 1
 8010dbc:	c7605028 	bmaski      	r8, 28
 8010dc0:	e54a1001 	subi      	r10, r10, 2
 8010dc4:	0403      	br      	0x8010dca	// 8010dca <_fpadd_parts+0xbe>
 8010dc6:	6606      	cmpne      	r1, r8
 8010dc8:	0c8b      	bf      	0x8010ede	// 8010ede <_fpadd_parts+0x1d2>
 8010dca:	6511      	cmplt      	r4, r4
 8010dcc:	c58c0044 	addc      	r4, r12, r12
 8010dd0:	c5ad0045 	addc      	r5, r13, r13
 8010dd4:	6401      	cmplt      	r0, r0
 8010dd6:	c4c40040 	addc      	r0, r4, r6
 8010dda:	c4e50041 	addc      	r1, r5, r7
 8010dde:	6460      	cmphs      	r8, r1
 8010de0:	6e4f      	mov      	r9, r3
 8010de2:	6f13      	mov      	r12, r4
 8010de4:	6f57      	mov      	r13, r5
 8010de6:	2b00      	subi      	r3, 1
 8010de8:	0bef      	bt      	0x8010dc6	// 8010dc6 <_fpadd_parts+0xba>
 8010dea:	3303      	movi      	r3, 3
 8010dec:	b283      	st.w      	r4, (r2, 0xc)
 8010dee:	b2a4      	st.w      	r5, (r2, 0x10)
 8010df0:	dd222002 	st.w      	r9, (r2, 0x8)
 8010df4:	b260      	st.w      	r3, (r2, 0x0)
 8010df6:	6c0b      	mov      	r0, r2
 8010df8:	1403      	addi      	r14, r14, 12
 8010dfa:	1488      	pop      	r4-r11
 8010dfc:	6c07      	mov      	r0, r1
 8010dfe:	1403      	addi      	r14, r14, 12
 8010e00:	1488      	pop      	r4-r11
 8010e02:	e96d009a 	blsz      	r13, 0x8010f36	// 8010f36 <_fpadd_parts+0x22a>
 8010e06:	ea0d001f 	movi      	r13, 31
 8010e0a:	c42b4826 	lsli      	r6, r11, 1
 8010e0e:	6362      	subu      	r13, r8
 8010e10:	e588101f 	subi      	r12, r8, 32
 8010e14:	c5a6402d 	lsl      	r13, r6, r13
 8010e18:	c50a4046 	lsr      	r6, r10, r8
 8010e1c:	c7ec2880 	btsti      	r12, 31
 8010e20:	c58b4049 	lsr      	r9, r11, r12
 8010e24:	3400      	movi      	r4, 0
 8010e26:	6db4      	or      	r6, r13
 8010e28:	c4c90c20 	incf      	r6, r9, 0
 8010e2c:	6f53      	mov      	r13, r4
 8010e2e:	c5854029 	lsl      	r9, r5, r12
 8010e32:	c505402c 	lsl      	r12, r5, r8
 8010e36:	c50b4047 	lsr      	r7, r11, r8
 8010e3a:	c5a90c20 	incf      	r13, r9, 0
 8010e3e:	c5840c20 	incf      	r12, r4, 0
 8010e42:	c4e40c20 	incf      	r7, r4, 0
 8010e46:	eb4c0000 	cmpnei      	r12, 0
 8010e4a:	c5ad0c81 	decf      	r13, r13, 1
 8010e4e:	e58c1000 	subi      	r12, r12, 1
 8010e52:	6b28      	and      	r12, r10
 8010e54:	6b6c      	and      	r13, r11
 8010e56:	6f34      	or      	r12, r13
 8010e58:	eb4c0000 	cmpnei      	r12, 0
 8010e5c:	9001      	ld.w      	r0, (r0, 0x4)
 8010e5e:	9121      	ld.w      	r1, (r1, 0x4)
 8010e60:	c400050a 	mvc      	r10
 8010e64:	6442      	cmpne      	r0, r1
 8010e66:	6ed3      	mov      	r11, r4
 8010e68:	6e98      	or      	r10, r6
 8010e6a:	6edc      	or      	r11, r7
 8010e6c:	0b80      	bt      	0x8010d6c	// 8010d6c <_fpadd_parts+0x60>
 8010e6e:	d98e2000 	ld.w      	r12, (r14, 0x0)
 8010e72:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010e76:	6731      	cmplt      	r12, r12
 8010e78:	6329      	addc      	r12, r10
 8010e7a:	636d      	addc      	r13, r11
 8010e7c:	b201      	st.w      	r0, (r2, 0x4)
 8010e7e:	b262      	st.w      	r3, (r2, 0x8)
 8010e80:	dd822003 	st.w      	r12, (r2, 0xc)
 8010e84:	dda22004 	st.w      	r13, (r2, 0x10)
 8010e88:	3303      	movi      	r3, 3
 8010e8a:	b260      	st.w      	r3, (r2, 0x0)
 8010e8c:	c7805023 	bmaski      	r3, 29
 8010e90:	674c      	cmphs      	r3, r13
 8010e92:	0812      	bt      	0x8010eb6	// 8010eb6 <_fpadd_parts+0x1aa>
 8010e94:	c7ed4823 	lsli      	r3, r13, 31
 8010e98:	c42c4840 	lsri      	r0, r12, 1
 8010e9c:	6c0c      	or      	r0, r3
 8010e9e:	c42d4841 	lsri      	r1, r13, 1
 8010ea2:	9262      	ld.w      	r3, (r2, 0x8)
 8010ea4:	e48c2001 	andi      	r4, r12, 1
 8010ea8:	3500      	movi      	r5, 0
 8010eaa:	6c10      	or      	r0, r4
 8010eac:	6c54      	or      	r1, r5
 8010eae:	2300      	addi      	r3, 1
 8010eb0:	b203      	st.w      	r0, (r2, 0xc)
 8010eb2:	b224      	st.w      	r1, (r2, 0x10)
 8010eb4:	b262      	st.w      	r3, (r2, 0x8)
 8010eb6:	6c0b      	mov      	r0, r2
 8010eb8:	1403      	addi      	r14, r14, 12
 8010eba:	1488      	pop      	r4-r11
 8010ebc:	3b42      	cmpnei      	r3, 2
 8010ebe:	0b9d      	bt      	0x8010df8	// 8010df8 <_fpadd_parts+0xec>
 8010ec0:	b260      	st.w      	r3, (r2, 0x0)
 8010ec2:	9061      	ld.w      	r3, (r0, 0x4)
 8010ec4:	b261      	st.w      	r3, (r2, 0x4)
 8010ec6:	9062      	ld.w      	r3, (r0, 0x8)
 8010ec8:	b262      	st.w      	r3, (r2, 0x8)
 8010eca:	9063      	ld.w      	r3, (r0, 0xc)
 8010ecc:	b263      	st.w      	r3, (r2, 0xc)
 8010ece:	9064      	ld.w      	r3, (r0, 0x10)
 8010ed0:	9121      	ld.w      	r1, (r1, 0x4)
 8010ed2:	b264      	st.w      	r3, (r2, 0x10)
 8010ed4:	9061      	ld.w      	r3, (r0, 0x4)
 8010ed6:	68c4      	and      	r3, r1
 8010ed8:	b261      	st.w      	r3, (r2, 0x4)
 8010eda:	6c0b      	mov      	r0, r2
 8010edc:	078e      	br      	0x8010df8	// 8010df8 <_fpadd_parts+0xec>
 8010ede:	6428      	cmphs      	r10, r0
 8010ee0:	0b75      	bt      	0x8010dca	// 8010dca <_fpadd_parts+0xbe>
 8010ee2:	0784      	br      	0x8010dea	// 8010dea <_fpadd_parts+0xde>
 8010ee4:	6730      	cmphs      	r12, r12
 8010ee6:	632b      	subc      	r12, r10
 8010ee8:	636f      	subc      	r13, r11
 8010eea:	074c      	br      	0x8010d82	// 8010d82 <_fpadd_parts+0x76>
 8010eec:	6cf3      	mov      	r3, r12
 8010eee:	ea0d0000 	movi      	r13, 0
 8010ef2:	ea0c0000 	movi      	r12, 0
 8010ef6:	dd8e2000 	st.w      	r12, (r14, 0x0)
 8010efa:	ddae2001 	st.w      	r13, (r14, 0x4)
 8010efe:	0733      	br      	0x8010d64	// 8010d64 <_fpadd_parts+0x58>
 8010f00:	eb4c0004 	cmpnei      	r12, 4
 8010f04:	0b7a      	bt      	0x8010df8	// 8010df8 <_fpadd_parts+0xec>
 8010f06:	9041      	ld.w      	r2, (r0, 0x4)
 8010f08:	9161      	ld.w      	r3, (r1, 0x4)
 8010f0a:	64ca      	cmpne      	r2, r3
 8010f0c:	124b      	lrw      	r2, 0x8013970	// 8011038 <__subdf3+0x38>
 8010f0e:	c4020c40 	inct      	r0, r2, 0
 8010f12:	0773      	br      	0x8010df8	// 8010df8 <_fpadd_parts+0xec>
 8010f14:	ea0a0000 	movi      	r10, 0
 8010f18:	ea0b0000 	movi      	r11, 0
 8010f1c:	3101      	movi      	r1, 1
 8010f1e:	6730      	cmphs      	r12, r12
 8010f20:	c58a010c 	subc      	r12, r10, r12
 8010f24:	c5ab010d 	subc      	r13, r11, r13
 8010f28:	b221      	st.w      	r1, (r2, 0x4)
 8010f2a:	b262      	st.w      	r3, (r2, 0x8)
 8010f2c:	dd822003 	st.w      	r12, (r2, 0xc)
 8010f30:	dda22004 	st.w      	r13, (r2, 0x10)
 8010f34:	0730      	br      	0x8010d94	// 8010d94 <_fpadd_parts+0x88>
 8010f36:	e90dff17 	bez      	r13, 0x8010d64	// 8010d64 <_fpadd_parts+0x58>
 8010f3a:	98c0      	ld.w      	r6, (r14, 0x0)
 8010f3c:	98e1      	ld.w      	r7, (r14, 0x4)
 8010f3e:	ea0d001f 	movi      	r13, 31
 8010f42:	47c1      	lsli      	r6, r7, 1
 8010f44:	6362      	subu      	r13, r8
 8010f46:	c5a6402d 	lsl      	r13, r6, r13
 8010f4a:	ddae2002 	st.w      	r13, (r14, 0x8)
 8010f4e:	d9ae2000 	ld.w      	r13, (r14, 0x0)
 8010f52:	e588101f 	subi      	r12, r8, 32
 8010f56:	c50d4046 	lsr      	r6, r13, r8
 8010f5a:	d9ae2002 	ld.w      	r13, (r14, 0x8)
 8010f5e:	c7ec2880 	btsti      	r12, 31
 8010f62:	3400      	movi      	r4, 0
 8010f64:	c5874049 	lsr      	r9, r7, r12
 8010f68:	6db4      	or      	r6, r13
 8010f6a:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010f6e:	c4c90c20 	incf      	r6, r9, 0
 8010f72:	c50d4047 	lsr      	r7, r13, r8
 8010f76:	c5854029 	lsl      	r9, r5, r12
 8010f7a:	6f53      	mov      	r13, r4
 8010f7c:	c505402c 	lsl      	r12, r5, r8
 8010f80:	c5a90c20 	incf      	r13, r9, 0
 8010f84:	c5840c20 	incf      	r12, r4, 0
 8010f88:	c4e40c20 	incf      	r7, r4, 0
 8010f8c:	60e0      	addu      	r3, r8
 8010f8e:	eb4c0000 	cmpnei      	r12, 0
 8010f92:	c5ad0c81 	decf      	r13, r13, 1
 8010f96:	e58c1000 	subi      	r12, r12, 1
 8010f9a:	d90e2000 	ld.w      	r8, (r14, 0x0)
 8010f9e:	d92e2001 	ld.w      	r9, (r14, 0x4)
 8010fa2:	6a30      	and      	r8, r12
 8010fa4:	6a74      	and      	r9, r13
 8010fa6:	6f23      	mov      	r12, r8
 8010fa8:	6f67      	mov      	r13, r9
 8010faa:	6f34      	or      	r12, r13
 8010fac:	eb4c0000 	cmpnei      	r12, 0
 8010fb0:	c400050c 	mvc      	r12
 8010fb4:	6f53      	mov      	r13, r4
 8010fb6:	c5862424 	or      	r4, r6, r12
 8010fba:	c5a72425 	or      	r5, r7, r13
 8010fbe:	b880      	st.w      	r4, (r14, 0x0)
 8010fc0:	b8a1      	st.w      	r5, (r14, 0x4)
 8010fc2:	06d1      	br      	0x8010d64	// 8010d64 <_fpadd_parts+0x58>
 8010fc4:	3300      	movi      	r3, 0
 8010fc6:	2b01      	subi      	r3, 2
 8010fc8:	640c      	cmphs      	r3, r0
 8010fca:	0af1      	bt      	0x8010dac	// 8010dac <_fpadd_parts+0xa0>
 8010fcc:	075e      	br      	0x8010e88	// 8010e88 <_fpadd_parts+0x17c>
	...

08010fd0 <__adddf3>:
 8010fd0:	14d2      	push      	r4-r5, r15
 8010fd2:	1433      	subi      	r14, r14, 76
 8010fd4:	b800      	st.w      	r0, (r14, 0x0)
 8010fd6:	b821      	st.w      	r1, (r14, 0x4)
 8010fd8:	6c3b      	mov      	r0, r14
 8010fda:	6d47      	mov      	r5, r1
 8010fdc:	1904      	addi      	r1, r14, 16
 8010fde:	b863      	st.w      	r3, (r14, 0xc)
 8010fe0:	b842      	st.w      	r2, (r14, 0x8)
 8010fe2:	e00003b7 	bsr      	0x8011750	// 8011750 <__unpack_d>
 8010fe6:	1909      	addi      	r1, r14, 36
 8010fe8:	1802      	addi      	r0, r14, 8
 8010fea:	e00003b3 	bsr      	0x8011750	// 8011750 <__unpack_d>
 8010fee:	1a0e      	addi      	r2, r14, 56
 8010ff0:	1909      	addi      	r1, r14, 36
 8010ff2:	1804      	addi      	r0, r14, 16
 8010ff4:	e3fffe8c 	bsr      	0x8010d0c	// 8010d0c <_fpadd_parts>
 8010ff8:	e00002e4 	bsr      	0x80115c0	// 80115c0 <__pack_d>
 8010ffc:	1413      	addi      	r14, r14, 76
 8010ffe:	1492      	pop      	r4-r5, r15

08011000 <__subdf3>:
 8011000:	14d2      	push      	r4-r5, r15
 8011002:	1433      	subi      	r14, r14, 76
 8011004:	b800      	st.w      	r0, (r14, 0x0)
 8011006:	b821      	st.w      	r1, (r14, 0x4)
 8011008:	6c3b      	mov      	r0, r14
 801100a:	6d47      	mov      	r5, r1
 801100c:	1904      	addi      	r1, r14, 16
 801100e:	b842      	st.w      	r2, (r14, 0x8)
 8011010:	b863      	st.w      	r3, (r14, 0xc)
 8011012:	e000039f 	bsr      	0x8011750	// 8011750 <__unpack_d>
 8011016:	1909      	addi      	r1, r14, 36
 8011018:	1802      	addi      	r0, r14, 8
 801101a:	e000039b 	bsr      	0x8011750	// 8011750 <__unpack_d>
 801101e:	986a      	ld.w      	r3, (r14, 0x28)
 8011020:	e4634001 	xori      	r3, r3, 1
 8011024:	1a0e      	addi      	r2, r14, 56
 8011026:	1909      	addi      	r1, r14, 36
 8011028:	1804      	addi      	r0, r14, 16
 801102a:	b86a      	st.w      	r3, (r14, 0x28)
 801102c:	e3fffe70 	bsr      	0x8010d0c	// 8010d0c <_fpadd_parts>
 8011030:	e00002c8 	bsr      	0x80115c0	// 80115c0 <__pack_d>
 8011034:	1413      	addi      	r14, r14, 76
 8011036:	1492      	pop      	r4-r5, r15
 8011038:	08013970 	.long	0x08013970

0801103c <__muldf3>:
 801103c:	14d8      	push      	r4-r11, r15
 801103e:	1436      	subi      	r14, r14, 88
 8011040:	b803      	st.w      	r0, (r14, 0xc)
 8011042:	b824      	st.w      	r1, (r14, 0x10)
 8011044:	1803      	addi      	r0, r14, 12
 8011046:	1907      	addi      	r1, r14, 28
 8011048:	b866      	st.w      	r3, (r14, 0x18)
 801104a:	b845      	st.w      	r2, (r14, 0x14)
 801104c:	e0000382 	bsr      	0x8011750	// 8011750 <__unpack_d>
 8011050:	190c      	addi      	r1, r14, 48
 8011052:	1805      	addi      	r0, r14, 20
 8011054:	e000037e 	bsr      	0x8011750	// 8011750 <__unpack_d>
 8011058:	9867      	ld.w      	r3, (r14, 0x1c)
 801105a:	3b01      	cmphsi      	r3, 2
 801105c:	0ca4      	bf      	0x80111a4	// 80111a4 <__muldf3+0x168>
 801105e:	984c      	ld.w      	r2, (r14, 0x30)
 8011060:	3a01      	cmphsi      	r2, 2
 8011062:	0c94      	bf      	0x801118a	// 801118a <__muldf3+0x14e>
 8011064:	3b44      	cmpnei      	r3, 4
 8011066:	0c9d      	bf      	0x80111a0	// 80111a0 <__muldf3+0x164>
 8011068:	3a44      	cmpnei      	r2, 4
 801106a:	0c8e      	bf      	0x8011186	// 8011186 <__muldf3+0x14a>
 801106c:	3b42      	cmpnei      	r3, 2
 801106e:	0c9b      	bf      	0x80111a4	// 80111a4 <__muldf3+0x168>
 8011070:	3a42      	cmpnei      	r2, 2
 8011072:	0c8c      	bf      	0x801118a	// 801118a <__muldf3+0x14e>
 8011074:	d98e200f 	ld.w      	r12, (r14, 0x3c)
 8011078:	d90e200a 	ld.w      	r8, (r14, 0x28)
 801107c:	3300      	movi      	r3, 0
 801107e:	6c33      	mov      	r0, r12
 8011080:	6ca3      	mov      	r2, r8
 8011082:	6c4f      	mov      	r1, r3
 8011084:	dd8e2002 	st.w      	r12, (r14, 0x8)
 8011088:	d96e2010 	ld.w      	r11, (r14, 0x40)
 801108c:	e0000274 	bsr      	0x8011574	// 8011574 <__muldi3>
 8011090:	3300      	movi      	r3, 0
 8011092:	6ca3      	mov      	r2, r8
 8011094:	6d83      	mov      	r6, r0
 8011096:	6dc7      	mov      	r7, r1
 8011098:	6c4f      	mov      	r1, r3
 801109a:	6c2f      	mov      	r0, r11
 801109c:	e000026c 	bsr      	0x8011574	// 8011574 <__muldi3>
 80110a0:	d94e200b 	ld.w      	r10, (r14, 0x2c)
 80110a4:	3300      	movi      	r3, 0
 80110a6:	6e03      	mov      	r8, r0
 80110a8:	6e47      	mov      	r9, r1
 80110aa:	6caf      	mov      	r2, r11
 80110ac:	6c4f      	mov      	r1, r3
 80110ae:	6c2b      	mov      	r0, r10
 80110b0:	e0000262 	bsr      	0x8011574	// 8011574 <__muldi3>
 80110b4:	d98e2002 	ld.w      	r12, (r14, 0x8)
 80110b8:	3300      	movi      	r3, 0
 80110ba:	b800      	st.w      	r0, (r14, 0x0)
 80110bc:	b821      	st.w      	r1, (r14, 0x4)
 80110be:	6cb3      	mov      	r2, r12
 80110c0:	6c2b      	mov      	r0, r10
 80110c2:	6c4f      	mov      	r1, r3
 80110c4:	e0000258 	bsr      	0x8011574	// 8011574 <__muldi3>
 80110c8:	6401      	cmplt      	r0, r0
 80110ca:	6021      	addc      	r0, r8
 80110cc:	6065      	addc      	r1, r9
 80110ce:	6644      	cmphs      	r1, r9
 80110d0:	0c80      	bf      	0x80111d0	// 80111d0 <__muldf3+0x194>
 80110d2:	6466      	cmpne      	r9, r1
 80110d4:	0c7c      	bf      	0x80111cc	// 80111cc <__muldf3+0x190>
 80110d6:	ea080000 	movi      	r8, 0
 80110da:	ea090000 	movi      	r9, 0
 80110de:	3200      	movi      	r2, 0
 80110e0:	6cc3      	mov      	r3, r0
 80110e2:	6489      	cmplt      	r2, r2
 80110e4:	6099      	addc      	r2, r6
 80110e6:	60dd      	addc      	r3, r7
 80110e8:	65cc      	cmphs      	r3, r7
 80110ea:	0c6a      	bf      	0x80111be	// 80111be <__muldf3+0x182>
 80110ec:	64de      	cmpne      	r7, r3
 80110ee:	0c66      	bf      	0x80111ba	// 80111ba <__muldf3+0x17e>
 80110f0:	6f07      	mov      	r12, r1
 80110f2:	ea0d0000 	movi      	r13, 0
 80110f6:	9800      	ld.w      	r0, (r14, 0x0)
 80110f8:	9821      	ld.w      	r1, (r14, 0x4)
 80110fa:	6401      	cmplt      	r0, r0
 80110fc:	6031      	addc      	r0, r12
 80110fe:	6075      	addc      	r1, r13
 8011100:	6621      	cmplt      	r8, r8
 8011102:	6201      	addc      	r8, r0
 8011104:	6245      	addc      	r9, r1
 8011106:	980e      	ld.w      	r0, (r14, 0x38)
 8011108:	9829      	ld.w      	r1, (r14, 0x24)
 801110a:	6040      	addu      	r1, r0
 801110c:	590e      	addi      	r0, r1, 4
 801110e:	b813      	st.w      	r0, (r14, 0x4c)
 8011110:	d98e2008 	ld.w      	r12, (r14, 0x20)
 8011114:	980d      	ld.w      	r0, (r14, 0x34)
 8011116:	6432      	cmpne      	r12, r0
 8011118:	c780502a 	bmaski      	r10, 29
 801111c:	c4000500 	mvc      	r0
 8011120:	6668      	cmphs      	r10, r9
 8011122:	b812      	st.w      	r0, (r14, 0x48)
 8011124:	086f      	bt      	0x8011202	// 8011202 <__muldf3+0x1c6>
 8011126:	2104      	addi      	r1, 5
 8011128:	ea0c0000 	movi      	r12, 0
 801112c:	ea2d8000 	movih      	r13, 32768
 8011130:	e4082001 	andi      	r0, r8, 1
 8011134:	6ec7      	mov      	r11, r1
 8011136:	e900000a 	bez      	r0, 0x801114a	// 801114a <__muldf3+0x10e>
 801113a:	431f      	lsli      	r0, r3, 31
 801113c:	4a81      	lsri      	r4, r2, 1
 801113e:	6d00      	or      	r4, r0
 8011140:	4ba1      	lsri      	r5, r3, 1
 8011142:	c5842422 	or      	r2, r4, r12
 8011146:	c5a52423 	or      	r3, r5, r13
 801114a:	c4294840 	lsri      	r0, r9, 1
 801114e:	6428      	cmphs      	r10, r0
 8011150:	c7e94827 	lsli      	r7, r9, 31
 8011154:	c4284846 	lsri      	r6, r8, 1
 8011158:	c4c72428 	or      	r8, r7, r6
 801115c:	6e43      	mov      	r9, r0
 801115e:	2100      	addi      	r1, 1
 8011160:	0fe8      	bf      	0x8011130	// 8011130 <__muldf3+0xf4>
 8011162:	dd6e2013 	st.w      	r11, (r14, 0x4c)
 8011166:	e42820ff 	andi      	r1, r8, 255
 801116a:	eb410080 	cmpnei      	r1, 128
 801116e:	0c36      	bf      	0x80111da	// 80111da <__muldf3+0x19e>
 8011170:	3303      	movi      	r3, 3
 8011172:	dd0e2014 	st.w      	r8, (r14, 0x50)
 8011176:	dd2e2015 	st.w      	r9, (r14, 0x54)
 801117a:	b871      	st.w      	r3, (r14, 0x44)
 801117c:	1811      	addi      	r0, r14, 68
 801117e:	e0000221 	bsr      	0x80115c0	// 80115c0 <__pack_d>
 8011182:	1416      	addi      	r14, r14, 88
 8011184:	1498      	pop      	r4-r11, r15
 8011186:	3b42      	cmpnei      	r3, 2
 8011188:	0c3b      	bf      	0x80111fe	// 80111fe <__muldf3+0x1c2>
 801118a:	986d      	ld.w      	r3, (r14, 0x34)
 801118c:	9848      	ld.w      	r2, (r14, 0x20)
 801118e:	64ca      	cmpne      	r2, r3
 8011190:	c4000503 	mvc      	r3
 8011194:	180c      	addi      	r0, r14, 48
 8011196:	b86d      	st.w      	r3, (r14, 0x34)
 8011198:	e0000214 	bsr      	0x80115c0	// 80115c0 <__pack_d>
 801119c:	1416      	addi      	r14, r14, 88
 801119e:	1498      	pop      	r4-r11, r15
 80111a0:	3a42      	cmpnei      	r2, 2
 80111a2:	0c2e      	bf      	0x80111fe	// 80111fe <__muldf3+0x1c2>
 80111a4:	9848      	ld.w      	r2, (r14, 0x20)
 80111a6:	986d      	ld.w      	r3, (r14, 0x34)
 80111a8:	64ca      	cmpne      	r2, r3
 80111aa:	c4000503 	mvc      	r3
 80111ae:	1807      	addi      	r0, r14, 28
 80111b0:	b868      	st.w      	r3, (r14, 0x20)
 80111b2:	e0000207 	bsr      	0x80115c0	// 80115c0 <__pack_d>
 80111b6:	1416      	addi      	r14, r14, 88
 80111b8:	1498      	pop      	r4-r11, r15
 80111ba:	6588      	cmphs      	r2, r6
 80111bc:	0b9a      	bt      	0x80110f0	// 80110f0 <__muldf3+0xb4>
 80111be:	e5080000 	addi      	r8, r8, 1
 80111c2:	eb480000 	cmpnei      	r8, 0
 80111c6:	c5290c21 	incf      	r9, r9, 1
 80111ca:	0793      	br      	0x80110f0	// 80110f0 <__muldf3+0xb4>
 80111cc:	6600      	cmphs      	r0, r8
 80111ce:	0b84      	bt      	0x80110d6	// 80110d6 <__muldf3+0x9a>
 80111d0:	ea080000 	movi      	r8, 0
 80111d4:	ea090001 	movi      	r9, 1
 80111d8:	0783      	br      	0x80110de	// 80110de <__muldf3+0xa2>
 80111da:	e4282100 	andi      	r1, r8, 256
 80111de:	e921ffc9 	bnez      	r1, 0x8011170	// 8011170 <__muldf3+0x134>
 80111e2:	6c8c      	or      	r2, r3
 80111e4:	e902ffc6 	bez      	r2, 0x8011170	// 8011170 <__muldf3+0x134>
 80111e8:	3280      	movi      	r2, 128
 80111ea:	3300      	movi      	r3, 0
 80111ec:	3100      	movi      	r1, 0
 80111ee:	6489      	cmplt      	r2, r2
 80111f0:	60a1      	addc      	r2, r8
 80111f2:	60e5      	addc      	r3, r9
 80111f4:	29ff      	subi      	r1, 256
 80111f6:	c4222028 	and      	r8, r2, r1
 80111fa:	6e4f      	mov      	r9, r3
 80111fc:	07ba      	br      	0x8011170	// 8011170 <__muldf3+0x134>
 80111fe:	100f      	lrw      	r0, 0x8013970	// 8011238 <__muldf3+0x1fc>
 8011200:	07bf      	br      	0x801117e	// 801117e <__muldf3+0x142>
 8011202:	c760502c 	bmaski      	r12, 28
 8011206:	6670      	cmphs      	r12, r9
 8011208:	0faf      	bf      	0x8011166	// 8011166 <__muldf3+0x12a>
 801120a:	2102      	addi      	r1, 3
 801120c:	3401      	movi      	r4, 1
 801120e:	3500      	movi      	r5, 0
 8011210:	6da3      	mov      	r6, r8
 8011212:	6de7      	mov      	r7, r9
 8011214:	6c07      	mov      	r0, r1
 8011216:	6621      	cmplt      	r8, r8
 8011218:	6219      	addc      	r8, r6
 801121a:	625d      	addc      	r9, r7
 801121c:	e9a30004 	bhsz      	r3, 0x8011224	// 8011224 <__muldf3+0x1e8>
 8011220:	6e10      	or      	r8, r4
 8011222:	6e54      	or      	r9, r5
 8011224:	6d8b      	mov      	r6, r2
 8011226:	6dcf      	mov      	r7, r3
 8011228:	6489      	cmplt      	r2, r2
 801122a:	6099      	addc      	r2, r6
 801122c:	60dd      	addc      	r3, r7
 801122e:	6670      	cmphs      	r12, r9
 8011230:	2900      	subi      	r1, 1
 8011232:	0bef      	bt      	0x8011210	// 8011210 <__muldf3+0x1d4>
 8011234:	b813      	st.w      	r0, (r14, 0x4c)
 8011236:	0798      	br      	0x8011166	// 8011166 <__muldf3+0x12a>
 8011238:	08013970 	.long	0x08013970

0801123c <__divdf3>:
 801123c:	14d6      	push      	r4-r9, r15
 801123e:	142e      	subi      	r14, r14, 56
 8011240:	b800      	st.w      	r0, (r14, 0x0)
 8011242:	b821      	st.w      	r1, (r14, 0x4)
 8011244:	6c3b      	mov      	r0, r14
 8011246:	1904      	addi      	r1, r14, 16
 8011248:	b863      	st.w      	r3, (r14, 0xc)
 801124a:	b842      	st.w      	r2, (r14, 0x8)
 801124c:	e0000282 	bsr      	0x8011750	// 8011750 <__unpack_d>
 8011250:	1909      	addi      	r1, r14, 36
 8011252:	1802      	addi      	r0, r14, 8
 8011254:	e000027e 	bsr      	0x8011750	// 8011750 <__unpack_d>
 8011258:	9864      	ld.w      	r3, (r14, 0x10)
 801125a:	3b01      	cmphsi      	r3, 2
 801125c:	0c51      	bf      	0x80112fe	// 80112fe <__divdf3+0xc2>
 801125e:	9829      	ld.w      	r1, (r14, 0x24)
 8011260:	3201      	movi      	r2, 1
 8011262:	6448      	cmphs      	r2, r1
 8011264:	0873      	bt      	0x801134a	// 801134a <__divdf3+0x10e>
 8011266:	9845      	ld.w      	r2, (r14, 0x14)
 8011268:	980a      	ld.w      	r0, (r14, 0x28)
 801126a:	3b44      	cmpnei      	r3, 4
 801126c:	6c81      	xor      	r2, r0
 801126e:	b845      	st.w      	r2, (r14, 0x14)
 8011270:	0c4c      	bf      	0x8011308	// 8011308 <__divdf3+0xcc>
 8011272:	3b42      	cmpnei      	r3, 2
 8011274:	0c4a      	bf      	0x8011308	// 8011308 <__divdf3+0xcc>
 8011276:	3944      	cmpnei      	r1, 4
 8011278:	0c4c      	bf      	0x8011310	// 8011310 <__divdf3+0xd4>
 801127a:	3942      	cmpnei      	r1, 2
 801127c:	0c63      	bf      	0x8011342	// 8011342 <__divdf3+0x106>
 801127e:	9807      	ld.w      	r0, (r14, 0x1c)
 8011280:	9828      	ld.w      	r1, (r14, 0x20)
 8011282:	98cc      	ld.w      	r6, (r14, 0x30)
 8011284:	98ed      	ld.w      	r7, (r14, 0x34)
 8011286:	9866      	ld.w      	r3, (r14, 0x18)
 8011288:	984b      	ld.w      	r2, (r14, 0x2c)
 801128a:	65c4      	cmphs      	r1, r7
 801128c:	60ca      	subu      	r3, r2
 801128e:	b866      	st.w      	r3, (r14, 0x18)
 8011290:	0c05      	bf      	0x801129a	// 801129a <__divdf3+0x5e>
 8011292:	645e      	cmpne      	r7, r1
 8011294:	080a      	bt      	0x80112a8	// 80112a8 <__divdf3+0x6c>
 8011296:	6580      	cmphs      	r0, r6
 8011298:	0808      	bt      	0x80112a8	// 80112a8 <__divdf3+0x6c>
 801129a:	6f03      	mov      	r12, r0
 801129c:	6f47      	mov      	r13, r1
 801129e:	2b00      	subi      	r3, 1
 80112a0:	6401      	cmplt      	r0, r0
 80112a2:	6031      	addc      	r0, r12
 80112a4:	6075      	addc      	r1, r13
 80112a6:	b866      	st.w      	r3, (r14, 0x18)
 80112a8:	ea0c003d 	movi      	r12, 61
 80112ac:	3400      	movi      	r4, 0
 80112ae:	3500      	movi      	r5, 0
 80112b0:	3200      	movi      	r2, 0
 80112b2:	ea231000 	movih      	r3, 4096
 80112b6:	65c4      	cmphs      	r1, r7
 80112b8:	0c0a      	bf      	0x80112cc	// 80112cc <__divdf3+0x90>
 80112ba:	645e      	cmpne      	r7, r1
 80112bc:	0803      	bt      	0x80112c2	// 80112c2 <__divdf3+0x86>
 80112be:	6580      	cmphs      	r0, r6
 80112c0:	0c06      	bf      	0x80112cc	// 80112cc <__divdf3+0x90>
 80112c2:	6d08      	or      	r4, r2
 80112c4:	6d4c      	or      	r5, r3
 80112c6:	6400      	cmphs      	r0, r0
 80112c8:	601b      	subc      	r0, r6
 80112ca:	605f      	subc      	r1, r7
 80112cc:	c7e34829 	lsli      	r9, r3, 31
 80112d0:	c4224848 	lsri      	r8, r2, 1
 80112d4:	c423484d 	lsri      	r13, r3, 1
 80112d8:	c5092422 	or      	r2, r9, r8
 80112dc:	e58c1000 	subi      	r12, r12, 1
 80112e0:	6e03      	mov      	r8, r0
 80112e2:	6e47      	mov      	r9, r1
 80112e4:	6cf7      	mov      	r3, r13
 80112e6:	6401      	cmplt      	r0, r0
 80112e8:	6021      	addc      	r0, r8
 80112ea:	6065      	addc      	r1, r9
 80112ec:	e92cffe5 	bnez      	r12, 0x80112b6	// 80112b6 <__divdf3+0x7a>
 80112f0:	e46420ff 	andi      	r3, r4, 255
 80112f4:	eb430080 	cmpnei      	r3, 128
 80112f8:	0c13      	bf      	0x801131e	// 801131e <__divdf3+0xe2>
 80112fa:	b887      	st.w      	r4, (r14, 0x1c)
 80112fc:	b8a8      	st.w      	r5, (r14, 0x20)
 80112fe:	1804      	addi      	r0, r14, 16
 8011300:	e0000160 	bsr      	0x80115c0	// 80115c0 <__pack_d>
 8011304:	140e      	addi      	r14, r14, 56
 8011306:	1496      	pop      	r4-r9, r15
 8011308:	644e      	cmpne      	r3, r1
 801130a:	0bfa      	bt      	0x80112fe	// 80112fe <__divdf3+0xc2>
 801130c:	1011      	lrw      	r0, 0x8013970	// 8011350 <__divdf3+0x114>
 801130e:	07f9      	br      	0x8011300	// 8011300 <__divdf3+0xc4>
 8011310:	3300      	movi      	r3, 0
 8011312:	3400      	movi      	r4, 0
 8011314:	b867      	st.w      	r3, (r14, 0x1c)
 8011316:	b888      	st.w      	r4, (r14, 0x20)
 8011318:	b866      	st.w      	r3, (r14, 0x18)
 801131a:	1804      	addi      	r0, r14, 16
 801131c:	07f2      	br      	0x8011300	// 8011300 <__divdf3+0xc4>
 801131e:	e4642100 	andi      	r3, r4, 256
 8011322:	e923ffec 	bnez      	r3, 0x80112fa	// 80112fa <__divdf3+0xbe>
 8011326:	6c04      	or      	r0, r1
 8011328:	e900ffe9 	bez      	r0, 0x80112fa	// 80112fa <__divdf3+0xbe>
 801132c:	3280      	movi      	r2, 128
 801132e:	3300      	movi      	r3, 0
 8011330:	3100      	movi      	r1, 0
 8011332:	6489      	cmplt      	r2, r2
 8011334:	6091      	addc      	r2, r4
 8011336:	60d5      	addc      	r3, r5
 8011338:	29ff      	subi      	r1, 256
 801133a:	c4222024 	and      	r4, r2, r1
 801133e:	6d4f      	mov      	r5, r3
 8011340:	07dd      	br      	0x80112fa	// 80112fa <__divdf3+0xbe>
 8011342:	3304      	movi      	r3, 4
 8011344:	b864      	st.w      	r3, (r14, 0x10)
 8011346:	1804      	addi      	r0, r14, 16
 8011348:	07dc      	br      	0x8011300	// 8011300 <__divdf3+0xc4>
 801134a:	1809      	addi      	r0, r14, 36
 801134c:	07da      	br      	0x8011300	// 8011300 <__divdf3+0xc4>
 801134e:	0000      	.short	0x0000
 8011350:	08013970 	.long	0x08013970

08011354 <__nedf2>:
 8011354:	14d2      	push      	r4-r5, r15
 8011356:	142e      	subi      	r14, r14, 56
 8011358:	b800      	st.w      	r0, (r14, 0x0)
 801135a:	b821      	st.w      	r1, (r14, 0x4)
 801135c:	6c3b      	mov      	r0, r14
 801135e:	6d47      	mov      	r5, r1
 8011360:	1904      	addi      	r1, r14, 16
 8011362:	b863      	st.w      	r3, (r14, 0xc)
 8011364:	b842      	st.w      	r2, (r14, 0x8)
 8011366:	e00001f5 	bsr      	0x8011750	// 8011750 <__unpack_d>
 801136a:	1802      	addi      	r0, r14, 8
 801136c:	1909      	addi      	r1, r14, 36
 801136e:	e00001f1 	bsr      	0x8011750	// 8011750 <__unpack_d>
 8011372:	9864      	ld.w      	r3, (r14, 0x10)
 8011374:	3001      	movi      	r0, 1
 8011376:	64c0      	cmphs      	r0, r3
 8011378:	0808      	bt      	0x8011388	// 8011388 <__nedf2+0x34>
 801137a:	9869      	ld.w      	r3, (r14, 0x24)
 801137c:	64c0      	cmphs      	r0, r3
 801137e:	0805      	bt      	0x8011388	// 8011388 <__nedf2+0x34>
 8011380:	1909      	addi      	r1, r14, 36
 8011382:	1804      	addi      	r0, r14, 16
 8011384:	e0000258 	bsr      	0x8011834	// 8011834 <__fpcmp_parts_d>
 8011388:	140e      	addi      	r14, r14, 56
 801138a:	1492      	pop      	r4-r5, r15

0801138c <__gtdf2>:
 801138c:	14d2      	push      	r4-r5, r15
 801138e:	142e      	subi      	r14, r14, 56
 8011390:	b800      	st.w      	r0, (r14, 0x0)
 8011392:	b821      	st.w      	r1, (r14, 0x4)
 8011394:	6c3b      	mov      	r0, r14
 8011396:	6d47      	mov      	r5, r1
 8011398:	1904      	addi      	r1, r14, 16
 801139a:	b842      	st.w      	r2, (r14, 0x8)
 801139c:	b863      	st.w      	r3, (r14, 0xc)
 801139e:	e00001d9 	bsr      	0x8011750	// 8011750 <__unpack_d>
 80113a2:	1909      	addi      	r1, r14, 36
 80113a4:	1802      	addi      	r0, r14, 8
 80113a6:	e00001d5 	bsr      	0x8011750	// 8011750 <__unpack_d>
 80113aa:	9844      	ld.w      	r2, (r14, 0x10)
 80113ac:	3301      	movi      	r3, 1
 80113ae:	648c      	cmphs      	r3, r2
 80113b0:	080a      	bt      	0x80113c4	// 80113c4 <__gtdf2+0x38>
 80113b2:	9849      	ld.w      	r2, (r14, 0x24)
 80113b4:	648c      	cmphs      	r3, r2
 80113b6:	0807      	bt      	0x80113c4	// 80113c4 <__gtdf2+0x38>
 80113b8:	1909      	addi      	r1, r14, 36
 80113ba:	1804      	addi      	r0, r14, 16
 80113bc:	e000023c 	bsr      	0x8011834	// 8011834 <__fpcmp_parts_d>
 80113c0:	140e      	addi      	r14, r14, 56
 80113c2:	1492      	pop      	r4-r5, r15
 80113c4:	3000      	movi      	r0, 0
 80113c6:	2800      	subi      	r0, 1
 80113c8:	140e      	addi      	r14, r14, 56
 80113ca:	1492      	pop      	r4-r5, r15

080113cc <__gedf2>:
 80113cc:	14d2      	push      	r4-r5, r15
 80113ce:	142e      	subi      	r14, r14, 56
 80113d0:	b800      	st.w      	r0, (r14, 0x0)
 80113d2:	b821      	st.w      	r1, (r14, 0x4)
 80113d4:	6c3b      	mov      	r0, r14
 80113d6:	6d47      	mov      	r5, r1
 80113d8:	1904      	addi      	r1, r14, 16
 80113da:	b842      	st.w      	r2, (r14, 0x8)
 80113dc:	b863      	st.w      	r3, (r14, 0xc)
 80113de:	e00001b9 	bsr      	0x8011750	// 8011750 <__unpack_d>
 80113e2:	1909      	addi      	r1, r14, 36
 80113e4:	1802      	addi      	r0, r14, 8
 80113e6:	e00001b5 	bsr      	0x8011750	// 8011750 <__unpack_d>
 80113ea:	9844      	ld.w      	r2, (r14, 0x10)
 80113ec:	3301      	movi      	r3, 1
 80113ee:	648c      	cmphs      	r3, r2
 80113f0:	080a      	bt      	0x8011404	// 8011404 <__gedf2+0x38>
 80113f2:	9849      	ld.w      	r2, (r14, 0x24)
 80113f4:	648c      	cmphs      	r3, r2
 80113f6:	0807      	bt      	0x8011404	// 8011404 <__gedf2+0x38>
 80113f8:	1909      	addi      	r1, r14, 36
 80113fa:	1804      	addi      	r0, r14, 16
 80113fc:	e000021c 	bsr      	0x8011834	// 8011834 <__fpcmp_parts_d>
 8011400:	140e      	addi      	r14, r14, 56
 8011402:	1492      	pop      	r4-r5, r15
 8011404:	3000      	movi      	r0, 0
 8011406:	2800      	subi      	r0, 1
 8011408:	140e      	addi      	r14, r14, 56
 801140a:	1492      	pop      	r4-r5, r15

0801140c <__ltdf2>:
 801140c:	14d2      	push      	r4-r5, r15
 801140e:	142e      	subi      	r14, r14, 56
 8011410:	b800      	st.w      	r0, (r14, 0x0)
 8011412:	b821      	st.w      	r1, (r14, 0x4)
 8011414:	6c3b      	mov      	r0, r14
 8011416:	6d47      	mov      	r5, r1
 8011418:	1904      	addi      	r1, r14, 16
 801141a:	b863      	st.w      	r3, (r14, 0xc)
 801141c:	b842      	st.w      	r2, (r14, 0x8)
 801141e:	e0000199 	bsr      	0x8011750	// 8011750 <__unpack_d>
 8011422:	1802      	addi      	r0, r14, 8
 8011424:	1909      	addi      	r1, r14, 36
 8011426:	e0000195 	bsr      	0x8011750	// 8011750 <__unpack_d>
 801142a:	9864      	ld.w      	r3, (r14, 0x10)
 801142c:	3001      	movi      	r0, 1
 801142e:	64c0      	cmphs      	r0, r3
 8011430:	0808      	bt      	0x8011440	// 8011440 <__ltdf2+0x34>
 8011432:	9869      	ld.w      	r3, (r14, 0x24)
 8011434:	64c0      	cmphs      	r0, r3
 8011436:	0805      	bt      	0x8011440	// 8011440 <__ltdf2+0x34>
 8011438:	1909      	addi      	r1, r14, 36
 801143a:	1804      	addi      	r0, r14, 16
 801143c:	e00001fc 	bsr      	0x8011834	// 8011834 <__fpcmp_parts_d>
 8011440:	140e      	addi      	r14, r14, 56
 8011442:	1492      	pop      	r4-r5, r15

08011444 <__floatsidf>:
 8011444:	14d0      	push      	r15
 8011446:	1425      	subi      	r14, r14, 20
 8011448:	3303      	movi      	r3, 3
 801144a:	b860      	st.w      	r3, (r14, 0x0)
 801144c:	487f      	lsri      	r3, r0, 31
 801144e:	b861      	st.w      	r3, (r14, 0x4)
 8011450:	e9200009 	bnez      	r0, 0x8011462	// 8011462 <__floatsidf+0x1e>
 8011454:	3302      	movi      	r3, 2
 8011456:	b860      	st.w      	r3, (r14, 0x0)
 8011458:	6c3b      	mov      	r0, r14
 801145a:	e00000b3 	bsr      	0x80115c0	// 80115c0 <__pack_d>
 801145e:	1405      	addi      	r14, r14, 20
 8011460:	1490      	pop      	r15
 8011462:	e9a00008 	bhsz      	r0, 0x8011472	// 8011472 <__floatsidf+0x2e>
 8011466:	ea238000 	movih      	r3, 32768
 801146a:	64c2      	cmpne      	r0, r3
 801146c:	0c1c      	bf      	0x80114a4	// 80114a4 <__floatsidf+0x60>
 801146e:	3300      	movi      	r3, 0
 8011470:	5b01      	subu      	r0, r3, r0
 8011472:	c4007c42 	ff1      	r2, r0
 8011476:	e422001c 	addi      	r1, r2, 29
 801147a:	ea0c001f 	movi      	r12, 31
 801147e:	2a02      	subi      	r2, 3
 8011480:	4861      	lsri      	r3, r0, 1
 8011482:	6306      	subu      	r12, r1
 8011484:	c440402d 	lsl      	r13, r0, r2
 8011488:	3adf      	btsti      	r2, 31
 801148a:	70f1      	lsr      	r3, r12
 801148c:	c46d0c20 	incf      	r3, r13, 0
 8011490:	7004      	lsl      	r0, r1
 8011492:	b864      	st.w      	r3, (r14, 0x10)
 8011494:	3300      	movi      	r3, 0
 8011496:	c4030c20 	incf      	r0, r3, 0
 801149a:	333c      	movi      	r3, 60
 801149c:	60c6      	subu      	r3, r1
 801149e:	b803      	st.w      	r0, (r14, 0xc)
 80114a0:	b862      	st.w      	r3, (r14, 0x8)
 80114a2:	07db      	br      	0x8011458	// 8011458 <__floatsidf+0x14>
 80114a4:	3000      	movi      	r0, 0
 80114a6:	ea21c1e0 	movih      	r1, 49632
 80114aa:	07da      	br      	0x801145e	// 801145e <__floatsidf+0x1a>

080114ac <__fixdfsi>:
 80114ac:	14d0      	push      	r15
 80114ae:	1427      	subi      	r14, r14, 28
 80114b0:	b800      	st.w      	r0, (r14, 0x0)
 80114b2:	b821      	st.w      	r1, (r14, 0x4)
 80114b4:	6c3b      	mov      	r0, r14
 80114b6:	1902      	addi      	r1, r14, 8
 80114b8:	e000014c 	bsr      	0x8011750	// 8011750 <__unpack_d>
 80114bc:	9862      	ld.w      	r3, (r14, 0x8)
 80114be:	3202      	movi      	r2, 2
 80114c0:	64c8      	cmphs      	r2, r3
 80114c2:	082a      	bt      	0x8011516	// 8011516 <__fixdfsi+0x6a>
 80114c4:	3b44      	cmpnei      	r3, 4
 80114c6:	0c06      	bf      	0x80114d2	// 80114d2 <__fixdfsi+0x26>
 80114c8:	9804      	ld.w      	r0, (r14, 0x10)
 80114ca:	e9800026 	blz      	r0, 0x8011516	// 8011516 <__fixdfsi+0x6a>
 80114ce:	383e      	cmplti      	r0, 31
 80114d0:	080a      	bt      	0x80114e4	// 80114e4 <__fixdfsi+0x38>
 80114d2:	9863      	ld.w      	r3, (r14, 0xc)
 80114d4:	3b40      	cmpnei      	r3, 0
 80114d6:	c4000500 	mvc      	r0
 80114da:	c7c05023 	bmaski      	r3, 31
 80114de:	600c      	addu      	r0, r3
 80114e0:	1407      	addi      	r14, r14, 28
 80114e2:	1490      	pop      	r15
 80114e4:	323c      	movi      	r2, 60
 80114e6:	5a21      	subu      	r1, r2, r0
 80114e8:	e581101f 	subi      	r12, r1, 32
 80114ec:	9866      	ld.w      	r3, (r14, 0x18)
 80114ee:	321f      	movi      	r2, 31
 80114f0:	c5834040 	lsr      	r0, r3, r12
 80114f4:	6086      	subu      	r2, r1
 80114f6:	4361      	lsli      	r3, r3, 1
 80114f8:	70c8      	lsl      	r3, r2
 80114fa:	9845      	ld.w      	r2, (r14, 0x14)
 80114fc:	7085      	lsr      	r2, r1
 80114fe:	6c8c      	or      	r2, r3
 8011500:	9863      	ld.w      	r3, (r14, 0xc)
 8011502:	c7ec2880 	btsti      	r12, 31
 8011506:	c4020c40 	inct      	r0, r2, 0
 801150a:	e903ffeb 	bez      	r3, 0x80114e0	// 80114e0 <__fixdfsi+0x34>
 801150e:	3300      	movi      	r3, 0
 8011510:	5b01      	subu      	r0, r3, r0
 8011512:	1407      	addi      	r14, r14, 28
 8011514:	1490      	pop      	r15
 8011516:	3000      	movi      	r0, 0
 8011518:	1407      	addi      	r14, r14, 28
 801151a:	1490      	pop      	r15

0801151c <__floatunsidf>:
 801151c:	14d1      	push      	r4, r15
 801151e:	1425      	subi      	r14, r14, 20
 8011520:	3100      	movi      	r1, 0
 8011522:	b821      	st.w      	r1, (r14, 0x4)
 8011524:	e9000020 	bez      	r0, 0x8011564	// 8011564 <__floatunsidf+0x48>
 8011528:	c4007c42 	ff1      	r2, r0
 801152c:	e582001c 	addi      	r12, r2, 29
 8011530:	3303      	movi      	r3, 3
 8011532:	ea0d001f 	movi      	r13, 31
 8011536:	2a02      	subi      	r2, 3
 8011538:	b860      	st.w      	r3, (r14, 0x0)
 801153a:	6372      	subu      	r13, r12
 801153c:	4861      	lsri      	r3, r0, 1
 801153e:	c4404024 	lsl      	r4, r0, r2
 8011542:	3adf      	btsti      	r2, 31
 8011544:	70f5      	lsr      	r3, r13
 8011546:	c4640c20 	incf      	r3, r4, 0
 801154a:	7030      	lsl      	r0, r12
 801154c:	c4010c20 	incf      	r0, r1, 0
 8011550:	b864      	st.w      	r3, (r14, 0x10)
 8011552:	333c      	movi      	r3, 60
 8011554:	b803      	st.w      	r0, (r14, 0xc)
 8011556:	60f2      	subu      	r3, r12
 8011558:	6c3b      	mov      	r0, r14
 801155a:	b862      	st.w      	r3, (r14, 0x8)
 801155c:	e0000032 	bsr      	0x80115c0	// 80115c0 <__pack_d>
 8011560:	1405      	addi      	r14, r14, 20
 8011562:	1491      	pop      	r4, r15
 8011564:	3302      	movi      	r3, 2
 8011566:	6c3b      	mov      	r0, r14
 8011568:	b860      	st.w      	r3, (r14, 0x0)
 801156a:	e000002b 	bsr      	0x80115c0	// 80115c0 <__pack_d>
 801156e:	1405      	addi      	r14, r14, 20
 8011570:	1491      	pop      	r4, r15
	...

08011574 <__muldi3>:
 8011574:	14c3      	push      	r4-r6
 8011576:	c602484d 	lsri      	r13, r2, 16
 801157a:	c40055ec 	zext      	r12, r0, 15, 0
 801157e:	4890      	lsri      	r4, r0, 16
 8011580:	c40255e5 	zext      	r5, r2, 15, 0
 8011584:	c4ac8426 	mult      	r6, r12, r5
 8011588:	7d50      	mult      	r5, r4
 801158a:	7f34      	mult      	r12, r13
 801158c:	7d34      	mult      	r4, r13
 801158e:	c4ac002d 	addu      	r13, r12, r5
 8011592:	c606484c 	lsri      	r12, r6, 16
 8011596:	6334      	addu      	r12, r13
 8011598:	6570      	cmphs      	r12, r5
 801159a:	0804      	bt      	0x80115a2	// 80115a2 <__muldi3+0x2e>
 801159c:	ea2d0001 	movih      	r13, 1
 80115a0:	6134      	addu      	r4, r13
 80115a2:	c60c484d 	lsri      	r13, r12, 16
 80115a6:	7cc0      	mult      	r3, r0
 80115a8:	7c48      	mult      	r1, r2
 80115aa:	6134      	addu      	r4, r13
 80115ac:	c60c482c 	lsli      	r12, r12, 16
 80115b0:	c40655e6 	zext      	r6, r6, 15, 0
 80115b4:	604c      	addu      	r1, r3
 80115b6:	c4cc0020 	addu      	r0, r12, r6
 80115ba:	6050      	addu      	r1, r4
 80115bc:	1483      	pop      	r4-r6
	...

080115c0 <__pack_d>:
 80115c0:	14c5      	push      	r4-r8
 80115c2:	9020      	ld.w      	r1, (r0, 0x0)
 80115c4:	3901      	cmphsi      	r1, 2
 80115c6:	9043      	ld.w      	r2, (r0, 0xc)
 80115c8:	9064      	ld.w      	r3, (r0, 0x10)
 80115ca:	d9a02001 	ld.w      	r13, (r0, 0x4)
 80115ce:	0c47      	bf      	0x801165c	// 801165c <__pack_d+0x9c>
 80115d0:	3944      	cmpnei      	r1, 4
 80115d2:	0c40      	bf      	0x8011652	// 8011652 <__pack_d+0x92>
 80115d4:	3942      	cmpnei      	r1, 2
 80115d6:	0c28      	bf      	0x8011626	// 8011626 <__pack_d+0x66>
 80115d8:	c4622421 	or      	r1, r2, r3
 80115dc:	e9010025 	bez      	r1, 0x8011626	// 8011626 <__pack_d+0x66>
 80115e0:	9022      	ld.w      	r1, (r0, 0x8)
 80115e2:	ea0003fd 	movi      	r0, 1021
 80115e6:	6c02      	nor      	r0, r0
 80115e8:	6405      	cmplt      	r1, r0
 80115ea:	0855      	bt      	0x8011694	// 8011694 <__pack_d+0xd4>
 80115ec:	eb2103ff 	cmplti      	r1, 1024
 80115f0:	0c31      	bf      	0x8011652	// 8011652 <__pack_d+0x92>
 80115f2:	e40220ff 	andi      	r0, r2, 255
 80115f6:	eb400080 	cmpnei      	r0, 128
 80115fa:	0c43      	bf      	0x8011680	// 8011680 <__pack_d+0xc0>
 80115fc:	347f      	movi      	r4, 127
 80115fe:	3500      	movi      	r5, 0
 8011600:	6489      	cmplt      	r2, r2
 8011602:	6091      	addc      	r2, r4
 8011604:	60d5      	addc      	r3, r5
 8011606:	c7805020 	bmaski      	r0, 29
 801160a:	64c0      	cmphs      	r0, r3
 801160c:	0c19      	bf      	0x801163e	// 801163e <__pack_d+0x7e>
 801160e:	e58103fe 	addi      	r12, r1, 1023
 8011612:	4b28      	lsri      	r1, r3, 8
 8011614:	4398      	lsli      	r4, r3, 24
 8011616:	4a08      	lsri      	r0, r2, 8
 8011618:	c4015663 	zext      	r3, r1, 19, 0
 801161c:	6c4f      	mov      	r1, r3
 801161e:	6c10      	or      	r0, r4
 8011620:	e46c27ff 	andi      	r3, r12, 2047
 8011624:	0404      	br      	0x801162c	// 801162c <__pack_d+0x6c>
 8011626:	3300      	movi      	r3, 0
 8011628:	3000      	movi      	r0, 0
 801162a:	3100      	movi      	r1, 0
 801162c:	3200      	movi      	r2, 0
 801162e:	c4415e60 	ins      	r2, r1, 19, 0
 8011632:	c4435d54 	ins      	r2, r3, 30, 20
 8011636:	c44d5c1f 	ins      	r2, r13, 31, 31
 801163a:	6c4b      	mov      	r1, r2
 801163c:	1485      	pop      	r4-r8
 801163e:	439f      	lsli      	r4, r3, 31
 8011640:	c422484c 	lsri      	r12, r2, 1
 8011644:	4b01      	lsri      	r0, r3, 1
 8011646:	c5842422 	or      	r2, r4, r12
 801164a:	6cc3      	mov      	r3, r0
 801164c:	e58103ff 	addi      	r12, r1, 1024
 8011650:	07e1      	br      	0x8011612	// 8011612 <__pack_d+0x52>
 8011652:	ea0307ff 	movi      	r3, 2047
 8011656:	3000      	movi      	r0, 0
 8011658:	3100      	movi      	r1, 0
 801165a:	07e9      	br      	0x801162c	// 801162c <__pack_d+0x6c>
 801165c:	c703482c 	lsli      	r12, r3, 24
 8011660:	4a48      	lsri      	r2, r2, 8
 8011662:	c44c2420 	or      	r0, r12, r2
 8011666:	c5035741 	zext      	r1, r3, 26, 8
 801166a:	3200      	movi      	r2, 0
 801166c:	ea230008 	movih      	r3, 8
 8011670:	6c08      	or      	r0, r2
 8011672:	6c4c      	or      	r1, r3
 8011674:	c4015663 	zext      	r3, r1, 19, 0
 8011678:	6c4f      	mov      	r1, r3
 801167a:	ea0307ff 	movi      	r3, 2047
 801167e:	07d7      	br      	0x801162c	// 801162c <__pack_d+0x6c>
 8011680:	e4022100 	andi      	r0, r2, 256
 8011684:	e900ffc1 	bez      	r0, 0x8011606	// 8011606 <__pack_d+0x46>
 8011688:	3480      	movi      	r4, 128
 801168a:	3500      	movi      	r5, 0
 801168c:	6489      	cmplt      	r2, r2
 801168e:	6091      	addc      	r2, r4
 8011690:	60d5      	addc      	r3, r5
 8011692:	07ba      	br      	0x8011606	// 8011606 <__pack_d+0x46>
 8011694:	5825      	subu      	r1, r0, r1
 8011696:	eb210038 	cmplti      	r1, 57
 801169a:	0fc6      	bf      	0x8011626	// 8011626 <__pack_d+0x66>
 801169c:	341f      	movi      	r4, 31
 801169e:	c423482c 	lsli      	r12, r3, 1
 80116a2:	6106      	subu      	r4, r1
 80116a4:	e401101f 	subi      	r0, r1, 32
 80116a8:	7310      	lsl      	r12, r4
 80116aa:	c4224046 	lsr      	r6, r2, r1
 80116ae:	38df      	btsti      	r0, 31
 80116b0:	c4034045 	lsr      	r5, r3, r0
 80116b4:	ea080000 	movi      	r8, 0
 80116b8:	6db0      	or      	r6, r12
 80116ba:	ea0c0001 	movi      	r12, 1
 80116be:	c4c50c20 	incf      	r6, r5, 0
 80116c2:	c40c4020 	lsl      	r0, r12, r0
 80116c6:	6d63      	mov      	r5, r8
 80116c8:	c42c4024 	lsl      	r4, r12, r1
 80116cc:	c4234047 	lsr      	r7, r3, r1
 80116d0:	c4a00c20 	incf      	r5, r0, 0
 80116d4:	c4880c20 	incf      	r4, r8, 0
 80116d8:	c4e80c20 	incf      	r7, r8, 0
 80116dc:	3c40      	cmpnei      	r4, 0
 80116de:	c4a50c81 	decf      	r5, r5, 1
 80116e2:	2c00      	subi      	r4, 1
 80116e4:	6890      	and      	r2, r4
 80116e6:	68d4      	and      	r3, r5
 80116e8:	6c8c      	or      	r2, r3
 80116ea:	3a40      	cmpnei      	r2, 0
 80116ec:	c4000502 	mvc      	r2
 80116f0:	6ce3      	mov      	r3, r8
 80116f2:	6d88      	or      	r6, r2
 80116f4:	6dcc      	or      	r7, r3
 80116f6:	e46620ff 	andi      	r3, r6, 255
 80116fa:	eb430080 	cmpnei      	r3, 128
 80116fe:	0814      	bt      	0x8011726	// 8011726 <__pack_d+0x166>
 8011700:	e4662100 	andi      	r3, r6, 256
 8011704:	e9230023 	bnez      	r3, 0x801174a	// 801174a <__pack_d+0x18a>
 8011708:	4758      	lsli      	r2, r7, 24
 801170a:	4f28      	lsri      	r1, r7, 8
 801170c:	4e08      	lsri      	r0, r6, 8
 801170e:	6c08      	or      	r0, r2
 8011710:	c4015662 	zext      	r2, r1, 19, 0
 8011714:	6c4b      	mov      	r1, r2
 8011716:	c7605022 	bmaski      	r2, 28
 801171a:	65c8      	cmphs      	r2, r7
 801171c:	0c02      	bf      	0x8011720	// 8011720 <__pack_d+0x160>
 801171e:	6f0f      	mov      	r12, r3
 8011720:	e46c2001 	andi      	r3, r12, 1
 8011724:	0784      	br      	0x801162c	// 801162c <__pack_d+0x6c>
 8011726:	327f      	movi      	r2, 127
 8011728:	3300      	movi      	r3, 0
 801172a:	6599      	cmplt      	r6, r6
 801172c:	6189      	addc      	r6, r2
 801172e:	61cd      	addc      	r7, r3
 8011730:	4778      	lsli      	r3, r7, 24
 8011732:	4f28      	lsri      	r1, r7, 8
 8011734:	4e08      	lsri      	r0, r6, 8
 8011736:	6c0c      	or      	r0, r3
 8011738:	c4015663 	zext      	r3, r1, 19, 0
 801173c:	6c4f      	mov      	r1, r3
 801173e:	c7605023 	bmaski      	r3, 28
 8011742:	65cc      	cmphs      	r3, r7
 8011744:	0fee      	bf      	0x8011720	// 8011720 <__pack_d+0x160>
 8011746:	6f23      	mov      	r12, r8
 8011748:	07ec      	br      	0x8011720	// 8011720 <__pack_d+0x160>
 801174a:	3280      	movi      	r2, 128
 801174c:	07ee      	br      	0x8011728	// 8011728 <__pack_d+0x168>
	...

08011750 <__unpack_d>:
 8011750:	1421      	subi      	r14, r14, 4
 8011752:	dd6e2000 	st.w      	r11, (r14, 0x0)
 8011756:	8863      	ld.h      	r3, (r0, 0x6)
 8011758:	8047      	ld.b      	r2, (r0, 0x7)
 801175a:	c48355c3 	zext      	r3, r3, 14, 4
 801175e:	d9802001 	ld.w      	r12, (r0, 0x4)
 8011762:	4a47      	lsri      	r2, r2, 7
 8011764:	d9a02000 	ld.w      	r13, (r0, 0x0)
 8011768:	c40c566c 	zext      	r12, r12, 19, 0
 801176c:	b141      	st.w      	r2, (r1, 0x4)
 801176e:	e9230025 	bnez      	r3, 0x80117b8	// 80117b8 <__unpack_d+0x68>
 8011772:	c58d2423 	or      	r3, r13, r12
 8011776:	e903003c 	bez      	r3, 0x80117ee	// 80117ee <__unpack_d+0x9e>
 801177a:	c70d4840 	lsri      	r0, r13, 24
 801177e:	c50c4823 	lsli      	r3, r12, 8
 8011782:	6cc0      	or      	r3, r0
 8011784:	3003      	movi      	r0, 3
 8011786:	c50d4822 	lsli      	r2, r13, 8
 801178a:	b100      	st.w      	r0, (r1, 0x0)
 801178c:	c760502d 	bmaski      	r13, 28
 8011790:	ea0003fe 	movi      	r0, 1022
 8011794:	6c02      	nor      	r0, r0
 8011796:	6ecb      	mov      	r11, r2
 8011798:	6f0f      	mov      	r12, r3
 801179a:	6489      	cmplt      	r2, r2
 801179c:	60ad      	addc      	r2, r11
 801179e:	60f1      	addc      	r3, r12
 80117a0:	64f4      	cmphs      	r13, r3
 80117a2:	6f03      	mov      	r12, r0
 80117a4:	2800      	subi      	r0, 1
 80117a6:	0bf8      	bt      	0x8011796	// 8011796 <__unpack_d+0x46>
 80117a8:	dd812002 	st.w      	r12, (r1, 0x8)
 80117ac:	b143      	st.w      	r2, (r1, 0xc)
 80117ae:	b164      	st.w      	r3, (r1, 0x10)
 80117b0:	d96e2000 	ld.w      	r11, (r14, 0x0)
 80117b4:	1401      	addi      	r14, r14, 4
 80117b6:	783c      	jmp      	r15
 80117b8:	eb4307ff 	cmpnei      	r3, 2047
 80117bc:	0c1f      	bf      	0x80117fa	// 80117fa <__unpack_d+0xaa>
 80117be:	e46313fe 	subi      	r3, r3, 1023
 80117c2:	b162      	st.w      	r3, (r1, 0x8)
 80117c4:	3303      	movi      	r3, 3
 80117c6:	c70d4840 	lsri      	r0, r13, 24
 80117ca:	b160      	st.w      	r3, (r1, 0x0)
 80117cc:	c50c4823 	lsli      	r3, r12, 8
 80117d0:	c50d4822 	lsli      	r2, r13, 8
 80117d4:	6cc0      	or      	r3, r0
 80117d6:	ea0c0000 	movi      	r12, 0
 80117da:	ea2d1000 	movih      	r13, 4096
 80117de:	6cb0      	or      	r2, r12
 80117e0:	6cf4      	or      	r3, r13
 80117e2:	b143      	st.w      	r2, (r1, 0xc)
 80117e4:	b164      	st.w      	r3, (r1, 0x10)
 80117e6:	d96e2000 	ld.w      	r11, (r14, 0x0)
 80117ea:	1401      	addi      	r14, r14, 4
 80117ec:	783c      	jmp      	r15
 80117ee:	3302      	movi      	r3, 2
 80117f0:	b160      	st.w      	r3, (r1, 0x0)
 80117f2:	d96e2000 	ld.w      	r11, (r14, 0x0)
 80117f6:	1401      	addi      	r14, r14, 4
 80117f8:	783c      	jmp      	r15
 80117fa:	c58d2423 	or      	r3, r13, r12
 80117fe:	e9030018 	bez      	r3, 0x801182e	// 801182e <__unpack_d+0xde>
 8011802:	ea230008 	movih      	r3, 8
 8011806:	68f0      	and      	r3, r12
 8011808:	3b40      	cmpnei      	r3, 0
 801180a:	3201      	movi      	r2, 1
 801180c:	c4620c40 	inct      	r3, r2, 0
 8011810:	b160      	st.w      	r3, (r1, 0x0)
 8011812:	c50c482c 	lsli      	r12, r12, 8
 8011816:	c70d4843 	lsri      	r3, r13, 24
 801181a:	6f0c      	or      	r12, r3
 801181c:	c50d482d 	lsli      	r13, r13, 8
 8011820:	c76c282c 	bclri      	r12, r12, 27
 8011824:	dda12003 	st.w      	r13, (r1, 0xc)
 8011828:	dd812004 	st.w      	r12, (r1, 0x10)
 801182c:	07dd      	br      	0x80117e6	// 80117e6 <__unpack_d+0x96>
 801182e:	3304      	movi      	r3, 4
 8011830:	b160      	st.w      	r3, (r1, 0x0)
 8011832:	07da      	br      	0x80117e6	// 80117e6 <__unpack_d+0x96>

08011834 <__fpcmp_parts_d>:
 8011834:	9040      	ld.w      	r2, (r0, 0x0)
 8011836:	3301      	movi      	r3, 1
 8011838:	648c      	cmphs      	r3, r2
 801183a:	0830      	bt      	0x801189a	// 801189a <__fpcmp_parts_d+0x66>
 801183c:	d9812000 	ld.w      	r12, (r1, 0x0)
 8011840:	670c      	cmphs      	r3, r12
 8011842:	082c      	bt      	0x801189a	// 801189a <__fpcmp_parts_d+0x66>
 8011844:	3a44      	cmpnei      	r2, 4
 8011846:	0c1f      	bf      	0x8011884	// 8011884 <__fpcmp_parts_d+0x50>
 8011848:	eb4c0004 	cmpnei      	r12, 4
 801184c:	0c14      	bf      	0x8011874	// 8011874 <__fpcmp_parts_d+0x40>
 801184e:	3a42      	cmpnei      	r2, 2
 8011850:	0c0f      	bf      	0x801186e	// 801186e <__fpcmp_parts_d+0x3a>
 8011852:	eb4c0002 	cmpnei      	r12, 2
 8011856:	0c1a      	bf      	0x801188a	// 801188a <__fpcmp_parts_d+0x56>
 8011858:	9041      	ld.w      	r2, (r0, 0x4)
 801185a:	d9812001 	ld.w      	r12, (r1, 0x4)
 801185e:	670a      	cmpne      	r2, r12
 8011860:	0c1f      	bf      	0x801189e	// 801189e <__fpcmp_parts_d+0x6a>
 8011862:	3000      	movi      	r0, 0
 8011864:	2800      	subi      	r0, 1
 8011866:	3a40      	cmpnei      	r2, 0
 8011868:	c4030c20 	incf      	r0, r3, 0
 801186c:	783c      	jmp      	r15
 801186e:	eb4c0002 	cmpnei      	r12, 2
 8011872:	0c2a      	bf      	0x80118c6	// 80118c6 <__fpcmp_parts_d+0x92>
 8011874:	9141      	ld.w      	r2, (r1, 0x4)
 8011876:	3300      	movi      	r3, 0
 8011878:	2b00      	subi      	r3, 1
 801187a:	3a40      	cmpnei      	r2, 0
 801187c:	3001      	movi      	r0, 1
 801187e:	c4030c20 	incf      	r0, r3, 0
 8011882:	783c      	jmp      	r15
 8011884:	eb4c0004 	cmpnei      	r12, 4
 8011888:	0c21      	bf      	0x80118ca	// 80118ca <__fpcmp_parts_d+0x96>
 801188a:	9061      	ld.w      	r3, (r0, 0x4)
 801188c:	3000      	movi      	r0, 0
 801188e:	3b40      	cmpnei      	r3, 0
 8011890:	2800      	subi      	r0, 1
 8011892:	3301      	movi      	r3, 1
 8011894:	c4030c20 	incf      	r0, r3, 0
 8011898:	783c      	jmp      	r15
 801189a:	6c0f      	mov      	r0, r3
 801189c:	783c      	jmp      	r15
 801189e:	d9a02002 	ld.w      	r13, (r0, 0x8)
 80118a2:	d9812002 	ld.w      	r12, (r1, 0x8)
 80118a6:	6771      	cmplt      	r12, r13
 80118a8:	0bdd      	bt      	0x8011862	// 8011862 <__fpcmp_parts_d+0x2e>
 80118aa:	6735      	cmplt      	r13, r12
 80118ac:	0c13      	bf      	0x80118d2	// 80118d2 <__fpcmp_parts_d+0x9e>
 80118ae:	3000      	movi      	r0, 0
 80118b0:	2800      	subi      	r0, 1
 80118b2:	3a40      	cmpnei      	r2, 0
 80118b4:	c4030c40 	inct      	r0, r3, 0
 80118b8:	07da      	br      	0x801186c	// 801186c <__fpcmp_parts_d+0x38>
 80118ba:	644c      	cmphs      	r3, r1
 80118bc:	0fdd      	bf      	0x8011876	// 8011876 <__fpcmp_parts_d+0x42>
 80118be:	64c6      	cmpne      	r1, r3
 80118c0:	0803      	bt      	0x80118c6	// 80118c6 <__fpcmp_parts_d+0x92>
 80118c2:	6430      	cmphs      	r12, r0
 80118c4:	0fd9      	bf      	0x8011876	// 8011876 <__fpcmp_parts_d+0x42>
 80118c6:	3000      	movi      	r0, 0
 80118c8:	07d2      	br      	0x801186c	// 801186c <__fpcmp_parts_d+0x38>
 80118ca:	9161      	ld.w      	r3, (r1, 0x4)
 80118cc:	9001      	ld.w      	r0, (r0, 0x4)
 80118ce:	5b01      	subu      	r0, r3, r0
 80118d0:	07ce      	br      	0x801186c	// 801186c <__fpcmp_parts_d+0x38>
 80118d2:	9064      	ld.w      	r3, (r0, 0x10)
 80118d4:	d9802003 	ld.w      	r12, (r0, 0xc)
 80118d8:	9103      	ld.w      	r0, (r1, 0xc)
 80118da:	9124      	ld.w      	r1, (r1, 0x10)
 80118dc:	64c4      	cmphs      	r1, r3
 80118de:	0c05      	bf      	0x80118e8	// 80118e8 <__fpcmp_parts_d+0xb4>
 80118e0:	644e      	cmpne      	r3, r1
 80118e2:	0bec      	bt      	0x80118ba	// 80118ba <__fpcmp_parts_d+0x86>
 80118e4:	6700      	cmphs      	r0, r12
 80118e6:	0bea      	bt      	0x80118ba	// 80118ba <__fpcmp_parts_d+0x86>
 80118e8:	3000      	movi      	r0, 0
 80118ea:	2800      	subi      	r0, 1
 80118ec:	3a40      	cmpnei      	r2, 0
 80118ee:	3301      	movi      	r3, 1
 80118f0:	c4030c20 	incf      	r0, r3, 0
 80118f4:	07bc      	br      	0x801186c	// 801186c <__fpcmp_parts_d+0x38>
	...

080118f8 <__GI_putchar>:
 80118f8:	14d0      	push      	r15
 80118fa:	1063      	lrw      	r3, 0x20000120	// 8011904 <__GI_putchar+0xc>
 80118fc:	9320      	ld.w      	r1, (r3, 0x0)
 80118fe:	e000003f 	bsr      	0x801197c	// 801197c <__GI_putc>
 8011902:	1490      	pop      	r15
 8011904:	20000120 	.long	0x20000120

08011908 <__GI_puts>:
 8011908:	14d1      	push      	r4, r15
 801190a:	1085      	lrw      	r4, 0x20000120	// 801191c <__GI_puts+0x14>
 801190c:	9420      	ld.w      	r1, (r4, 0x0)
 801190e:	e0000009 	bsr      	0x8011920	// 8011920 <__GI_fputs>
 8011912:	9420      	ld.w      	r1, (r4, 0x0)
 8011914:	300a      	movi      	r0, 10
 8011916:	e0000fb7 	bsr      	0x8013884	// 8013884 <fputc>
 801191a:	1491      	pop      	r4, r15
 801191c:	20000120 	.long	0x20000120

08011920 <__GI_fputs>:
 8011920:	14d5      	push      	r4-r8, r15
 8011922:	6d03      	mov      	r4, r0
 8011924:	6d87      	mov      	r6, r1
 8011926:	e9010018 	bez      	r1, 0x8011956	// 8011956 <__GI_fputs+0x36>
 801192a:	e5010017 	addi      	r8, r1, 24
 801192e:	6c23      	mov      	r0, r8
 8011930:	e0000020 	bsr      	0x8011970	// 8011970 <__GI_os_critical_enter>
 8011934:	8400      	ld.b      	r0, (r4, 0x0)
 8011936:	e9000014 	bez      	r0, 0x801195e	// 801195e <__GI_fputs+0x3e>
 801193a:	3500      	movi      	r5, 0
 801193c:	6dd7      	mov      	r7, r5
 801193e:	2f00      	subi      	r7, 1
 8011940:	0406      	br      	0x801194c	// 801194c <__GI_fputs+0x2c>
 8011942:	2400      	addi      	r4, 1
 8011944:	8400      	ld.b      	r0, (r4, 0x0)
 8011946:	2500      	addi      	r5, 1
 8011948:	e900000c 	bez      	r0, 0x8011960	// 8011960 <__GI_fputs+0x40>
 801194c:	6c5b      	mov      	r1, r6
 801194e:	e0000f9b 	bsr      	0x8013884	// 8013884 <fputc>
 8011952:	65c2      	cmpne      	r0, r7
 8011954:	0bf7      	bt      	0x8011942	// 8011942 <__GI_fputs+0x22>
 8011956:	3500      	movi      	r5, 0
 8011958:	2d00      	subi      	r5, 1
 801195a:	6c17      	mov      	r0, r5
 801195c:	1495      	pop      	r4-r8, r15
 801195e:	6d43      	mov      	r5, r0
 8011960:	6c23      	mov      	r0, r8
 8011962:	e0000009 	bsr      	0x8011974	// 8011974 <__GI_os_critical_exit>
 8011966:	6c17      	mov      	r0, r5
 8011968:	1495      	pop      	r4-r8, r15
	...

0801196c <__GI_os_critical_open>:
 801196c:	3000      	movi      	r0, 0
 801196e:	783c      	jmp      	r15

08011970 <__GI_os_critical_enter>:
 8011970:	3000      	movi      	r0, 0
 8011972:	783c      	jmp      	r15

08011974 <__GI_os_critical_exit>:
 8011974:	3000      	movi      	r0, 0
 8011976:	783c      	jmp      	r15

08011978 <__GI_os_critical_close>:
 8011978:	3000      	movi      	r0, 0
 801197a:	783c      	jmp      	r15

0801197c <__GI_putc>:
 801197c:	14d0      	push      	r15
 801197e:	e0000f83 	bsr      	0x8013884	// 8013884 <fputc>
 8011982:	1490      	pop      	r15

08011984 <SystemClock_Get>:
 */
void SystemClock_Get(wm_sys_clk *sysclk)
{
	clk_div_reg clk_div;

	clk_div.w = READ_REG(RCC->CLK_DIV);
 8011984:	ea234000 	movih      	r3, 16384
 8011988:	e4630dff 	addi      	r3, r3, 3584
	sysclk->cpuclk = W805_PLL_CLK_MHZ/(clk_div.b.CPU);
 801198c:	ea0101e0 	movi      	r1, 480
	clk_div.w = READ_REG(RCC->CLK_DIV);
 8011990:	9344      	ld.w      	r2, (r3, 0x10)
	sysclk->cpuclk = W805_PLL_CLK_MHZ/(clk_div.b.CPU);
 8011992:	74c8      	zextb      	r3, r2
 8011994:	c4618043 	divs      	r3, r1, r3
	sysclk->wlanclk = W805_PLL_CLK_MHZ/(clk_div.b.WLAN);
 8011998:	c50255ec 	zext      	r12, r2, 15, 8
	sysclk->apbclk = sysclk->cpuclk / clk_div.b.BUS2;
 801199c:	c60256e2 	zext      	r2, r2, 23, 16
	sysclk->cpuclk = W805_PLL_CLK_MHZ/(clk_div.b.CPU);
 80119a0:	b061      	st.w      	r3, (r0, 0x4)
	sysclk->wlanclk = W805_PLL_CLK_MHZ/(clk_div.b.WLAN);
 80119a2:	c5818041 	divs      	r1, r1, r12
	sysclk->apbclk = sysclk->cpuclk / clk_div.b.BUS2;
 80119a6:	c4438023 	divu      	r3, r3, r2
	sysclk->wlanclk = W805_PLL_CLK_MHZ/(clk_div.b.WLAN);
 80119aa:	b022      	st.w      	r1, (r0, 0x8)
	sysclk->apbclk = sysclk->cpuclk / clk_div.b.BUS2;
 80119ac:	b060      	st.w      	r3, (r0, 0x0)
}
 80119ae:	783c      	jmp      	r15

080119b0 <HAL_InitTick>:
	clk_div.w = READ_REG(RCC->CLK_DIV);
 80119b0:	ea234000 	movih      	r3, 16384
 80119b4:	e4630dff 	addi      	r3, r3, 3584


__attribute__((weak)) HAL_StatusTypeDef HAL_InitTick(uint32_t TickPriority)
{
 80119b8:	6f03      	mov      	r12, r0
	clk_div.w = READ_REG(RCC->CLK_DIV);
 80119ba:	9364      	ld.w      	r3, (r3, 0x10)
	sysclk->cpuclk = W805_PLL_CLK_MHZ/(clk_div.b.CPU);
 80119bc:	748c      	zextb      	r2, r3
 80119be:	ea0301e0 	movi      	r3, 480
 80119c2:	c4438043 	divs      	r3, r3, r2
	wm_sys_clk sysclk;
	
	SystemClock_Get(&sysclk);
	SysTick_Config(sysclk.cpuclk * UNIT_MHZ / uwTickFreq);
 80119c6:	ea02f424 	movi      	r2, 62500
 80119ca:	c4824902 	rotli      	r2, r2, 4
 80119ce:	7cc8      	mult      	r3, r2
 80119d0:	ea0203e8 	movi      	r2, 1000
 80119d4:	c4438023 	divu      	r3, r3, r2
{
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
        return (1UL);                                                   /* Reload value impossible */
    }

    CORET->LOAD = (uint32_t)(ticks - 1UL);                              /* set reload register */
 80119d8:	104f      	lrw      	r2, 0xe000e010	// 8011a14 <HAL_InitTick+0x64>
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
 80119da:	2b00      	subi      	r3, 1
    CORET->LOAD = (uint32_t)(ticks - 1UL);                              /* set reload register */
 80119dc:	b261      	st.w      	r3, (r2, 0x4)
	clk_div.w = READ_REG(RCC->CLK_DIV);
 80119de:	3000      	movi      	r0, 0
    CORET->VAL  = 0UL;                                                  /* Load the CORET Counter Value */
    CORET->CTRL = CORET_CTRL_CLKSOURCE_Msk |
 80119e0:	3307      	movi      	r3, 7
    CORET->VAL  = 0UL;                                                  /* Load the CORET Counter Value */
 80119e2:	b202      	st.w      	r0, (r2, 0x8)
    CORET->CTRL = CORET_CTRL_CLKSOURCE_Msk |
 80119e4:	b260      	st.w      	r3, (r2, 0x0)
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 80119e6:	104d      	lrw      	r2, 0xe000e100	// 8011a18 <HAL_InitTick+0x68>
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 80119e8:	c5cc4823 	lsli      	r3, r12, 14
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 80119ec:	d82220c6 	ld.w      	r1, (r2, 0x318)
 80119f0:	ea0dff00 	movi      	r13, 65280
 80119f4:	6f76      	nor      	r13, r13
 80119f6:	6874      	and      	r1, r13
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 80119f8:	c40355e3 	zext      	r3, r3, 15, 0
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 80119fc:	6cc4      	or      	r3, r1
 80119fe:	dc6220c6 	st.w      	r3, (r2, 0x318)
    VIC->ISER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011a02:	ea230200 	movih      	r3, 512
 8011a06:	b260      	st.w      	r3, (r2, 0x0)
    VIC->ISSR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011a08:	dc622050 	st.w      	r3, (r2, 0x140)
	HAL_NVIC_SetPriority(SYS_TICK_IRQn, TickPriority);
	HAL_NVIC_EnableIRQ(SYS_TICK_IRQn);
	uwTickPrio = TickPriority;
 8011a0c:	1064      	lrw      	r3, 0x20001864	// 8011a1c <HAL_InitTick+0x6c>
 8011a0e:	dd832000 	st.w      	r12, (r3, 0x0)
	return HAL_OK;
}
 8011a12:	783c      	jmp      	r15
 8011a14:	e000e010 	.long	0xe000e010
 8011a18:	e000e100 	.long	0xe000e100
 8011a1c:	20001864 	.long	0x20001864

08011a20 <SystemClock_Config>:
{
 8011a20:	14d0      	push      	r15
	if ((clk < 2) || (clk > 240))
 8011a22:	5867      	subi      	r3, r0, 2
 8011a24:	eb0300ee 	cmphsi      	r3, 239
 8011a28:	0826      	bt      	0x8011a74	// 8011a74 <SystemClock_Config+0x54>
    RegValue = READ_REG(RCC->CLK_EN);
 8011a2a:	ea224000 	movih      	r2, 16384
 8011a2e:	e4420dff 	addi      	r2, r2, 3584
    RegValue &= ~0x3FFFFF;
 8011a32:	ea21ffc0 	movih      	r1, 65472
    RegValue = READ_REG(RCC->CLK_EN);
 8011a36:	9260      	ld.w      	r3, (r2, 0x0)
    RegValue &= ~0x3FFFFF;
 8011a38:	68c4      	and      	r3, r1
    RegValue |= 0x802;
 8011a3a:	ec630802 	ori      	r3, r3, 2050
    WRITE_REG(RCC->CLK_EN, RegValue);
 8011a3e:	b260      	st.w      	r3, (r2, 0x0)
	WRITE_REG(RCC->BBP_CLK, 0x0F);
 8011a40:	330f      	movi      	r3, 15
 8011a42:	b262      	st.w      	r3, (r2, 0x8)
	RegValue = READ_REG(RCC->CLK_DIV);
 8011a44:	9264      	ld.w      	r3, (r2, 0x10)
	RegValue &= 0xFF000000;
 8011a46:	ea22ff00 	movih      	r2, 65280
 8011a4a:	68c8      	and      	r3, r2
	if(cpuDiv > 12)
 8011a4c:	320c      	movi      	r2, 12
 8011a4e:	6408      	cmphs      	r2, r0
	RegValue |= 0x80000000;
 8011a50:	3bbf      	bseti      	r3, 31
	if(cpuDiv > 12)
 8011a52:	0c12      	bf      	0x8011a76	// 8011a76 <SystemClock_Config+0x56>
		bus2Fac = (wlanDiv*4/cpuDiv)&0xFF;
 8011a54:	c4028022 	divu      	r2, r2, r0
 8011a58:	4250      	lsli      	r2, r2, 16
 8011a5a:	ea010300 	movi      	r1, 768
 8011a5e:	6c0c      	or      	r0, r3
 8011a60:	6c08      	or      	r0, r2
	WRITE_REG(RCC->CLK_DIV, RegValue);
 8011a62:	ea234000 	movih      	r3, 16384
 8011a66:	e4630dff 	addi      	r3, r3, 3584
	RegValue |= (bus2Fac<<16) | (wlanDiv<<8) | cpuDiv;
 8011a6a:	6c04      	or      	r0, r1
	WRITE_REG(RCC->CLK_DIV, RegValue);
 8011a6c:	b304      	st.w      	r0, (r3, 0x10)
	HAL_InitTick(TICK_INT_PRIORITY);
 8011a6e:	3007      	movi      	r0, 7
 8011a70:	e3ffffa0 	bsr      	0x80119b0	// 80119b0 <HAL_InitTick>
}
 8011a74:	1490      	pop      	r15
		wlanDiv = cpuDiv/4;
 8011a76:	4822      	lsri      	r1, r0, 2
 8011a78:	4128      	lsli      	r1, r1, 8
 8011a7a:	ea220001 	movih      	r2, 1
 8011a7e:	07f0      	br      	0x8011a5e	// 8011a5e <SystemClock_Config+0x3e>

08011a80 <HAL_IncTick>:

__attribute__((weak)) void HAL_IncTick(void)
{
	uwTick += 1;
 8011a80:	1043      	lrw      	r2, 0x20001860	// 8011a8c <HAL_IncTick+0xc>
 8011a82:	9260      	ld.w      	r3, (r2, 0x0)
 8011a84:	2300      	addi      	r3, 1
 8011a86:	b260      	st.w      	r3, (r2, 0x0)
}
 8011a88:	783c      	jmp      	r15
 8011a8a:	0000      	.short	0x0000
 8011a8c:	20001860 	.long	0x20001860

08011a90 <HAL_GetTick>:

__attribute__((weak)) uint32_t HAL_GetTick(void)
{
	return uwTick;
 8011a90:	1062      	lrw      	r3, 0x20001860	// 8011a98 <HAL_GetTick+0x8>
 8011a92:	9300      	ld.w      	r0, (r3, 0x0)
}
 8011a94:	783c      	jmp      	r15
 8011a96:	0000      	.short	0x0000
 8011a98:	20001860 	.long	0x20001860

08011a9c <HAL_Delay>:

__attribute__((weak)) void HAL_Delay(uint32_t Delay)
{
 8011a9c:	14d2      	push      	r4-r5, r15
 8011a9e:	6d43      	mov      	r5, r0
	uint32_t tickstart = HAL_GetTick();
 8011aa0:	e3fffff8 	bsr      	0x8011a90	// 8011a90 <HAL_GetTick>
 8011aa4:	6d03      	mov      	r4, r0
	uint32_t wait = Delay;

	while ((HAL_GetTick() - tickstart) < wait)
 8011aa6:	e3fffff5 	bsr      	0x8011a90	// 8011a90 <HAL_GetTick>
 8011aaa:	6012      	subu      	r0, r4
 8011aac:	6540      	cmphs      	r0, r5
 8011aae:	0ffc      	bf      	0x8011aa6	// 8011aa6 <HAL_Delay+0xa>
	{
	}
}
 8011ab0:	1492      	pop      	r4-r5, r15
	...

08011ab4 <HAL_NVIC_SetPriority>:

/* Priority: a value between 0 and 15
 * A lower priority value indicates a higher priority */
void HAL_NVIC_SetPriority(IRQn_Type IRQn, uint32_t Priority)
{   
 8011ab4:	c4002822 	bclri      	r2, r0, 0
 8011ab8:	3a81      	bclri      	r2, 1
 8011aba:	106b      	lrw      	r3, 0xe000e100	// 8011ae4 <HAL_NVIC_SetPriority+0x30>
 8011abc:	608c      	addu      	r2, r3
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011abe:	e4002003 	andi      	r0, r0, 3
 8011ac2:	4003      	lsli      	r0, r0, 3
 8011ac4:	33ff      	movi      	r3, 255
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011ac6:	4126      	lsli      	r1, r1, 6
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011ac8:	d98220c0 	ld.w      	r12, (r2, 0x300)
 8011acc:	70c0      	lsl      	r3, r0
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011ace:	e42120ff 	andi      	r1, r1, 255
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011ad2:	c46c2043 	andn      	r3, r12, r3
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011ad6:	c4014020 	lsl      	r0, r1, r0
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011ada:	6cc0      	or      	r3, r0
 8011adc:	dc6220c0 	st.w      	r3, (r2, 0x300)
	NVIC_SetPriority(IRQn, Priority);
}
 8011ae0:	783c      	jmp      	r15
 8011ae2:	0000      	.short	0x0000
 8011ae4:	e000e100 	.long	0xe000e100

08011ae8 <HAL_NVIC_EnableIRQ>:
    VIC->ISER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011ae8:	e440201f 	andi      	r2, r0, 31
 8011aec:	3301      	movi      	r3, 1
 8011aee:	c4a054c0 	zext      	r0, r0, 6, 5
 8011af2:	70c8      	lsl      	r3, r2
 8011af4:	4002      	lsli      	r0, r0, 2
 8011af6:	1044      	lrw      	r2, 0xe000e100	// 8011b04 <HAL_NVIC_EnableIRQ+0x1c>
 8011af8:	6008      	addu      	r0, r2
 8011afa:	b060      	st.w      	r3, (r0, 0x0)
    VIC->ISSR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011afc:	dc602050 	st.w      	r3, (r0, 0x140)
	/* Check the parameters */
	assert_param(IS_NVIC_DEVICE_IRQ(IRQn));

	/* Enable interrupt */
	NVIC_EnableIRQ(IRQn);
}
 8011b00:	783c      	jmp      	r15
 8011b02:	0000      	.short	0x0000
 8011b04:	e000e100 	.long	0xe000e100

08011b08 <HAL_ADC_Start.part.0>:
HAL_StatusTypeDef HAL_ADC_Start(ADC_HandleTypeDef* hadc)
{
	assert_param(IS_ADC_ALL_INSTANCE(hadc->Instance));
	
	__HAL_LOCK(hadc);
	MODIFY_REG(hadc->Instance->ANA_CR, ADC_ANA_CR_CH, hadc->Init.channel);
 8011b08:	9060      	ld.w      	r3, (r0, 0x0)
 8011b0a:	ea020f00 	movi      	r2, 3840
 8011b0e:	6c8a      	nor      	r2, r2
 8011b10:	9321      	ld.w      	r1, (r3, 0x4)
 8011b12:	d9802001 	ld.w      	r12, (r0, 0x4)
 8011b16:	6848      	and      	r1, r2
 8011b18:	6c70      	or      	r1, r12
	__HAL_ADC_CLEAR_FLAG(hadc, ADC_IF_ADC | ADC_IF_CMP);
 8011b1a:	3203      	movi      	r2, 3
	MODIFY_REG(hadc->Instance->ANA_CR, ADC_ANA_CR_CH, hadc->Init.channel);
 8011b1c:	b321      	st.w      	r1, (r3, 0x4)
	__HAL_ADC_CLEAR_FLAG(hadc, ADC_IF_ADC | ADC_IF_CMP);
 8011b1e:	b345      	st.w      	r2, (r3, 0x14)
	__HAL_ADC_ENABLE(hadc);
 8011b20:	9341      	ld.w      	r2, (r3, 0x4)
 8011b22:	ea010f07 	movi      	r1, 3847
 8011b26:	6c46      	nor      	r1, r1
 8011b28:	6884      	and      	r2, r1
 8011b2a:	ed8c0003 	ori      	r12, r12, 3
 8011b2e:	6cb0      	or      	r2, r12
 8011b30:	b341      	st.w      	r2, (r3, 0x4)
	__HAL_UNLOCK(hadc);
 8011b32:	3300      	movi      	r3, 0
 8011b34:	b065      	st.w      	r3, (r0, 0x14)
	
	return HAL_OK;
}
 8011b36:	6c0f      	mov      	r0, r3
 8011b38:	783c      	jmp      	r15
	...

08011b3c <HAL_ADC_Init>:
{
 8011b3c:	14d1      	push      	r4, r15
 8011b3e:	1423      	subi      	r14, r14, 12
 8011b40:	6d03      	mov      	r4, r0
	if (hadc == NULL)
 8011b42:	e9000064 	bez      	r0, 0x8011c0a	// 8011c0a <HAL_ADC_Init+0xce>
	hadc->Lock = HAL_UNLOCKED;
 8011b46:	3300      	movi      	r3, 0
 8011b48:	b065      	st.w      	r3, (r0, 0x14)
	HAL_ADC_MspInit(hadc);
 8011b4a:	e0000181 	bsr      	0x8011e4c	// 8011e4c <HAL_ADC_MspInit>
	SystemClock_Get(&sysclk);
 8011b4e:	6c3b      	mov      	r0, r14
 8011b50:	e3ffff1a 	bsr      	0x8011984	// 8011984 <SystemClock_Get>
	div = sysclk.apbclk * 1000000 / (hadc->Init.freq) / 512;
 8011b54:	9860      	ld.w      	r3, (r14, 0x0)
 8011b56:	ea00f424 	movi      	r0, 62500
 8011b5a:	c4804900 	rotli      	r0, r0, 4
 8011b5e:	7cc0      	mult      	r3, r0
 8011b60:	9402      	ld.w      	r0, (r4, 0x8)
	MODIFY_REG(RCC->CLK_SEL, RCC_CLK_SEL_ADC_DIV, ((div & 0xFF) << RCC_CLK_SEL_ADC_DIV_Pos));
 8011b62:	ea224000 	movih      	r2, 16384
 8011b66:	e4420dff 	addi      	r2, r2, 3584
	div = sysclk.apbclk * 1000000 / (hadc->Init.freq) / 512;
 8011b6a:	c4038023 	divu      	r3, r3, r0
	MODIFY_REG(RCC->CLK_SEL, RCC_CLK_SEL_ADC_DIV, ((div & 0xFF) << RCC_CLK_SEL_ADC_DIV_Pos));
 8011b6e:	4b61      	lsri      	r3, r3, 1
 8011b70:	ea00ff00 	movi      	r0, 65280
 8011b74:	9225      	ld.w      	r1, (r2, 0x14)
 8011b76:	68c0      	and      	r3, r0
 8011b78:	ea00ff00 	movi      	r0, 65280
 8011b7c:	6c02      	nor      	r0, r0
 8011b7e:	6840      	and      	r1, r0
 8011b80:	6cc4      	or      	r3, r1
 8011b82:	b265      	st.w      	r3, (r2, 0x14)
	SET_BIT(RCC->CLK_DIV, RCC_CLK_DIV_FREQ_EN);
 8011b84:	9264      	ld.w      	r3, (r2, 0x10)
 8011b86:	3bbf      	bseti      	r3, 31
 8011b88:	b264      	st.w      	r3, (r2, 0x10)
	MODIFY_REG(hadc->Instance->ADC_CR, ADC_ADC_CR_DMAEN | ADC_ADC_CR_SWITCHTIME | ADC_ADC_CR_INITTIME, 
 8011b8a:	9440      	ld.w      	r2, (r4, 0x0)
 8011b8c:	1121      	lrw      	r1, 0xc00c00fc	// 8011c10 <HAL_ADC_Init+0xd4>
 8011b8e:	9264      	ld.w      	r3, (r2, 0x10)
 8011b90:	68c4      	and      	r3, r1
 8011b92:	1121      	lrw      	r1, 0x5005002	// 8011c14 <HAL_ADC_Init+0xd8>
 8011b94:	6cc4      	or      	r3, r1
 8011b96:	b264      	st.w      	r3, (r2, 0x10)
	MODIFY_REG(hadc->Instance->PGA_CR, ADC_PGA_CR_BPREF | ADC_PGA_CR_GAIN | ADC_PGA_CR_BP, ADC_PGA_CR_CHOPEN | ADC_PGA_CR_PGAEN);
 8011b98:	9262      	ld.w      	r3, (r2, 0x8)
 8011b9a:	ea0101ff 	movi      	r1, 511
 8011b9e:	6c46      	nor      	r1, r1
 8011ba0:	68c4      	and      	r3, r1
 8011ba2:	ec630003 	ori      	r3, r3, 3
 8011ba6:	b262      	st.w      	r3, (r2, 0x8)
	MODIFY_REG(hadc->Instance->ANA_CR, ADC_ANA_CR_CH | ADC_ANA_CR_PD, ADC_ANA_CR_RST | ADC_ANA_CR_LDOEN | ADC_ANA_CR_CH_OFFSET);
 8011ba8:	9261      	ld.w      	r3, (r2, 0x4)
 8011baa:	ea010f07 	movi      	r1, 3847
 8011bae:	6c46      	nor      	r1, r1
 8011bb0:	68c4      	and      	r3, r1
 8011bb2:	ec630e03 	ori      	r3, r3, 3587
 8011bb6:	b261      	st.w      	r3, (r2, 0x4)
 8011bb8:	3104      	movi      	r1, 4
	while (1)
	{
		if (HAL_IS_BIT_SET(hadc->Instance->IF, ADC_IF_ADC))
		{
			count++;
			__HAL_ADC_CLEAR_FLAG(hadc, ADC_IF_ADC);
 8011bba:	3001      	movi      	r0, 1
		if (HAL_IS_BIT_SET(hadc->Instance->IF, ADC_IF_ADC))
 8011bbc:	9265      	ld.w      	r3, (r2, 0x14)
 8011bbe:	e4632001 	andi      	r3, r3, 1
 8011bc2:	e903fffd 	bez      	r3, 0x8011bbc	// 8011bbc <HAL_ADC_Init+0x80>
 8011bc6:	2900      	subi      	r1, 1
			__HAL_ADC_CLEAR_FLAG(hadc, ADC_IF_ADC);
 8011bc8:	b205      	st.w      	r0, (r2, 0x14)
			if(count == 4)
 8011bca:	e921fff9 	bnez      	r1, 0x8011bbc	// 8011bbc <HAL_ADC_Init+0x80>
	value = ADC->DR;
 8011bce:	ea234001 	movih      	r3, 16385
 8011bd2:	3ba9      	bseti      	r3, 9
	if (value & 0x20000)
 8011bd4:	ea210002 	movih      	r1, 2
	value = ADC->DR;
 8011bd8:	9360      	ld.w      	r3, (r3, 0x0)
	if (value & 0x20000)
 8011bda:	684c      	and      	r1, r3
 8011bdc:	e9210012 	bnez      	r1, 0x8011c00	// 8011c00 <HAL_ADC_Init+0xc4>
	value = value & 0x3FFFC;
 8011be0:	c6205021 	bmaski      	r1, 18
 8011be4:	2902      	subi      	r1, 3
 8011be6:	68c4      	and      	r3, r1
		value |= 0x20000;
 8011be8:	3bb1      	bseti      	r3, 17
	__HAL_ADC_DISABLE(hadc);
 8011bea:	3100      	movi      	r1, 0
	hadc->offset = _Get_Result();
 8011bec:	b466      	st.w      	r3, (r4, 0x18)
	__HAL_ADC_DISABLE(hadc);
 8011bee:	2907      	subi      	r1, 8
 8011bf0:	9261      	ld.w      	r3, (r2, 0x4)
 8011bf2:	68c4      	and      	r3, r1
 8011bf4:	ec630004 	ori      	r3, r3, 4
	return HAL_OK;
 8011bf8:	3000      	movi      	r0, 0
	__HAL_ADC_DISABLE(hadc);
 8011bfa:	b261      	st.w      	r3, (r2, 0x4)
}
 8011bfc:	1403      	addi      	r14, r14, 12
 8011bfe:	1491      	pop      	r4, r15
		value &= 0x1FFFF;
 8011c00:	c6005021 	bmaski      	r1, 17
 8011c04:	2902      	subi      	r1, 3
 8011c06:	68c4      	and      	r3, r1
 8011c08:	07f1      	br      	0x8011bea	// 8011bea <HAL_ADC_Init+0xae>
		return HAL_ERROR;
 8011c0a:	3001      	movi      	r0, 1
}
 8011c0c:	1403      	addi      	r14, r14, 12
 8011c0e:	1491      	pop      	r4, r15
 8011c10:	c00c00fc 	.long	0xc00c00fc
 8011c14:	05005002 	.long	0x05005002

08011c18 <HAL_ADC_GET_INPUT_VOLTAGE>:
	
	return value;
}

int HAL_ADC_GET_INPUT_VOLTAGE(ADC_HandleTypeDef* hadc)
{
 8011c18:	14d1      	push      	r4, r15
	__HAL_LOCK(hadc);
 8011c1a:	d9802005 	ld.w      	r12, (r0, 0x14)
 8011c1e:	eb4c0001 	cmpnei      	r12, 1
{
 8011c22:	6d03      	mov      	r4, r0
	__HAL_LOCK(hadc);
 8011c24:	0c05      	bf      	0x8011c2e	// 8011c2e <HAL_ADC_GET_INPUT_VOLTAGE+0x16>
 8011c26:	e3ffff71 	bsr      	0x8011b08	// 8011b08 <HAL_ADC_Start.part.0>
 8011c2a:	d9842005 	ld.w      	r12, (r4, 0x14)
 8011c2e:	9440      	ld.w      	r2, (r4, 0x0)
{
 8011c30:	3104      	movi      	r1, 4
			__HAL_ADC_CLEAR_FLAG(hadc, ADC_IF_ADC);
 8011c32:	3001      	movi      	r0, 1
		if (HAL_IS_BIT_SET(hadc->Instance->IF, ADC_IF_ADC))
 8011c34:	9265      	ld.w      	r3, (r2, 0x14)
 8011c36:	e4632001 	andi      	r3, r3, 1
 8011c3a:	e903fffd 	bez      	r3, 0x8011c34	// 8011c34 <HAL_ADC_GET_INPUT_VOLTAGE+0x1c>
 8011c3e:	2900      	subi      	r1, 1
			__HAL_ADC_CLEAR_FLAG(hadc, ADC_IF_ADC);
 8011c40:	b205      	st.w      	r0, (r2, 0x14)
			if(count == 4)
 8011c42:	e921fff9 	bnez      	r1, 0x8011c34	// 8011c34 <HAL_ADC_GET_INPUT_VOLTAGE+0x1c>
	__HAL_LOCK(hadc);
 8011c46:	eb4c0001 	cmpnei      	r12, 1
 8011c4a:	0c09      	bf      	0x8011c5c	// 8011c5c <HAL_ADC_GET_INPUT_VOLTAGE+0x44>
	__HAL_ADC_DISABLE(hadc);
 8011c4c:	3000      	movi      	r0, 0
 8011c4e:	9261      	ld.w      	r3, (r2, 0x4)
 8011c50:	2807      	subi      	r0, 8
 8011c52:	68c0      	and      	r3, r0
 8011c54:	ec630004 	ori      	r3, r3, 4
 8011c58:	b261      	st.w      	r3, (r2, 0x4)
	__HAL_UNLOCK(hadc);
 8011c5a:	b425      	st.w      	r1, (r4, 0x14)
	value = ADC->DR;
 8011c5c:	ea234001 	movih      	r3, 16385
 8011c60:	3ba9      	bseti      	r3, 9
	if (value & 0x20000)
 8011c62:	ea220002 	movih      	r2, 2
	value = ADC->DR;
 8011c66:	9360      	ld.w      	r3, (r3, 0x0)
	if (value & 0x20000)
 8011c68:	688c      	and      	r2, r3
 8011c6a:	e9220025 	bnez      	r2, 0x8011cb4	// 8011cb4 <HAL_ADC_GET_INPUT_VOLTAGE+0x9c>
	value = value & 0x3FFFC;
 8011c6e:	c6205022 	bmaski      	r2, 18
 8011c72:	2a02      	subi      	r2, 3
 8011c74:	68c8      	and      	r3, r2
		value |= 0x20000;
 8011c76:	3bb1      	bseti      	r3, 17
	value = _Get_Result() - hadc->offset;
 8011c78:	9406      	ld.w      	r0, (r4, 0x18)
	
	HAL_ADC_Start(hadc);
	HAL_ADC_PollForConversion(hadc);
	HAL_ADC_Stop(hadc);
	value = HAL_ADC_GetValue(hadc);
	voltage = (double)value / 4.0 * (126363 / 1000.0) / 1000000 + 1.196;
 8011c7a:	5b01      	subu      	r0, r3, r0
 8011c7c:	e3fffbe4 	bsr      	0x8011444	// 8011444 <__floatsidf>
 8011c80:	3200      	movi      	r2, 0
 8011c82:	ea233fd0 	movih      	r3, 16336
 8011c86:	e3fff9db 	bsr      	0x801103c	// 801103c <__muldf3>
 8011c8a:	104e      	lrw      	r2, 0x645a1cac	// 8011cc0 <HAL_ADC_GET_INPUT_VOLTAGE+0xa8>
 8011c8c:	106e      	lrw      	r3, 0x405f973b	// 8011cc4 <HAL_ADC_GET_INPUT_VOLTAGE+0xac>
 8011c8e:	e3fff9d7 	bsr      	0x801103c	// 801103c <__muldf3>
 8011c92:	3200      	movi      	r2, 0
 8011c94:	106d      	lrw      	r3, 0x412e8480	// 8011cc8 <HAL_ADC_GET_INPUT_VOLTAGE+0xb0>
 8011c96:	e3fffad3 	bsr      	0x801123c	// 801123c <__divdf3>
 8011c9a:	104d      	lrw      	r2, 0xe5604189	// 8011ccc <HAL_ADC_GET_INPUT_VOLTAGE+0xb4>
 8011c9c:	106d      	lrw      	r3, 0x3ff322d0	// 8011cd0 <HAL_ADC_GET_INPUT_VOLTAGE+0xb8>
 8011c9e:	e3fff999 	bsr      	0x8010fd0	// 8010fd0 <__adddf3>
	
	value = (int)(voltage * 1000);
 8011ca2:	3200      	movi      	r2, 0
 8011ca4:	ea23408f 	movih      	r3, 16527
 8011ca8:	3bae      	bseti      	r3, 14
 8011caa:	e3fff9c9 	bsr      	0x801103c	// 801103c <__muldf3>
 8011cae:	e3fffbff 	bsr      	0x80114ac	// 80114ac <__fixdfsi>
	return value;
}
 8011cb2:	1491      	pop      	r4, r15
		value &= 0x1FFFF;
 8011cb4:	c6005022 	bmaski      	r2, 17
 8011cb8:	2a02      	subi      	r2, 3
 8011cba:	68c8      	and      	r3, r2
 8011cbc:	07de      	br      	0x8011c78	// 8011c78 <HAL_ADC_GET_INPUT_VOLTAGE+0x60>
 8011cbe:	0000      	.short	0x0000
 8011cc0:	645a1cac 	.long	0x645a1cac
 8011cc4:	405f973b 	.long	0x405f973b
 8011cc8:	412e8480 	.long	0x412e8480
 8011ccc:	e5604189 	.long	0xe5604189
 8011cd0:	3ff322d0 	.long	0x3ff322d0

08011cd4 <HAL_ADC_CompareCallback>:
}

__attribute__((weak)) void HAL_ADC_CompareCallback(ADC_HandleTypeDef* hadc)
{
	UNUSED(hadc);
}
 8011cd4:	783c      	jmp      	r15
	...

08011cd8 <HAL_ADC_IRQHandler>:

void HAL_ADC_IRQHandler(ADC_HandleTypeDef* hadc)
{
 8011cd8:	14d1      	push      	r4, r15
	assert_param(IS_ADC_ALL_INSTANCE(hadc->Instance));
	
	if (__HAL_ADC_GET_IT_SOURCE(hadc, ADC_ADC_CR_ADCIE))
 8011cda:	9060      	ld.w      	r3, (r0, 0x0)
{
 8011cdc:	6d03      	mov      	r4, r0
	if (__HAL_ADC_GET_IT_SOURCE(hadc, ADC_ADC_CR_ADCIE))
 8011cde:	9344      	ld.w      	r2, (r3, 0x10)
 8011ce0:	e4422002 	andi      	r2, r2, 2
 8011ce4:	e9020007 	bez      	r2, 0x8011cf2	// 8011cf2 <HAL_ADC_IRQHandler+0x1a>
	{
		if (__HAL_ADC_GET_FLAG(hadc, ADC_IF_ADC))
 8011ce8:	9345      	ld.w      	r2, (r3, 0x14)
 8011cea:	e4422001 	andi      	r2, r2, 1
 8011cee:	e9220013 	bnez      	r2, 0x8011d14	// 8011d14 <HAL_ADC_IRQHandler+0x3c>
		{
			__HAL_ADC_CLEAR_FLAG(hadc, ADC_IF_ADC);
			HAL_ADC_ConvCpltCallback(hadc);
		}
	}
	if (__HAL_ADC_GET_IT_SOURCE(hadc, ADC_ADC_CR_CMPIE))
 8011cf2:	9344      	ld.w      	r2, (r3, 0x10)
 8011cf4:	e4422020 	andi      	r2, r2, 32
 8011cf8:	e9020007 	bez      	r2, 0x8011d06	// 8011d06 <HAL_ADC_IRQHandler+0x2e>
	{
		if (__HAL_ADC_GET_FLAG(hadc, ADC_IF_CMP))
 8011cfc:	9345      	ld.w      	r2, (r3, 0x14)
 8011cfe:	e4422002 	andi      	r2, r2, 2
 8011d02:	e9220003 	bnez      	r2, 0x8011d08	// 8011d08 <HAL_ADC_IRQHandler+0x30>
		{
			__HAL_ADC_CLEAR_FLAG(hadc, ADC_IF_CMP);
			HAL_ADC_CompareCallback(hadc);
		}
	}
}
 8011d06:	1491      	pop      	r4, r15
			__HAL_ADC_CLEAR_FLAG(hadc, ADC_IF_CMP);
 8011d08:	3202      	movi      	r2, 2
 8011d0a:	b345      	st.w      	r2, (r3, 0x14)
			HAL_ADC_CompareCallback(hadc);
 8011d0c:	6c13      	mov      	r0, r4
 8011d0e:	e3ffffe3 	bsr      	0x8011cd4	// 8011cd4 <HAL_ADC_CompareCallback>
}
 8011d12:	1491      	pop      	r4, r15
			__HAL_ADC_CLEAR_FLAG(hadc, ADC_IF_ADC);
 8011d14:	3201      	movi      	r2, 1
 8011d16:	b345      	st.w      	r2, (r3, 0x14)
			HAL_ADC_ConvCpltCallback(hadc);
 8011d18:	e0000098 	bsr      	0x8011e48	// 8011e48 <HAL_ADC_ConvCpltCallback>
 8011d1c:	9460      	ld.w      	r3, (r4, 0x0)
 8011d1e:	07ea      	br      	0x8011cf2	// 8011cf2 <HAL_ADC_IRQHandler+0x1a>

08011d20 <ADC_Init.constprop.0>:
		printf("\n");
		HAL_Delay(1000);
	}
}

static void ADC_Init(uint32_t adc_num, uint32_t freq)
 8011d20:	14d0      	push      	r15
	#define ADC_CHANNEL_OFFSET	ADC_ANA_CR_CH_OFFSET
*/

	uint32_t ADC_CHANNEL;
	 /* 307hz ~ 2khz */
	switch(adc_num)
 8011d22:	3805      	cmphsi      	r0, 6
 8011d24:	0808      	bt      	0x8011d34	// 8011d34 <ADC_Init.constprop.0+0x14>
 8011d26:	1063      	lrw      	r3, 0x8013a84	// 8011d30 <ADC_Init.constprop.0+0x10>
 8011d28:	d0030883 	ldr.w      	r3, (r3, r0 << 2)
 8011d2c:	780c      	jmp      	r3
 8011d2e:	0000      	.short	0x0000
 8011d30:	08013a84 	.long	0x08013a84
		case 1: ADC_CHANNEL = ADC_CHANNEL_1; break;		//PA4
		case 2: ADC_CHANNEL = ADC_CHANNEL_2; break;		//PA3
		case 3: ADC_CHANNEL = ADC_CHANNEL_3; break;		//PA2
		case 4: ADC_CHANNEL = ADC_CHANNEL_TEMP; break;
		case 5: ADC_CHANNEL = ADC_CHANNEL_VOL; break;
		default : printf("adc init ADC_CHANNEL err, The number of channels is not between 0 and 3 \r\n");return; break;
 8011d34:	1013      	lrw      	r0, 0x8013a9c	// 8011d80 <ADC_Init.constprop.0+0x60>
 8011d36:	e3fffde9 	bsr      	0x8011908	// 8011908 <__GI_puts>
	
	if (HAL_ADC_Init(&hadc[adc_num]) != HAL_OK)
	{
		Error_Handler();
	}
}
 8011d3a:	1490      	pop      	r15
		case 4: ADC_CHANNEL = ADC_CHANNEL_TEMP; break;
 8011d3c:	ea020c00 	movi      	r2, 3072
	hadc[adc_num].Instance = ADC;
 8011d40:	1071      	lrw      	r3, 0x20001868	// 8011d84 <ADC_Init.constprop.0+0x64>
 8011d42:	311c      	movi      	r1, 28
 8011d44:	7c04      	mult      	r0, r1
 8011d46:	ea214001 	movih      	r1, 16385
 8011d4a:	39a9      	bseti      	r1, 9
 8011d4c:	d4030821 	str.w      	r1, (r3, r0 << 0)
	hadc[adc_num].Init.channel = ADC_CHANNEL;
 8011d50:	600c      	addu      	r0, r3
	hadc[adc_num].Init.freq = freq;
 8011d52:	ea0303e8 	movi      	r3, 1000
	hadc[adc_num].Init.channel = ADC_CHANNEL;
 8011d56:	b041      	st.w      	r2, (r0, 0x4)
	hadc[adc_num].Init.freq = freq;
 8011d58:	b062      	st.w      	r3, (r0, 0x8)
	if (HAL_ADC_Init(&hadc[adc_num]) != HAL_OK)
 8011d5a:	e3fffef1 	bsr      	0x8011b3c	// 8011b3c <HAL_ADC_Init>
 8011d5e:	e900ffee 	bez      	r0, 0x8011d3a	// 8011d3a <ADC_Init.constprop.0+0x1a>
 8011d62:	0400      	br      	0x8011d62	// 8011d62 <ADC_Init.constprop.0+0x42>
		case 3: ADC_CHANNEL = ADC_CHANNEL_3; break;		//PA2
 8011d64:	ea020300 	movi      	r2, 768
 8011d68:	07ec      	br      	0x8011d40	// 8011d40 <ADC_Init.constprop.0+0x20>
		case 2: ADC_CHANNEL = ADC_CHANNEL_2; break;		//PA3
 8011d6a:	ea020200 	movi      	r2, 512
 8011d6e:	07e9      	br      	0x8011d40	// 8011d40 <ADC_Init.constprop.0+0x20>
		case 1: ADC_CHANNEL = ADC_CHANNEL_1; break;		//PA4
 8011d70:	ea020100 	movi      	r2, 256
 8011d74:	07e6      	br      	0x8011d40	// 8011d40 <ADC_Init.constprop.0+0x20>
		case 0: ADC_CHANNEL = ADC_CHANNEL_0; break; 	//PA1
 8011d76:	6c83      	mov      	r2, r0
 8011d78:	07e4      	br      	0x8011d40	// 8011d40 <ADC_Init.constprop.0+0x20>
		case 5: ADC_CHANNEL = ADC_CHANNEL_VOL; break;
 8011d7a:	ea020d00 	movi      	r2, 3328
 8011d7e:	07e1      	br      	0x8011d40	// 8011d40 <ADC_Init.constprop.0+0x20>
 8011d80:	08013a9c 	.long	0x08013a9c
 8011d84:	20001868 	.long	0x20001868

08011d88 <main>:
{
 8011d88:	14d7      	push      	r4-r10, r15
 8011d8a:	1426      	subi      	r14, r14, 24
	int value[6] = {0};
 8011d8c:	3400      	movi      	r4, 0
	SystemClock_Config(CPU_CLK_160M);
 8011d8e:	3003      	movi      	r0, 3
	int value[6] = {0};
 8011d90:	b880      	st.w      	r4, (r14, 0x0)
 8011d92:	b881      	st.w      	r4, (r14, 0x4)
 8011d94:	b882      	st.w      	r4, (r14, 0x8)
 8011d96:	b883      	st.w      	r4, (r14, 0xc)
 8011d98:	b884      	st.w      	r4, (r14, 0x10)
 8011d9a:	b885      	st.w      	r4, (r14, 0x14)
	SystemClock_Config(CPU_CLK_160M);
 8011d9c:	e3fffe42 	bsr      	0x8011a20	// 8011a20 <SystemClock_Config>
	printf("enter main\r\n");
 8011da0:	1105      	lrw      	r0, 0x8013ae8	// 8011e34 <main+0xac>
 8011da2:	e3fffdb3 	bsr      	0x8011908	// 8011908 <__GI_puts>
	ADC_Init(ADC_1,1000);
 8011da6:	6c13      	mov      	r0, r4
 8011da8:	e3ffffbc 	bsr      	0x8011d20	// 8011d20 <ADC_Init.constprop.0>
	ADC_Init(ADC_2,1000);
 8011dac:	3001      	movi      	r0, 1
 8011dae:	e3ffffb9 	bsr      	0x8011d20	// 8011d20 <ADC_Init.constprop.0>
	ADC_Init(ADC_3,1000);
 8011db2:	3002      	movi      	r0, 2
 8011db4:	e3ffffb6 	bsr      	0x8011d20	// 8011d20 <ADC_Init.constprop.0>
	ADC_Init(ADC_4,1000);
 8011db8:	3003      	movi      	r0, 3
 8011dba:	e3ffffb3 	bsr      	0x8011d20	// 8011d20 <ADC_Init.constprop.0>
	ADC_Init(ADC_TEMP,1000);
 8011dbe:	3004      	movi      	r0, 4
		value[0] = HAL_ADC_GET_INPUT_VOLTAGE(&hadc[ADC_1]);
 8011dc0:	10de      	lrw      	r6, 0x20001868	// 8011e38 <main+0xb0>
	ADC_Init(ADC_TEMP,1000);
 8011dc2:	e3ffffaf 	bsr      	0x8011d20	// 8011d20 <ADC_Init.constprop.0>
	ADC_Init(ADC_VOL,1000);
 8011dc6:	3005      	movi      	r0, 5
 8011dc8:	e3ffffac 	bsr      	0x8011d20	// 8011d20 <ADC_Init.constprop.0>
		value[1] = HAL_ADC_GET_INPUT_VOLTAGE(&hadc[ADC_2]);
 8011dcc:	e526001b 	addi      	r9, r6, 28
		value[2] = HAL_ADC_GET_INPUT_VOLTAGE(&hadc[ADC_3]);
 8011dd0:	e5060037 	addi      	r8, r6, 56
		value[3] = HAL_ADC_GET_INPUT_VOLTAGE(&hadc[ADC_4]);
 8011dd4:	e4e60053 	addi      	r7, r6, 84
			printf("value%d: = %d ",i,value[i]);
 8011dd8:	10b9      	lrw      	r5, 0x8013af4	// 8011e3c <main+0xb4>
		value[0] = HAL_ADC_GET_INPUT_VOLTAGE(&hadc[ADC_1]);
 8011dda:	6c1b      	mov      	r0, r6
 8011ddc:	e3ffff1e 	bsr      	0x8011c18	// 8011c18 <HAL_ADC_GET_INPUT_VOLTAGE>
 8011de0:	b800      	st.w      	r0, (r14, 0x0)
 8011de2:	6e83      	mov      	r10, r0
		value[1] = HAL_ADC_GET_INPUT_VOLTAGE(&hadc[ADC_2]);
 8011de4:	6c27      	mov      	r0, r9
 8011de6:	e3ffff19 	bsr      	0x8011c18	// 8011c18 <HAL_ADC_GET_INPUT_VOLTAGE>
 8011dea:	b801      	st.w      	r0, (r14, 0x4)
		value[2] = HAL_ADC_GET_INPUT_VOLTAGE(&hadc[ADC_3]);
 8011dec:	6c23      	mov      	r0, r8
 8011dee:	e3ffff15 	bsr      	0x8011c18	// 8011c18 <HAL_ADC_GET_INPUT_VOLTAGE>
 8011df2:	b802      	st.w      	r0, (r14, 0x8)
		value[3] = HAL_ADC_GET_INPUT_VOLTAGE(&hadc[ADC_4]);
 8011df4:	6c1f      	mov      	r0, r7
 8011df6:	e3ffff11 	bsr      	0x8011c18	// 8011c18 <HAL_ADC_GET_INPUT_VOLTAGE>
 8011dfa:	b803      	st.w      	r0, (r14, 0xc)
		value[4] = HAL_ADC_GET_INPUT_VOLTAGE(&hadc[ADC_TEMP]);
 8011dfc:	1011      	lrw      	r0, 0x200018d8	// 8011e40 <main+0xb8>
 8011dfe:	e3ffff0d 	bsr      	0x8011c18	// 8011c18 <HAL_ADC_GET_INPUT_VOLTAGE>
 8011e02:	b804      	st.w      	r0, (r14, 0x10)
		value[5] = HAL_ADC_GET_INPUT_VOLTAGE(&hadc[ADC_VOL]);
 8011e04:	1010      	lrw      	r0, 0x200018f4	// 8011e44 <main+0xbc>
 8011e06:	e3ffff09 	bsr      	0x8011c18	// 8011c18 <HAL_ADC_GET_INPUT_VOLTAGE>
 8011e0a:	b805      	st.w      	r0, (r14, 0x14)
		for(int i=0;i<6;i++)
 8011e0c:	3400      	movi      	r4, 0
 8011e0e:	6cab      	mov      	r2, r10
 8011e10:	0403      	br      	0x8011e16	// 8011e16 <main+0x8e>
 8011e12:	d08e0882 	ldr.w      	r2, (r14, r4 << 2)
			printf("value%d: = %d ",i,value[i]);
 8011e16:	6c53      	mov      	r1, r4
 8011e18:	6c17      	mov      	r0, r5
		for(int i=0;i<6;i++)
 8011e1a:	2400      	addi      	r4, 1
			printf("value%d: = %d ",i,value[i]);
 8011e1c:	e0000d42 	bsr      	0x80138a0	// 80138a0 <wm_printf>
		for(int i=0;i<6;i++)
 8011e20:	3c46      	cmpnei      	r4, 6
 8011e22:	0bf8      	bt      	0x8011e12	// 8011e12 <main+0x8a>
		printf("\n");
 8011e24:	300a      	movi      	r0, 10
 8011e26:	e3fffd69 	bsr      	0x80118f8	// 80118f8 <__GI_putchar>
		HAL_Delay(1000);
 8011e2a:	ea0003e8 	movi      	r0, 1000
 8011e2e:	e3fffe37 	bsr      	0x8011a9c	// 8011a9c <HAL_Delay>
		value[0] = HAL_ADC_GET_INPUT_VOLTAGE(&hadc[ADC_1]);
 8011e32:	07d4      	br      	0x8011dda	// 8011dda <main+0x52>
 8011e34:	08013ae8 	.long	0x08013ae8
 8011e38:	20001868 	.long	0x20001868
 8011e3c:	08013af4 	.long	0x08013af4
 8011e40:	200018d8 	.long	0x200018d8
 8011e44:	200018f4 	.long	0x200018f4

08011e48 <HAL_ADC_ConvCpltCallback>:


void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc)
{
	
}
 8011e48:	783c      	jmp      	r15
	...

08011e4c <HAL_ADC_MspInit>:
{

}

void HAL_ADC_MspInit(ADC_HandleTypeDef* hadc)
{
 8011e4c:	14d0      	push      	r15
	if (hadc->Instance == ADC)
 8011e4e:	9040      	ld.w      	r2, (r0, 0x0)
 8011e50:	ea234001 	movih      	r3, 16385
 8011e54:	3ba9      	bseti      	r3, 9
 8011e56:	64ca      	cmpne      	r2, r3
 8011e58:	0c02      	bf      	0x8011e5c	// 8011e5c <HAL_ADC_MspInit+0x10>
		
		// 如果用到中断方式需要使能中断
		HAL_NVIC_SetPriority(ADC_IRQn, 0);
		HAL_NVIC_EnableIRQ(ADC_IRQn);
	}
}
 8011e5a:	1490      	pop      	r15
		__HAL_RCC_ADC_CLK_ENABLE();
 8011e5c:	ea234000 	movih      	r3, 16384
 8011e60:	e4630dff 	addi      	r3, r3, 3584
 8011e64:	9340      	ld.w      	r2, (r3, 0x0)
 8011e66:	ec421000 	ori      	r2, r2, 4096
 8011e6a:	b340      	st.w      	r2, (r3, 0x0)
		__HAL_RCC_GPIO_CLK_ENABLE();
 8011e6c:	9340      	ld.w      	r2, (r3, 0x0)
 8011e6e:	ec420800 	ori      	r2, r2, 2048
 8011e72:	b340      	st.w      	r2, (r3, 0x0)
		if (hadc->Init.channel == ADC_CHANNEL_0)
 8011e74:	9061      	ld.w      	r3, (r0, 0x4)
 8011e76:	e903002d 	bez      	r3, 0x8011ed0	// 8011ed0 <HAL_ADC_MspInit+0x84>
		else if (hadc->Init.channel == ADC_CHANNEL_1)
 8011e7a:	eb430100 	cmpnei      	r3, 256
 8011e7e:	0c41      	bf      	0x8011f00	// 8011f00 <HAL_ADC_MspInit+0xb4>
		else if (hadc->Init.channel == ADC_CHANNEL_2)
 8011e80:	eb430200 	cmpnei      	r3, 512
 8011e84:	0c4d      	bf      	0x8011f1e	// 8011f1e <HAL_ADC_MspInit+0xd2>
		else if (hadc->Init.channel == ADC_CHANNEL_3)
 8011e86:	eb430300 	cmpnei      	r3, 768
 8011e8a:	0c39      	bf      	0x8011efc	// 8011efc <HAL_ADC_MspInit+0xb0>
		else if (hadc->Init.channel == ADC_CHANNEL_0_1)
 8011e8c:	eb430800 	cmpnei      	r3, 2048
 8011e90:	0c56      	bf      	0x8011f3c	// 8011f3c <HAL_ADC_MspInit+0xf0>
		else if (hadc->Init.channel == ADC_CHANNEL_2_3)
 8011e92:	eb430900 	cmpnei      	r3, 2304
 8011e96:	082b      	bt      	0x8011eec	// 8011eec <HAL_ADC_MspInit+0xa0>
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_3);
 8011e98:	1171      	lrw      	r3, 0x40011200	// 8011f5c <HAL_ADC_MspInit+0x110>
 8011e9a:	9344      	ld.w      	r2, (r3, 0x10)
 8011e9c:	3a83      	bclri      	r2, 3
 8011e9e:	b344      	st.w      	r2, (r3, 0x10)
 8011ea0:	9342      	ld.w      	r2, (r3, 0x8)
 8011ea2:	3a83      	bclri      	r2, 3
 8011ea4:	b342      	st.w      	r2, (r3, 0x8)
 8011ea6:	9343      	ld.w      	r2, (r3, 0xc)
 8011ea8:	ec420008 	ori      	r2, r2, 8
 8011eac:	b343      	st.w      	r2, (r3, 0xc)
 8011eae:	9347      	ld.w      	r2, (r3, 0x1c)
 8011eb0:	3a83      	bclri      	r2, 3
 8011eb2:	b347      	st.w      	r2, (r3, 0x1c)
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_2);
 8011eb4:	9344      	ld.w      	r2, (r3, 0x10)
 8011eb6:	3a82      	bclri      	r2, 2
 8011eb8:	b344      	st.w      	r2, (r3, 0x10)
 8011eba:	9342      	ld.w      	r2, (r3, 0x8)
 8011ebc:	3a82      	bclri      	r2, 2
 8011ebe:	b342      	st.w      	r2, (r3, 0x8)
 8011ec0:	9343      	ld.w      	r2, (r3, 0xc)
 8011ec2:	ec420004 	ori      	r2, r2, 4
 8011ec6:	b343      	st.w      	r2, (r3, 0xc)
 8011ec8:	9347      	ld.w      	r2, (r3, 0x1c)
 8011eca:	3a82      	bclri      	r2, 2
 8011ecc:	b347      	st.w      	r2, (r3, 0x1c)
 8011ece:	040f      	br      	0x8011eec	// 8011eec <HAL_ADC_MspInit+0xa0>
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_1);
 8011ed0:	1163      	lrw      	r3, 0x40011200	// 8011f5c <HAL_ADC_MspInit+0x110>
 8011ed2:	9344      	ld.w      	r2, (r3, 0x10)
 8011ed4:	3a81      	bclri      	r2, 1
 8011ed6:	b344      	st.w      	r2, (r3, 0x10)
 8011ed8:	9342      	ld.w      	r2, (r3, 0x8)
 8011eda:	3a81      	bclri      	r2, 1
 8011edc:	b342      	st.w      	r2, (r3, 0x8)
 8011ede:	9343      	ld.w      	r2, (r3, 0xc)
 8011ee0:	ec420002 	ori      	r2, r2, 2
 8011ee4:	b343      	st.w      	r2, (r3, 0xc)
 8011ee6:	9347      	ld.w      	r2, (r3, 0x1c)
 8011ee8:	3a81      	bclri      	r2, 1
 8011eea:	b347      	st.w      	r2, (r3, 0x1c)
		HAL_NVIC_SetPriority(ADC_IRQn, 0);
 8011eec:	3100      	movi      	r1, 0
 8011eee:	300b      	movi      	r0, 11
 8011ef0:	e3fffde2 	bsr      	0x8011ab4	// 8011ab4 <HAL_NVIC_SetPriority>
		HAL_NVIC_EnableIRQ(ADC_IRQn);
 8011ef4:	300b      	movi      	r0, 11
 8011ef6:	e3fffdf9 	bsr      	0x8011ae8	// 8011ae8 <HAL_NVIC_EnableIRQ>
}
 8011efa:	1490      	pop      	r15
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_2);
 8011efc:	1078      	lrw      	r3, 0x40011200	// 8011f5c <HAL_ADC_MspInit+0x110>
 8011efe:	07db      	br      	0x8011eb4	// 8011eb4 <HAL_ADC_MspInit+0x68>
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_4);
 8011f00:	1077      	lrw      	r3, 0x40011200	// 8011f5c <HAL_ADC_MspInit+0x110>
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_4);
 8011f02:	9344      	ld.w      	r2, (r3, 0x10)
 8011f04:	3a84      	bclri      	r2, 4
 8011f06:	b344      	st.w      	r2, (r3, 0x10)
 8011f08:	9342      	ld.w      	r2, (r3, 0x8)
 8011f0a:	3a84      	bclri      	r2, 4
 8011f0c:	b342      	st.w      	r2, (r3, 0x8)
 8011f0e:	9343      	ld.w      	r2, (r3, 0xc)
 8011f10:	ec420010 	ori      	r2, r2, 16
 8011f14:	b343      	st.w      	r2, (r3, 0xc)
 8011f16:	9347      	ld.w      	r2, (r3, 0x1c)
 8011f18:	3a84      	bclri      	r2, 4
 8011f1a:	b347      	st.w      	r2, (r3, 0x1c)
 8011f1c:	07e8      	br      	0x8011eec	// 8011eec <HAL_ADC_MspInit+0xa0>
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_3);
 8011f1e:	1070      	lrw      	r3, 0x40011200	// 8011f5c <HAL_ADC_MspInit+0x110>
 8011f20:	9344      	ld.w      	r2, (r3, 0x10)
 8011f22:	3a83      	bclri      	r2, 3
 8011f24:	b344      	st.w      	r2, (r3, 0x10)
 8011f26:	9342      	ld.w      	r2, (r3, 0x8)
 8011f28:	3a83      	bclri      	r2, 3
 8011f2a:	b342      	st.w      	r2, (r3, 0x8)
 8011f2c:	9343      	ld.w      	r2, (r3, 0xc)
 8011f2e:	ec420008 	ori      	r2, r2, 8
 8011f32:	b343      	st.w      	r2, (r3, 0xc)
 8011f34:	9347      	ld.w      	r2, (r3, 0x1c)
 8011f36:	3a83      	bclri      	r2, 3
 8011f38:	b347      	st.w      	r2, (r3, 0x1c)
 8011f3a:	07d9      	br      	0x8011eec	// 8011eec <HAL_ADC_MspInit+0xa0>
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_1);
 8011f3c:	1068      	lrw      	r3, 0x40011200	// 8011f5c <HAL_ADC_MspInit+0x110>
 8011f3e:	9344      	ld.w      	r2, (r3, 0x10)
 8011f40:	3a81      	bclri      	r2, 1
 8011f42:	b344      	st.w      	r2, (r3, 0x10)
 8011f44:	9342      	ld.w      	r2, (r3, 0x8)
 8011f46:	3a81      	bclri      	r2, 1
 8011f48:	b342      	st.w      	r2, (r3, 0x8)
 8011f4a:	9343      	ld.w      	r2, (r3, 0xc)
 8011f4c:	ec420002 	ori      	r2, r2, 2
 8011f50:	b343      	st.w      	r2, (r3, 0xc)
 8011f52:	9347      	ld.w      	r2, (r3, 0x1c)
 8011f54:	3a81      	bclri      	r2, 1
 8011f56:	b347      	st.w      	r2, (r3, 0x1c)
 8011f58:	07d5      	br      	0x8011f02	// 8011f02 <HAL_ADC_MspInit+0xb6>
 8011f5a:	0000      	.short	0x0000
 8011f5c:	40011200 	.long	0x40011200

08011f60 <CORET_IRQHandler>:

extern ADC_HandleTypeDef hadc;

#define readl(addr) ({unsigned int __v = (*(volatile unsigned int *) (addr)); __v;})
__attribute__((isr)) void CORET_IRQHandler(void)
{
 8011f60:	1460      	nie
 8011f62:	1462      	ipush
 8011f64:	142e      	subi      	r14, r14, 56
 8011f66:	d64e1c2d 	stm      	r18-r31, (r14)
 8011f6a:	1428      	subi      	r14, r14, 32
 8011f6c:	f4ee3400 	fstms      	fr0-fr7, (r14)
 8011f70:	14d0      	push      	r15
	readl(0xE000E010);
 8011f72:	1068      	lrw      	r3, 0xe000e000	// 8011f90 <CORET_IRQHandler+0x30>
 8011f74:	9364      	ld.w      	r3, (r3, 0x10)
	HAL_IncTick();
 8011f76:	e3fffd85 	bsr      	0x8011a80	// 8011a80 <HAL_IncTick>
}
 8011f7a:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 8011f7e:	1401      	addi      	r14, r14, 4
 8011f80:	f4ee3000 	fldms      	fr0-fr7, (r14)
 8011f84:	1408      	addi      	r14, r14, 32
 8011f86:	d24e1c2d 	ldm      	r18-r31, (r14)
 8011f8a:	140e      	addi      	r14, r14, 56
 8011f8c:	1463      	ipop
 8011f8e:	1461      	nir
 8011f90:	e000e000 	.long	0xe000e000

08011f94 <ADC_IRQHandler>:

__attribute__((isr)) void ADC_IRQHandler(void)
{
 8011f94:	1460      	nie
 8011f96:	1462      	ipush
 8011f98:	142e      	subi      	r14, r14, 56
 8011f9a:	d64e1c2d 	stm      	r18-r31, (r14)
 8011f9e:	1428      	subi      	r14, r14, 32
 8011fa0:	f4ee3400 	fstms      	fr0-fr7, (r14)
 8011fa4:	14d0      	push      	r15
 	HAL_ADC_IRQHandler(&hadc);
 8011fa6:	1008      	lrw      	r0, 0x20001868	// 8011fc4 <ADC_IRQHandler+0x30>
 8011fa8:	e3fffe98 	bsr      	0x8011cd8	// 8011cd8 <HAL_ADC_IRQHandler>
 8011fac:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 8011fb0:	1401      	addi      	r14, r14, 4
 8011fb2:	f4ee3000 	fldms      	fr0-fr7, (r14)
 8011fb6:	1408      	addi      	r14, r14, 32
 8011fb8:	d24e1c2d 	ldm      	r18-r31, (r14)
 8011fbc:	140e      	addi      	r14, r14, 56
 8011fbe:	1463      	ipop
 8011fc0:	1461      	nir
 8011fc2:	0000      	.short	0x0000
 8011fc4:	20001868 	.long	0x20001868

08011fc8 <SystemInit>:
  \details Writes the given value to the VBR Register.
  \param [in]    vbr  VBR Register value to set
 */
__ALWAYS_STATIC_INLINE void __set_VBR(uint32_t vbr)
{
    __ASM volatile("mtcr %0, vbr" : : "r"(vbr));
 8011fc8:	106a      	lrw      	r3, 0x20000000	// 8011ff0 <SystemInit+0x28>
 8011fca:	c0036421 	mtcr      	r3, cr<1, 0>
 */
__ALWAYS_STATIC_INLINE uint32_t __get_CHR(void)
{
    uint32_t result;

    __ASM volatile("mfcr %0, cr<31, 0>\n" :"=r"(result));
 8011fce:	c01f6023 	mfcr      	r3, cr<31, 0>
    __set_Int_SP((uint32_t)&g_top_irqstack);
    __set_CHR(__get_CHR() | CHR_ISE_Msk);
    VIC->TSPR = 0xFF;
#endif

    __set_CHR(__get_CHR() | CHR_IAE_Msk);
 8011fd2:	ec630010 	ori      	r3, r3, 16
  \details Assigns the given value to the CHR.
  \param [in]    chr  CHR value to set
 */
__ALWAYS_STATIC_INLINE void __set_CHR(uint32_t chr)
{
    __ASM volatile("mtcr %0, cr<31, 0>\n" : : "r"(chr));
 8011fd6:	c003643f 	mtcr      	r3, cr<31, 0>

    /* Clear active and pending IRQ */
    VIC->IABR[0] = 0x0;
 8011fda:	1047      	lrw      	r2, 0xe000e100	// 8011ff4 <SystemInit+0x2c>
 8011fdc:	3300      	movi      	r3, 0
 8011fde:	dc622080 	st.w      	r3, (r2, 0x200)
    VIC->ICPR[0] = 0xFFFFFFFF;
 8011fe2:	2b00      	subi      	r3, 1
 8011fe4:	dc622060 	st.w      	r3, (r2, 0x180)
  \details Enables interrupts and exceptions by setting the IE-bit and EE-bit in the PSR.
           Can only be executed in Privileged modes.
 */
__ALWAYS_STATIC_INLINE void __enable_excp_irq(void)
{
    __ASM volatile("psrset ee, ie");
 8011fe8:	c1807420 	psrset      	ee, ie

#ifdef CONFIG_KERNEL_NONE
    __enable_excp_irq();
#endif
}
 8011fec:	783c      	jmp      	r15
 8011fee:	0000      	.short	0x0000
 8011ff0:	20000000 	.long	0x20000000
 8011ff4:	e000e100 	.long	0xe000e100

08011ff8 <trap_c>:
#include <stdio.h>
#include <stdlib.h>
#include <csi_config.h>

void trap_c(uint32_t *regs)
{
 8011ff8:	14d4      	push      	r4-r7, r15
 8011ffa:	6d43      	mov      	r5, r0
    int i;
    uint32_t vec = 0;
    asm volatile(
 8011ffc:	c0006021 	mfcr      	r1, cr<0, 0>
 8012000:	4930      	lsri      	r1, r1, 16
 8012002:	7446      	sextb      	r1, r1
        "mfcr    %0, psr \n"
        "lsri    %0, 16 \n"
        "sextb   %0 \n"
        :"=r"(vec):);
    //while (1);
    printf("CPU Exception : %u", vec);
 8012004:	1018      	lrw      	r0, 0x8013b04	// 8012064 <trap_c+0x6c>
 8012006:	e0000c4d 	bsr      	0x80138a0	// 80138a0 <wm_printf>
    printf("\n");
 801200a:	300a      	movi      	r0, 10
 801200c:	e3fffc76 	bsr      	0x80118f8	// 80118f8 <__GI_putchar>

    for (i = 0; i < 16; i++) {
        printf("r%d: %08x\t", i, regs[i]);
 8012010:	9540      	ld.w      	r2, (r5, 0x0)
 8012012:	3100      	movi      	r1, 0
 8012014:	1015      	lrw      	r0, 0x8013b18	// 8012068 <trap_c+0x70>
 8012016:	e0000c45 	bsr      	0x80138a0	// 80138a0 <wm_printf>
    for (i = 0; i < 16; i++) {
 801201a:	3400      	movi      	r4, 0
        printf("r%d: %08x\t", i, regs[i]);
 801201c:	10f3      	lrw      	r7, 0x8013b18	// 8012068 <trap_c+0x70>

        if ((i % 5) == 4) {
 801201e:	3605      	movi      	r6, 5
    for (i = 0; i < 16; i++) {
 8012020:	2400      	addi      	r4, 1
 8012022:	3c50      	cmpnei      	r4, 16
 8012024:	0c13      	bf      	0x801204a	// 801204a <trap_c+0x52>
        printf("r%d: %08x\t", i, regs[i]);
 8012026:	d0850882 	ldr.w      	r2, (r5, r4 << 2)
 801202a:	6c53      	mov      	r1, r4
 801202c:	6c1f      	mov      	r0, r7
 801202e:	e0000c39 	bsr      	0x80138a0	// 80138a0 <wm_printf>
        if ((i % 5) == 4) {
 8012032:	c4c48043 	divs      	r3, r4, r6
 8012036:	7cd8      	mult      	r3, r6
 8012038:	5c6d      	subu      	r3, r4, r3
 801203a:	3b44      	cmpnei      	r3, 4
 801203c:	0bf2      	bt      	0x8012020	// 8012020 <trap_c+0x28>
            printf("\n");
 801203e:	300a      	movi      	r0, 10
    for (i = 0; i < 16; i++) {
 8012040:	2400      	addi      	r4, 1
            printf("\n");
 8012042:	e3fffc5b 	bsr      	0x80118f8	// 80118f8 <__GI_putchar>
    for (i = 0; i < 16; i++) {
 8012046:	3c50      	cmpnei      	r4, 16
 8012048:	0bef      	bt      	0x8012026	// 8012026 <trap_c+0x2e>
        }
    }

    printf("\n");
 801204a:	300a      	movi      	r0, 10
 801204c:	e3fffc56 	bsr      	0x80118f8	// 80118f8 <__GI_putchar>
    printf("epsr: %8x\n", regs[16]);
 8012050:	9530      	ld.w      	r1, (r5, 0x40)
 8012052:	1007      	lrw      	r0, 0x8013b24	// 801206c <trap_c+0x74>
 8012054:	e0000c26 	bsr      	0x80138a0	// 80138a0 <wm_printf>
    printf("epc : %8x\n", regs[17]);
 8012058:	9531      	ld.w      	r1, (r5, 0x44)
 801205a:	1006      	lrw      	r0, 0x8013b30	// 8012070 <trap_c+0x78>
 801205c:	e0000c22 	bsr      	0x80138a0	// 80138a0 <wm_printf>
 8012060:	0400      	br      	0x8012060	// 8012060 <trap_c+0x68>
 8012062:	0000      	.short	0x0000
 8012064:	08013b04 	.long	0x08013b04
 8012068:	08013b18 	.long	0x08013b18
 801206c:	08013b24 	.long	0x08013b24
 8012070:	08013b30 	.long	0x08013b30

08012074 <board_init>:
    VIC->ICER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8012074:	106a      	lrw      	r3, 0xe000e100	// 801209c <board_init+0x28>
 8012076:	ea210001 	movih      	r1, 1
 801207a:	dc232020 	st.w      	r1, (r3, 0x80)
    VIC->ICPR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 801207e:	dc232060 	st.w      	r1, (r3, 0x180)

	NVIC_DisableIRQ(UART0_IRQn);
	NVIC_ClearPendingIRQ(UART0_IRQn);

	bd = (APB_CLK/(16*bandrate) - 1)|(((APB_CLK%(bandrate*16))*16/(bandrate*16))<<16);
	WRITE_REG(UART0->BAUDR, bd);
 8012082:	1068      	lrw      	r3, 0x40010600	// 80120a0 <board_init+0x2c>
 8012084:	ea21000b 	movih      	r1, 11
 8012088:	2113      	addi      	r1, 20
 801208a:	b324      	st.w      	r1, (r3, 0x10)
    VIC->ICER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 801208c:	3200      	movi      	r2, 0

	WRITE_REG(UART0->LC, UART_BITSTOP_VAL | UART_TXEN_BIT | UART_RXEN_BIT);
 801208e:	31c3      	movi      	r1, 195
 8012090:	b320      	st.w      	r1, (r3, 0x0)
	WRITE_REG(UART0->FC, 0x00);   			/* Disable afc */
 8012092:	b341      	st.w      	r2, (r3, 0x4)
	WRITE_REG(UART0->DMAC, 0x00);             		/* Disable DMA */
 8012094:	b342      	st.w      	r2, (r3, 0x8)
	WRITE_REG(UART0->FIFOC, 0x00);             		/* one byte TX/RX */
 8012096:	b343      	st.w      	r2, (r3, 0xc)
#else
    uart1_io_init();
    /* use uart1 as log output io */
	uart1Init(115200);
#endif
}
 8012098:	783c      	jmp      	r15
 801209a:	0000      	.short	0x0000
 801209c:	e000e100 	.long	0xe000e100
 80120a0:	40010600 	.long	0x40010600

080120a4 <_out_uart>:
#include "wm_regs.h"
#include "wm_hal.h"

int sendchar(int ch)
{
    while((READ_REG(UART0->FIFOS) & 0x3F) >= 32);
 80120a4:	1044      	lrw      	r2, 0x40010600	// 80120b4 <_out_uart+0x10>
 80120a6:	9267      	ld.w      	r3, (r2, 0x1c)
 80120a8:	e463203f 	andi      	r3, r3, 63
 80120ac:	3b1f      	cmphsi      	r3, 32
 80120ae:	0bfc      	bt      	0x80120a6	// 80120a6 <_out_uart+0x2>
    WRITE_REG(UART0->TDW, (char)ch);
 80120b0:	b208      	st.w      	r0, (r2, 0x20)
}

static inline void _out_uart(char character, void* buffer, size_t idx, size_t maxlen)
{
  _write_r(NULL, 0, &character, 1);
}
 80120b2:	783c      	jmp      	r15
 80120b4:	40010600 	.long	0x40010600

080120b8 <_out_null>:

// internal null output
static inline void _out_null(char character, void* buffer, size_t idx, size_t maxlen)
{
  (void)character; (void)buffer; (void)idx; (void)maxlen;
}
 80120b8:	783c      	jmp      	r15
	...

080120bc <_out_rev>:
  return i;
}

// output the specified string in reverse, taking care of any zero-padding
static size_t _out_rev(out_fct_type out, char* buffer, size_t idx, size_t maxlen, const char* buf, size_t len, unsigned int width, unsigned int flags)
{
 80120bc:	ebe00058 	push      	r4-r11, r15, r16-r17
 80120c0:	6e4f      	mov      	r9, r3
 80120c2:	da0e200e 	ld.w      	r16, (r14, 0x38)
 80120c6:	986b      	ld.w      	r3, (r14, 0x2c)
 80120c8:	c4034831 	lsli      	r17, r3, 0
  const size_t start_idx = idx;

  // pad spaces up to given width
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 80120cc:	e4702003 	andi      	r3, r16, 3
{
 80120d0:	6dc3      	mov      	r7, r0
 80120d2:	6e07      	mov      	r8, r1
 80120d4:	6e8b      	mov      	r10, r2
 80120d6:	98ac      	ld.w      	r5, (r14, 0x30)
 80120d8:	d96e200d 	ld.w      	r11, (r14, 0x34)
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 80120dc:	e9230010 	bnez      	r3, 0x80120fc	// 80120fc <_out_rev+0x40>
    for (size_t i = len; i < width; i++) {
 80120e0:	66d4      	cmphs      	r5, r11
 80120e2:	080d      	bt      	0x80120fc	// 80120fc <_out_rev+0x40>
 80120e4:	c4ab0086 	subu      	r6, r11, r5
 80120e8:	6188      	addu      	r6, r2
      out(' ', buffer, idx++, maxlen);
 80120ea:	5a82      	addi      	r4, r2, 1
 80120ec:	6ce7      	mov      	r3, r9
 80120ee:	6c63      	mov      	r1, r8
 80120f0:	3020      	movi      	r0, 32
 80120f2:	7bdd      	jsr      	r7
    for (size_t i = len; i < width; i++) {
 80120f4:	6592      	cmpne      	r4, r6
 80120f6:	6c93      	mov      	r2, r4
 80120f8:	0bf9      	bt      	0x80120ea	// 80120ea <_out_rev+0x2e>
 80120fa:	0402      	br      	0x80120fe	// 80120fe <_out_rev+0x42>
 80120fc:	6d2b      	mov      	r4, r10
    }
  }

  // reverse string
  while (len) {
 80120fe:	e905002a 	bez      	r5, 0x8012152	// 8012152 <_out_rev+0x96>
 8012102:	5dc3      	subi      	r6, r5, 1
 8012104:	c4114823 	lsli      	r3, r17, 0
 8012108:	60d8      	addu      	r3, r6
 801210a:	6d8f      	mov      	r6, r3
 801210c:	6150      	addu      	r5, r4
    out(buf[--len], buffer, idx++, maxlen);
 801210e:	e6240000 	addi      	r17, r4, 1
 8012112:	6c93      	mov      	r2, r4
 8012114:	8600      	ld.b      	r0, (r6, 0x0)
 8012116:	6ce7      	mov      	r3, r9
 8012118:	6c63      	mov      	r1, r8
 801211a:	c4114824 	lsli      	r4, r17, 0
 801211e:	7bdd      	jsr      	r7
  while (len) {
 8012120:	6552      	cmpne      	r4, r5
 8012122:	2e00      	subi      	r6, 1
 8012124:	0bf5      	bt      	0x801210e	// 801210e <_out_rev+0x52>
  }

  // append pad spaces up to given width
  if (flags & FLAGS_LEFT) {
 8012126:	e6102002 	andi      	r16, r16, 2
 801212a:	e9100011 	bez      	r16, 0x801214c	// 801214c <_out_rev+0x90>
    while (idx - start_idx < width) {
 801212e:	c5450083 	subu      	r3, r5, r10
 8012132:	66cc      	cmphs      	r3, r11
 8012134:	080c      	bt      	0x801214c	// 801214c <_out_rev+0x90>
 8012136:	6c97      	mov      	r2, r5
      out(' ', buffer, idx++, maxlen);
 8012138:	2500      	addi      	r5, 1
 801213a:	6ce7      	mov      	r3, r9
 801213c:	6c63      	mov      	r1, r8
 801213e:	3020      	movi      	r0, 32
 8012140:	7bdd      	jsr      	r7
    while (idx - start_idx < width) {
 8012142:	c5450083 	subu      	r3, r5, r10
 8012146:	66cc      	cmphs      	r3, r11
      out(' ', buffer, idx++, maxlen);
 8012148:	6c97      	mov      	r2, r5
    while (idx - start_idx < width) {
 801214a:	0ff7      	bf      	0x8012138	// 8012138 <_out_rev+0x7c>
    }
  }

  return idx;
}
 801214c:	6c17      	mov      	r0, r5
 801214e:	ebc00058 	pop      	r4-r11, r15, r16-r17
  while (len) {
 8012152:	6d53      	mov      	r5, r4
 8012154:	07e9      	br      	0x8012126	// 8012126 <_out_rev+0x6a>
	...

08012158 <_ntoa_format>:

// internal itoa format
static size_t _ntoa_format(out_fct_type out, char* buffer, size_t idx, size_t maxlen, char* buf, size_t len, bool negative, unsigned int base, unsigned int prec, unsigned int width, unsigned int flags)
{
 8012158:	14d1      	push      	r4, r15
 801215a:	1424      	subi      	r14, r14, 16
 801215c:	d9ae2009 	ld.w      	r13, (r14, 0x24)
 8012160:	da8e200c 	ld.w      	r20, (r14, 0x30)
 8012164:	c40d4839 	lsli      	r25, r13, 0
  // pad leading zeros
  if (!(flags & FLAGS_LEFT)) {
 8012168:	e5b42002 	andi      	r13, r20, 2
{
 801216c:	dace2006 	ld.w      	r22, (r14, 0x18)
 8012170:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 8012174:	da6e200a 	ld.w      	r19, (r14, 0x28)
 8012178:	da4e200b 	ld.w      	r18, (r14, 0x2c)
 801217c:	daee0020 	ld.b      	r23, (r14, 0x20)
  if (!(flags & FLAGS_LEFT)) {
 8012180:	e92d0039 	bnez      	r13, 0x80121f2	// 80121f2 <_ntoa_format+0x9a>
    if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 8012184:	e9320071 	bnez      	r18, 0x8012266	// 8012266 <_ntoa_format+0x10e>
      width--;
    }
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8012188:	c66c0420 	cmphs      	r12, r19
 801218c:	0833      	bt      	0x80121f2	// 80121f2 <_ntoa_format+0x9a>
 801218e:	eb0c001f 	cmphsi      	r12, 32
 8012192:	e7142001 	andi      	r24, r20, 1
 8012196:	082e      	bt      	0x80121f2	// 80121f2 <_ntoa_format+0x9a>
 8012198:	c596002d 	addu      	r13, r22, r12
      buf[len++] = '0';
 801219c:	ea150030 	movi      	r21, 48
 80121a0:	0406      	br      	0x80121ac	// 80121ac <_ntoa_format+0x54>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80121a2:	eb4c0020 	cmpnei      	r12, 32
 80121a6:	e5ad0000 	addi      	r13, r13, 1
 80121aa:	0c08      	bf      	0x80121ba	// 80121ba <_ntoa_format+0x62>
      buf[len++] = '0';
 80121ac:	e58c0000 	addi      	r12, r12, 1
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80121b0:	c66c0420 	cmphs      	r12, r19
      buf[len++] = '0';
 80121b4:	dead0000 	st.b      	r21, (r13, 0x0)
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80121b8:	0ff5      	bf      	0x80121a2	// 80121a2 <_ntoa_format+0x4a>
    }
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80121ba:	e918001c 	bez      	r24, 0x80121f2	// 80121f2 <_ntoa_format+0x9a>
 80121be:	c64c0420 	cmphs      	r12, r18
 80121c2:	0818      	bt      	0x80121f2	// 80121f2 <_ntoa_format+0x9a>
 80121c4:	ea0d001f 	movi      	r13, 31
 80121c8:	6734      	cmphs      	r13, r12
 80121ca:	0c62      	bf      	0x801228e	// 801228e <_ntoa_format+0x136>
 80121cc:	c596002d 	addu      	r13, r22, r12
      buf[len++] = '0';
 80121d0:	ea150030 	movi      	r21, 48
 80121d4:	0406      	br      	0x80121e0	// 80121e0 <_ntoa_format+0x88>
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80121d6:	eb4c0020 	cmpnei      	r12, 32
 80121da:	e5ad0000 	addi      	r13, r13, 1
 80121de:	0c58      	bf      	0x801228e	// 801228e <_ntoa_format+0x136>
      buf[len++] = '0';
 80121e0:	e58c0000 	addi      	r12, r12, 1
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80121e4:	c64c0480 	cmpne      	r12, r18
      buf[len++] = '0';
 80121e8:	dead0000 	st.b      	r21, (r13, 0x0)
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80121ec:	0bf5      	bt      	0x80121d6	// 80121d6 <_ntoa_format+0x7e>
      buf[len++] = '0';
 80121ee:	c40c4832 	lsli      	r18, r12, 0
    }
  }

  // handle hash
  if (flags & FLAGS_HASH) {
 80121f2:	e5b42010 	andi      	r13, r20, 16
 80121f6:	e90d0019 	bez      	r13, 0x8012228	// 8012228 <_ntoa_format+0xd0>
    if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
 80121fa:	e5b42400 	andi      	r13, r20, 1024
 80121fe:	e92d0004 	bnez      	r13, 0x8012206	// 8012206 <_ntoa_format+0xae>
 8012202:	e92c004e 	bnez      	r12, 0x801229e	// 801229e <_ntoa_format+0x146>
      len--;
      if (len && (base == 16U)) {
        len--;
      }
    }
    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8012206:	c4194824 	lsli      	r4, r25, 0
 801220a:	3c50      	cmpnei      	r4, 16
 801220c:	0c74      	bf      	0x80122f4	// 80122f4 <_ntoa_format+0x19c>
      buf[len++] = 'x';
    }
    else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
      buf[len++] = 'X';
    }
    else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 801220e:	c4194824 	lsli      	r4, r25, 0
 8012212:	3c42      	cmpnei      	r4, 2
 8012214:	0c7e      	bf      	0x8012310	// 8012310 <_ntoa_format+0x1b8>
      buf[len++] = 'b';
    }
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
 8012216:	eb0c001f 	cmphsi      	r12, 32
 801221a:	081a      	bt      	0x801224e	// 801224e <_ntoa_format+0xf6>
      buf[len++] = '0';
 801221c:	ea0d0030 	movi      	r13, 48
 8012220:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8012224:	e58c0000 	addi      	r12, r12, 1
    }
  }

  if (len < PRINTF_NTOA_BUFFER_SIZE) {
 8012228:	eb0c001f 	cmphsi      	r12, 32
 801222c:	0811      	bt      	0x801224e	// 801224e <_ntoa_format+0xf6>
    if (negative) {
 801222e:	e9370048 	bnez      	r23, 0x80122be	// 80122be <_ntoa_format+0x166>
      buf[len++] = '-';
    }
    else if (flags & FLAGS_PLUS) {
 8012232:	e5b42004 	andi      	r13, r20, 4
 8012236:	e92d0056 	bnez      	r13, 0x80122e2	// 80122e2 <_ntoa_format+0x18a>
      buf[len++] = '+';  // ignore the space if the '+' exists
    }
    else if (flags & FLAGS_SPACE) {
 801223a:	e5b42008 	andi      	r13, r20, 8
 801223e:	e90d0008 	bez      	r13, 0x801224e	// 801224e <_ntoa_format+0xf6>
      buf[len++] = ' ';
 8012242:	ea0d0020 	movi      	r13, 32
 8012246:	d596002d 	str.b      	r13, (r22, r12 << 0)
 801224a:	e58c0000 	addi      	r12, r12, 1
    }
  }

  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 801224e:	de8e2003 	st.w      	r20, (r14, 0xc)
 8012252:	de4e2002 	st.w      	r18, (r14, 0x8)
 8012256:	dd8e2001 	st.w      	r12, (r14, 0x4)
 801225a:	dece2000 	st.w      	r22, (r14, 0x0)
 801225e:	e3ffff2f 	bsr      	0x80120bc	// 80120bc <_out_rev>
}
 8012262:	1404      	addi      	r14, r14, 16
 8012264:	1491      	pop      	r4, r15
    if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 8012266:	e7142001 	andi      	r24, r20, 1
 801226a:	e9180031 	bez      	r24, 0x80122cc	// 80122cc <_ntoa_format+0x174>
 801226e:	e9370037 	bnez      	r23, 0x80122dc	// 80122dc <_ntoa_format+0x184>
 8012272:	e5b4200c 	andi      	r13, r20, 12
 8012276:	e92d0033 	bnez      	r13, 0x80122dc	// 80122dc <_ntoa_format+0x184>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 801227a:	c66c0420 	cmphs      	r12, r19
 801227e:	0ba0      	bt      	0x80121be	// 80121be <_ntoa_format+0x66>
 8012280:	ea0d001f 	movi      	r13, 31
 8012284:	6734      	cmphs      	r13, r12
 8012286:	0b89      	bt      	0x8012198	// 8012198 <_ntoa_format+0x40>
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8012288:	c64c0420 	cmphs      	r12, r18
 801228c:	0bb3      	bt      	0x80121f2	// 80121f2 <_ntoa_format+0x9a>
  if (flags & FLAGS_HASH) {
 801228e:	e5b42010 	andi      	r13, r20, 16
 8012292:	e90dffde 	bez      	r13, 0x801224e	// 801224e <_ntoa_format+0xf6>
    if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
 8012296:	e5b42400 	andi      	r13, r20, 1024
 801229a:	e92dffb6 	bnez      	r13, 0x8012206	// 8012206 <_ntoa_format+0xae>
 801229e:	c5930480 	cmpne      	r19, r12
 80122a2:	0c04      	bf      	0x80122aa	// 80122aa <_ntoa_format+0x152>
 80122a4:	c64c0480 	cmpne      	r12, r18
 80122a8:	0baf      	bt      	0x8012206	// 8012206 <_ntoa_format+0xae>
      len--;
 80122aa:	e5ac1000 	subi      	r13, r12, 1
      if (len && (base == 16U)) {
 80122ae:	e90d0046 	bez      	r13, 0x801233a	// 801233a <_ntoa_format+0x1e2>
 80122b2:	c4194824 	lsli      	r4, r25, 0
 80122b6:	3c50      	cmpnei      	r4, 16
 80122b8:	0c1c      	bf      	0x80122f0	// 80122f0 <_ntoa_format+0x198>
 80122ba:	6f37      	mov      	r12, r13
 80122bc:	07a9      	br      	0x801220e	// 801220e <_ntoa_format+0xb6>
      buf[len++] = '-';
 80122be:	ea0d002d 	movi      	r13, 45
 80122c2:	d596002d 	str.b      	r13, (r22, r12 << 0)
 80122c6:	e58c0000 	addi      	r12, r12, 1
 80122ca:	07c2      	br      	0x801224e	// 801224e <_ntoa_format+0xf6>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80122cc:	c66c0420 	cmphs      	r12, r19
 80122d0:	0b91      	bt      	0x80121f2	// 80121f2 <_ntoa_format+0x9a>
 80122d2:	ea0d001f 	movi      	r13, 31
 80122d6:	6734      	cmphs      	r13, r12
 80122d8:	0b60      	bt      	0x8012198	// 8012198 <_ntoa_format+0x40>
 80122da:	078c      	br      	0x80121f2	// 80121f2 <_ntoa_format+0x9a>
      width--;
 80122dc:	e6521000 	subi      	r18, r18, 1
 80122e0:	07cd      	br      	0x801227a	// 801227a <_ntoa_format+0x122>
      buf[len++] = '+';  // ignore the space if the '+' exists
 80122e2:	ea0d002b 	movi      	r13, 43
 80122e6:	d596002d 	str.b      	r13, (r22, r12 << 0)
 80122ea:	e58c0000 	addi      	r12, r12, 1
 80122ee:	07b0      	br      	0x801224e	// 801224e <_ntoa_format+0xf6>
        len--;
 80122f0:	e58c1001 	subi      	r12, r12, 2
    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80122f4:	e5b42020 	andi      	r13, r20, 32
 80122f8:	e92d0016 	bnez      	r13, 0x8012324	// 8012324 <_ntoa_format+0x1cc>
 80122fc:	eb0c001f 	cmphsi      	r12, 32
 8012300:	0ba7      	bt      	0x801224e	// 801224e <_ntoa_format+0xf6>
      buf[len++] = 'x';
 8012302:	ea0d0078 	movi      	r13, 120
 8012306:	d596002d 	str.b      	r13, (r22, r12 << 0)
 801230a:	e58c0000 	addi      	r12, r12, 1
 801230e:	0784      	br      	0x8012216	// 8012216 <_ntoa_format+0xbe>
    else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8012310:	eb0c001f 	cmphsi      	r12, 32
 8012314:	0b9d      	bt      	0x801224e	// 801224e <_ntoa_format+0xf6>
      buf[len++] = 'b';
 8012316:	ea0d0062 	movi      	r13, 98
 801231a:	d596002d 	str.b      	r13, (r22, r12 << 0)
 801231e:	e58c0000 	addi      	r12, r12, 1
 8012322:	077a      	br      	0x8012216	// 8012216 <_ntoa_format+0xbe>
    else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8012324:	ea0d001f 	movi      	r13, 31
 8012328:	6734      	cmphs      	r13, r12
 801232a:	0f92      	bf      	0x801224e	// 801224e <_ntoa_format+0xf6>
      buf[len++] = 'X';
 801232c:	ea0d0058 	movi      	r13, 88
 8012330:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8012334:	e58c0000 	addi      	r12, r12, 1
 8012338:	076f      	br      	0x8012216	// 8012216 <_ntoa_format+0xbe>
 801233a:	6f37      	mov      	r12, r13
 801233c:	0765      	br      	0x8012206	// 8012206 <_ntoa_format+0xae>
	...

08012340 <_ntoa_long>:


// internal itoa for 'long' type
static size_t _ntoa_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long value, bool negative, unsigned long base, unsigned int prec, unsigned int width, unsigned int flags)
{
 8012340:	14d3      	push      	r4-r6, r15
 8012342:	142f      	subi      	r14, r14, 60
 8012344:	d9ae2016 	ld.w      	r13, (r14, 0x58)
 8012348:	d98e2013 	ld.w      	r12, (r14, 0x4c)
 801234c:	6d77      	mov      	r5, r13
 801234e:	d9ae2017 	ld.w      	r13, (r14, 0x5c)
 8012352:	da8e2015 	ld.w      	r20, (r14, 0x54)
 8012356:	6db7      	mov      	r6, r13
 8012358:	db0e2018 	ld.w      	r24, (r14, 0x60)
 801235c:	d88e0050 	ld.b      	r4, (r14, 0x50)
  char buf[PRINTF_NTOA_BUFFER_SIZE];
  size_t len = 0U;

  // no hash for 0 values
  if (!value) {
 8012360:	e92c000a 	bnez      	r12, 0x8012374	// 8012374 <_ntoa_long+0x34>
    flags &= ~FLAGS_HASH;
 8012364:	c498282d 	bclri      	r13, r24, 4
  }

  // write if precision != 0 and value is != 0
  if (!(flags & FLAGS_PRECISION) || value) {
 8012368:	e7182400 	andi      	r24, r24, 1024
 801236c:	e9380043 	bnez      	r24, 0x80123f2	// 80123f2 <_ntoa_long+0xb2>
    flags &= ~FLAGS_HASH;
 8012370:	c40d4838 	lsli      	r24, r13, 0
    do {
      const char digit = (char)(value % base);
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8012374:	e5b82020 	andi      	r13, r24, 32
 8012378:	eb4d0000 	cmpnei      	r13, 0
 801237c:	ea170041 	movi      	r23, 65
 8012380:	ea0d0061 	movi      	r13, 97
 8012384:	c6ed0c20 	incf      	r23, r13, 0
 8012388:	e72e001b 	addi      	r25, r14, 28
 801238c:	c4194832 	lsli      	r18, r25, 0
 8012390:	ea150000 	movi      	r21, 0
 8012394:	e6f71009 	subi      	r23, r23, 10
 8012398:	ea130020 	movi      	r19, 32
      const char digit = (char)(value % base);
 801239c:	c68c802d 	divu      	r13, r12, r20
 80123a0:	c68d8436 	mult      	r22, r13, r20
 80123a4:	c6cc008c 	subu      	r12, r12, r22
 80123a8:	7730      	zextb      	r12, r12
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 80123aa:	eb0c0009 	cmphsi      	r12, 10
 80123ae:	e6b50000 	addi      	r21, r21, 1
 80123b2:	081c      	bt      	0x80123ea	// 80123ea <_ntoa_long+0xaa>
 80123b4:	e58c002f 	addi      	r12, r12, 48
 80123b8:	7730      	zextb      	r12, r12
 80123ba:	dd920000 	st.b      	r12, (r18, 0x0)
      value /= base;
 80123be:	6f37      	mov      	r12, r13
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 80123c0:	e90d0006 	bez      	r13, 0x80123cc	// 80123cc <_ntoa_long+0x8c>
 80123c4:	e6520000 	addi      	r18, r18, 1
 80123c8:	e833ffea 	bnezad      	r19, 0x801239c	// 801239c <_ntoa_long+0x5c>
  }

  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 80123cc:	df0e2006 	st.w      	r24, (r14, 0x18)
 80123d0:	b8c5      	st.w      	r6, (r14, 0x14)
 80123d2:	b8a4      	st.w      	r5, (r14, 0x10)
 80123d4:	de8e2003 	st.w      	r20, (r14, 0xc)
 80123d8:	b882      	st.w      	r4, (r14, 0x8)
 80123da:	deae2001 	st.w      	r21, (r14, 0x4)
 80123de:	df2e2000 	st.w      	r25, (r14, 0x0)
 80123e2:	e3fffebb 	bsr      	0x8012158	// 8012158 <_ntoa_format>
}
 80123e6:	140f      	addi      	r14, r14, 60
 80123e8:	1493      	pop      	r4-r6, r15
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 80123ea:	c6ec002c 	addu      	r12, r12, r23
 80123ee:	7730      	zextb      	r12, r12
 80123f0:	07e5      	br      	0x80123ba	// 80123ba <_ntoa_long+0x7a>
    flags &= ~FLAGS_HASH;
 80123f2:	c40d4838 	lsli      	r24, r13, 0
  size_t len = 0U;
 80123f6:	c40c4835 	lsli      	r21, r12, 0
 80123fa:	e72e001b 	addi      	r25, r14, 28
 80123fe:	07e7      	br      	0x80123cc	// 80123cc <_ntoa_long+0x8c>

08012400 <_ntoa_long_long>:


// internal itoa for 'long long' type
#if defined(PRINTF_SUPPORT_LONG_LONG)
static size_t _ntoa_long_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long long value, bool negative, unsigned long long base, unsigned int prec, unsigned int width, unsigned int flags)
{
 8012400:	ebe00058 	push      	r4-r11, r15, r16-r17
 8012404:	1435      	subi      	r14, r14, 84
 8012406:	c4034831 	lsli      	r17, r3, 0
 801240a:	d96e2020 	ld.w      	r11, (r14, 0x80)
 801240e:	9965      	ld.w      	r3, (r14, 0x94)
 8012410:	da0e2021 	ld.w      	r16, (r14, 0x84)
 8012414:	b86b      	st.w      	r3, (r14, 0x2c)
  char buf[PRINTF_NTOA_BUFFER_SIZE];
  size_t len = 0U;

  // no hash for 0 values
  if (!value) {
 8012416:	c60b2424 	or      	r4, r11, r16
{
 801241a:	9966      	ld.w      	r3, (r14, 0x98)
 801241c:	b86c      	st.w      	r3, (r14, 0x30)
 801241e:	d86e0088 	ld.b      	r3, (r14, 0x88)
 8012422:	b807      	st.w      	r0, (r14, 0x1c)
 8012424:	b828      	st.w      	r1, (r14, 0x20)
 8012426:	b849      	st.w      	r2, (r14, 0x24)
 8012428:	99c3      	ld.w      	r6, (r14, 0x8c)
 801242a:	99e4      	ld.w      	r7, (r14, 0x90)
 801242c:	d94e2027 	ld.w      	r10, (r14, 0x9c)
 8012430:	b86a      	st.w      	r3, (r14, 0x28)
  if (!value) {
 8012432:	e9240009 	bnez      	r4, 0x8012444	// 8012444 <_ntoa_long_long+0x44>
    flags &= ~FLAGS_HASH;
  }

  // write if precision != 0 and value is != 0
  if (!(flags & FLAGS_PRECISION) || value) {
 8012436:	e44a2400 	andi      	r2, r10, 1024
    flags &= ~FLAGS_HASH;
 801243a:	c48a2823 	bclri      	r3, r10, 4
 801243e:	6e8f      	mov      	r10, r3
  if (!(flags & FLAGS_PRECISION) || value) {
 8012440:	e9220033 	bnez      	r2, 0x80124a6	// 80124a6 <_ntoa_long_long+0xa6>
    do {
      const char digit = (char)(value % base);
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8012444:	e46a2020 	andi      	r3, r10, 32
 8012448:	3b40      	cmpnei      	r3, 0
 801244a:	ea080041 	movi      	r8, 65
 801244e:	3361      	movi      	r3, 97
 8012450:	c5030c20 	incf      	r8, r3, 0
 8012454:	e52e0033 	addi      	r9, r14, 52
 8012458:	6d67      	mov      	r5, r9
 801245a:	3400      	movi      	r4, 0
 801245c:	e5081009 	subi      	r8, r8, 10
 8012460:	0415      	br      	0x801248a	// 801248a <_ntoa_long_long+0x8a>
 8012462:	202f      	addi      	r0, 48
 8012464:	7400      	zextb      	r0, r0
 8012466:	a500      	st.b      	r0, (r5, 0x0)
      value /= base;
 8012468:	c4104821 	lsli      	r1, r16, 0
 801246c:	6c2f      	mov      	r0, r11
 801246e:	6c9b      	mov      	r2, r6
 8012470:	6cdf      	mov      	r3, r7
 8012472:	e3fff121 	bsr      	0x80106b4	// 80106b4 <__udivdi3>
 8012476:	c4014830 	lsli      	r16, r1, 0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 801247a:	6c40      	or      	r1, r0
      value /= base;
 801247c:	6ec3      	mov      	r11, r0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 801247e:	e9010016 	bez      	r1, 0x80124aa	// 80124aa <_ntoa_long_long+0xaa>
 8012482:	eb440020 	cmpnei      	r4, 32
 8012486:	2500      	addi      	r5, 1
 8012488:	0c11      	bf      	0x80124aa	// 80124aa <_ntoa_long_long+0xaa>
      const char digit = (char)(value % base);
 801248a:	6c9b      	mov      	r2, r6
 801248c:	6cdf      	mov      	r3, r7
 801248e:	6c2f      	mov      	r0, r11
 8012490:	c4104821 	lsli      	r1, r16, 0
 8012494:	e3fff2aa 	bsr      	0x80109e8	// 80109e8 <__umoddi3>
 8012498:	7400      	zextb      	r0, r0
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 801249a:	3809      	cmphsi      	r0, 10
 801249c:	2400      	addi      	r4, 1
 801249e:	0fe2      	bf      	0x8012462	// 8012462 <_ntoa_long_long+0x62>
 80124a0:	6020      	addu      	r0, r8
 80124a2:	7400      	zextb      	r0, r0
 80124a4:	07e1      	br      	0x8012466	// 8012466 <_ntoa_long_long+0x66>
 80124a6:	e52e0033 	addi      	r9, r14, 52
  }

  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 80124aa:	986c      	ld.w      	r3, (r14, 0x30)
 80124ac:	b865      	st.w      	r3, (r14, 0x14)
 80124ae:	986b      	ld.w      	r3, (r14, 0x2c)
 80124b0:	b864      	st.w      	r3, (r14, 0x10)
 80124b2:	986a      	ld.w      	r3, (r14, 0x28)
 80124b4:	b862      	st.w      	r3, (r14, 0x8)
 80124b6:	dd4e2006 	st.w      	r10, (r14, 0x18)
 80124ba:	b8c3      	st.w      	r6, (r14, 0xc)
 80124bc:	b881      	st.w      	r4, (r14, 0x4)
 80124be:	dd2e2000 	st.w      	r9, (r14, 0x0)
 80124c2:	c4114823 	lsli      	r3, r17, 0
 80124c6:	9849      	ld.w      	r2, (r14, 0x24)
 80124c8:	9828      	ld.w      	r1, (r14, 0x20)
 80124ca:	9807      	ld.w      	r0, (r14, 0x1c)
 80124cc:	e3fffe46 	bsr      	0x8012158	// 8012158 <_ntoa_format>
}
 80124d0:	1415      	addi      	r14, r14, 84
 80124d2:	ebc00058 	pop      	r4-r11, r15, r16-r17
	...

080124d8 <_ftoa>:
#endif


// internal ftoa for fixed decimal floating point
static size_t _ftoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
 80124d8:	ebe00058 	push      	r4-r11, r15, r16-r17
 80124dc:	1435      	subi      	r14, r14, 84
 80124de:	6ecf      	mov      	r11, r3
 80124e0:	9962      	ld.w      	r3, (r14, 0x88)
 80124e2:	6e4f      	mov      	r9, r3
 80124e4:	9963      	ld.w      	r3, (r14, 0x8c)
 80124e6:	9980      	ld.w      	r4, (r14, 0x80)
 80124e8:	99a1      	ld.w      	r5, (r14, 0x84)
 80124ea:	b865      	st.w      	r3, (r14, 0x14)
 80124ec:	9964      	ld.w      	r3, (r14, 0x90)
 80124ee:	6d83      	mov      	r6, r0
 80124f0:	6dc7      	mov      	r7, r1
 80124f2:	6e8b      	mov      	r10, r2
 80124f4:	b866      	st.w      	r3, (r14, 0x18)

  // powers of 10
  static const double pow10[] = { 1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000 };

  // test for special values
  if (value != value)
 80124f6:	6c93      	mov      	r2, r4
 80124f8:	6cd7      	mov      	r3, r5
 80124fa:	6c13      	mov      	r0, r4
 80124fc:	6c57      	mov      	r1, r5
 80124fe:	e3fff72b 	bsr      	0x8011354	// 8011354 <__nedf2>
 8012502:	e920010c 	bnez      	r0, 0x801271a	// 801271a <_ftoa+0x242>
    return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
  if (value < -DBL_MAX)
 8012506:	3200      	movi      	r2, 0
 8012508:	ea23fff0 	movih      	r3, 65520
 801250c:	2a00      	subi      	r2, 1
 801250e:	2b00      	subi      	r3, 1
 8012510:	6c13      	mov      	r0, r4
 8012512:	9921      	ld.w      	r1, (r14, 0x84)
 8012514:	e3fff77c 	bsr      	0x801140c	// 801140c <__ltdf2>
 8012518:	e980011b 	blz      	r0, 0x801274e	// 801274e <_ftoa+0x276>
    return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
  if (value > DBL_MAX)
 801251c:	3200      	movi      	r2, 0
 801251e:	ea237ff0 	movih      	r3, 32752
 8012522:	2a00      	subi      	r2, 1
 8012524:	2b00      	subi      	r3, 1
 8012526:	6c13      	mov      	r0, r4
 8012528:	9921      	ld.w      	r1, (r14, 0x84)
 801252a:	e3fff731 	bsr      	0x801138c	// 801138c <__gtdf2>
 801252e:	e960001d 	blsz      	r0, 0x8012568	// 8012568 <_ftoa+0x90>
    return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
 8012532:	9806      	ld.w      	r0, (r14, 0x18)
 8012534:	e4402004 	andi      	r2, r0, 4
 8012538:	3a40      	cmpnei      	r2, 0
 801253a:	0137      	lrw      	r1, 0x8013d24	// 8012858 <_ftoa+0x380>
 801253c:	0177      	lrw      	r3, 0x8013d1c	// 801285c <_ftoa+0x384>
 801253e:	c4610c20 	incf      	r3, r1, 0
 8012542:	3a40      	cmpnei      	r2, 0
 8012544:	3103      	movi      	r1, 3
 8012546:	3204      	movi      	r2, 4
 8012548:	c4410c20 	incf      	r2, r1, 0
 801254c:	9825      	ld.w      	r1, (r14, 0x14)
 801254e:	b803      	st.w      	r0, (r14, 0xc)
 8012550:	b822      	st.w      	r1, (r14, 0x8)
 8012552:	b841      	st.w      	r2, (r14, 0x4)
 8012554:	b860      	st.w      	r3, (r14, 0x0)
    else if (flags & FLAGS_SPACE) {
      buf[len++] = ' ';
    }
  }

  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 8012556:	6cef      	mov      	r3, r11
 8012558:	6cab      	mov      	r2, r10
 801255a:	6c5f      	mov      	r1, r7
 801255c:	6c1b      	mov      	r0, r6
 801255e:	e3fffdaf 	bsr      	0x80120bc	// 80120bc <_out_rev>
}
 8012562:	1415      	addi      	r14, r14, 84
 8012564:	ebc00058 	pop      	r4-r11, r15, r16-r17
  if ((value > PRINTF_MAX_FLOAT) || (value < -PRINTF_MAX_FLOAT)) {
 8012568:	3200      	movi      	r2, 0
 801256a:	0261      	lrw      	r3, 0x41cdcd65	// 8012860 <_ftoa+0x388>
 801256c:	6c13      	mov      	r0, r4
 801256e:	9921      	ld.w      	r1, (r14, 0x84)
 8012570:	e3fff70e 	bsr      	0x801138c	// 801138c <__gtdf2>
 8012574:	e94000dc 	bhz      	r0, 0x801272c	// 801272c <_ftoa+0x254>
 8012578:	3200      	movi      	r2, 0
 801257a:	0264      	lrw      	r3, 0xc1cdcd65	// 8012864 <_ftoa+0x38c>
 801257c:	6c13      	mov      	r0, r4
 801257e:	9921      	ld.w      	r1, (r14, 0x84)
 8012580:	e3fff746 	bsr      	0x801140c	// 801140c <__ltdf2>
 8012584:	e98000d4 	blz      	r0, 0x801272c	// 801272c <_ftoa+0x254>
  if (value < 0) {
 8012588:	3200      	movi      	r2, 0
 801258a:	6ccb      	mov      	r3, r2
 801258c:	6c13      	mov      	r0, r4
 801258e:	9921      	ld.w      	r1, (r14, 0x84)
 8012590:	e3fff73e 	bsr      	0x801140c	// 801140c <__ltdf2>
 8012594:	e98001b0 	blz      	r0, 0x80128f4	// 80128f4 <_ftoa+0x41c>
  bool negative = false;
 8012598:	3300      	movi      	r3, 0
 801259a:	b86c      	st.w      	r3, (r14, 0x30)
  if (!(flags & FLAGS_PRECISION)) {
 801259c:	9866      	ld.w      	r3, (r14, 0x18)
 801259e:	e5a32400 	andi      	r13, r3, 1024
 80125a2:	e92d0136 	bnez      	r13, 0x801280e	// 801280e <_ftoa+0x336>
 80125a6:	026e      	lrw      	r3, 0x412e8480	// 8012868 <_ftoa+0x390>
 80125a8:	ddae2007 	st.w      	r13, (r14, 0x1c)
 80125ac:	b868      	st.w      	r3, (r14, 0x20)
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 80125ae:	ea080006 	movi      	r8, 6
 80125b2:	e68e0033 	addi      	r20, r14, 52
  int whole = (int)value;
 80125b6:	6c57      	mov      	r1, r5
 80125b8:	6c13      	mov      	r0, r4
 80125ba:	de8e200b 	st.w      	r20, (r14, 0x2c)
 80125be:	ddae200a 	st.w      	r13, (r14, 0x28)
 80125c2:	e3fff775 	bsr      	0x80114ac	// 80114ac <__fixdfsi>
 80125c6:	6e43      	mov      	r9, r0
  double tmp = (value - whole) * pow10[prec];
 80125c8:	e3fff73e 	bsr      	0x8011444	// 8011444 <__floatsidf>
 80125cc:	6c83      	mov      	r2, r0
 80125ce:	6cc7      	mov      	r3, r1
 80125d0:	6c13      	mov      	r0, r4
 80125d2:	6c57      	mov      	r1, r5
 80125d4:	e3fff516 	bsr      	0x8011000	// 8011000 <__subdf3>
 80125d8:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 80125dc:	d9ae2008 	ld.w      	r13, (r14, 0x20)
 80125e0:	6cb3      	mov      	r2, r12
 80125e2:	9868      	ld.w      	r3, (r14, 0x20)
 80125e4:	e3fff52c 	bsr      	0x801103c	// 801103c <__muldf3>
 80125e8:	c4014831 	lsli      	r17, r1, 0
 80125ec:	c4004830 	lsli      	r16, r0, 0
  unsigned long frac = (unsigned long)tmp;
 80125f0:	e3fff046 	bsr      	0x801067c	// 801067c <__fixunsdfsi>
 80125f4:	b809      	st.w      	r0, (r14, 0x24)
  diff = tmp - frac;
 80125f6:	e3fff793 	bsr      	0x801151c	// 801151c <__floatunsidf>
 80125fa:	6c83      	mov      	r2, r0
 80125fc:	6cc7      	mov      	r3, r1
 80125fe:	c4104820 	lsli      	r0, r16, 0
 8012602:	c4114821 	lsli      	r1, r17, 0
 8012606:	e3fff4fd 	bsr      	0x8011000	// 8011000 <__subdf3>
  if (diff > 0.5) {
 801260a:	3200      	movi      	r2, 0
 801260c:	ea233fe0 	movih      	r3, 16352
  diff = tmp - frac;
 8012610:	c4004830 	lsli      	r16, r0, 0
 8012614:	c4014831 	lsli      	r17, r1, 0
  if (diff > 0.5) {
 8012618:	e3fff6ba 	bsr      	0x801138c	// 801138c <__gtdf2>
 801261c:	da4e2009 	ld.w      	r18, (r14, 0x24)
 8012620:	d9ae200a 	ld.w      	r13, (r14, 0x28)
 8012624:	da8e200b 	ld.w      	r20, (r14, 0x2c)
 8012628:	e96000d3 	blsz      	r0, 0x80127ce	// 80127ce <_ftoa+0x2f6>
    ++frac;
 801262c:	e6520000 	addi      	r18, r18, 1
    if (frac >= pow10[prec]) {
 8012630:	c4124820 	lsli      	r0, r18, 0
 8012634:	de8e2009 	st.w      	r20, (r14, 0x24)
 8012638:	c40d4831 	lsli      	r17, r13, 0
 801263c:	c4124830 	lsli      	r16, r18, 0
 8012640:	e3fff76e 	bsr      	0x801151c	// 801151c <__floatunsidf>
 8012644:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 8012648:	d9ae2008 	ld.w      	r13, (r14, 0x20)
 801264c:	6cf7      	mov      	r3, r13
 801264e:	6cb3      	mov      	r2, r12
 8012650:	e3fff6be 	bsr      	0x80113cc	// 80113cc <__gedf2>
 8012654:	c4104832 	lsli      	r18, r16, 0
 8012658:	c411482d 	lsli      	r13, r17, 0
 801265c:	da8e2009 	ld.w      	r20, (r14, 0x24)
 8012660:	e9a0011f 	bhsz      	r0, 0x801289e	// 801289e <_ftoa+0x3c6>
  if (prec == 0U) {
 8012664:	e928007e 	bnez      	r8, 0x8012760	// 8012760 <_ftoa+0x288>
    diff = value - (double)whole;
 8012668:	6c27      	mov      	r0, r9
 801266a:	c4144831 	lsli      	r17, r20, 0
 801266e:	c40d4830 	lsli      	r16, r13, 0
 8012672:	e3fff6e9 	bsr      	0x8011444	// 8011444 <__floatsidf>
 8012676:	6c83      	mov      	r2, r0
 8012678:	6cc7      	mov      	r3, r1
 801267a:	6c13      	mov      	r0, r4
 801267c:	6c57      	mov      	r1, r5
 801267e:	e3fff4c1 	bsr      	0x8011000	// 8011000 <__subdf3>
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 8012682:	6ca3      	mov      	r2, r8
 8012684:	ea233fe0 	movih      	r3, 16352
    diff = value - (double)whole;
 8012688:	6d03      	mov      	r4, r0
 801268a:	6d47      	mov      	r5, r1
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 801268c:	e3fff6c0 	bsr      	0x801140c	// 801140c <__ltdf2>
 8012690:	c410482d 	lsli      	r13, r16, 0
 8012694:	c4114834 	lsli      	r20, r17, 0
 8012698:	e98000f5 	blz      	r0, 0x8012882	// 8012882 <_ftoa+0x3aa>
 801269c:	e4692001 	andi      	r3, r9, 1
      ++whole;
 80126a0:	3b40      	cmpnei      	r3, 0
 80126a2:	c4690c20 	incf      	r3, r9, 0
 80126a6:	c4690c41 	inct      	r3, r9, 1
 80126aa:	6e4f      	mov      	r9, r3
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
 80126ac:	eb4d0020 	cmpnei      	r13, 32
 80126b0:	0c81      	bf      	0x80127b2	// 80127b2 <_ftoa+0x2da>
    buf[len++] = (char)(48 + (whole % 10));
 80126b2:	300a      	movi      	r0, 10
 80126b4:	c4098043 	divs      	r3, r9, r0
 80126b8:	6d27      	mov      	r4, r9
 80126ba:	c4038421 	mult      	r1, r3, r0
 80126be:	5c25      	subu      	r1, r4, r1
 80126c0:	212f      	addi      	r1, 48
 80126c2:	e44d0000 	addi      	r2, r13, 1
 80126c6:	d5b40021 	str.b      	r1, (r20, r13 << 0)
    if (!(whole /= 10)) {
 80126ca:	e9030013 	bez      	r3, 0x80126f0	// 80126f0 <_ftoa+0x218>
 80126ce:	c454002c 	addu      	r12, r20, r2
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
 80126d2:	eb420020 	cmpnei      	r2, 32
 80126d6:	0c6e      	bf      	0x80127b2	// 80127b2 <_ftoa+0x2da>
    buf[len++] = (char)(48 + (whole % 10));
 80126d8:	c4038041 	divs      	r1, r3, r0
 80126dc:	c401842d 	mult      	r13, r1, r0
 80126e0:	60f6      	subu      	r3, r13
 80126e2:	232f      	addi      	r3, 48
 80126e4:	d40c8003 	stbi.b      	r3, (r12)
 80126e8:	2200      	addi      	r2, 1
    if (!(whole /= 10)) {
 80126ea:	6cc7      	mov      	r3, r1
 80126ec:	e921fff3 	bnez      	r1, 0x80126d2	// 80126d2 <_ftoa+0x1fa>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 80126f0:	9866      	ld.w      	r3, (r14, 0x18)
 80126f2:	e4632003 	andi      	r3, r3, 3
 80126f6:	3b41      	cmpnei      	r3, 1
 80126f8:	0cda      	bf      	0x80128ac	// 80128ac <_ftoa+0x3d4>
  if (len < PRINTF_FTOA_BUFFER_SIZE) {
 80126fa:	eb420020 	cmpnei      	r2, 32
 80126fe:	0d27      	bf      	0x801294c	// 801294c <_ftoa+0x474>
    if (negative) {
 8012700:	986c      	ld.w      	r3, (r14, 0x30)
 8012702:	e92300bb 	bnez      	r3, 0x8012878	// 8012878 <_ftoa+0x3a0>
    else if (flags & FLAGS_PLUS) {
 8012706:	9866      	ld.w      	r3, (r14, 0x18)
 8012708:	e4632004 	andi      	r3, r3, 4
 801270c:	e9030116 	bez      	r3, 0x8012938	// 8012938 <_ftoa+0x460>
      buf[len++] = '+';  // ignore the space if the '+' exists
 8012710:	312b      	movi      	r1, 43
 8012712:	5a62      	addi      	r3, r2, 1
 8012714:	d4540021 	str.b      	r1, (r20, r2 << 0)
 8012718:	0453      	br      	0x80127be	// 80127be <_ftoa+0x2e6>
    return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
 801271a:	9866      	ld.w      	r3, (r14, 0x18)
 801271c:	b863      	st.w      	r3, (r14, 0xc)
 801271e:	9865      	ld.w      	r3, (r14, 0x14)
 8012720:	b862      	st.w      	r3, (r14, 0x8)
 8012722:	3303      	movi      	r3, 3
 8012724:	b861      	st.w      	r3, (r14, 0x4)
 8012726:	1272      	lrw      	r3, 0x8013d28	// 801286c <_ftoa+0x394>
 8012728:	b860      	st.w      	r3, (r14, 0x0)
 801272a:	0716      	br      	0x8012556	// 8012556 <_ftoa+0x7e>
    return _etoa(out, buffer, idx, maxlen, value, prec, width, flags);
 801272c:	9866      	ld.w      	r3, (r14, 0x18)
 801272e:	b864      	st.w      	r3, (r14, 0x10)
 8012730:	9865      	ld.w      	r3, (r14, 0x14)
 8012732:	b863      	st.w      	r3, (r14, 0xc)
 8012734:	dd2e2002 	st.w      	r9, (r14, 0x8)
 8012738:	b880      	st.w      	r4, (r14, 0x0)
 801273a:	b8a1      	st.w      	r5, (r14, 0x4)
 801273c:	6cef      	mov      	r3, r11
 801273e:	6cab      	mov      	r2, r10
 8012740:	6c5f      	mov      	r1, r7
 8012742:	6c1b      	mov      	r0, r6
 8012744:	e0000116 	bsr      	0x8012970	// 8012970 <_etoa>
}
 8012748:	1415      	addi      	r14, r14, 84
 801274a:	ebc00058 	pop      	r4-r11, r15, r16-r17
    return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
 801274e:	9866      	ld.w      	r3, (r14, 0x18)
 8012750:	b863      	st.w      	r3, (r14, 0xc)
 8012752:	9865      	ld.w      	r3, (r14, 0x14)
 8012754:	b862      	st.w      	r3, (r14, 0x8)
 8012756:	3304      	movi      	r3, 4
 8012758:	b861      	st.w      	r3, (r14, 0x4)
 801275a:	1266      	lrw      	r3, 0x8013d2c	// 8012870 <_ftoa+0x398>
 801275c:	b860      	st.w      	r3, (r14, 0x0)
 801275e:	06fc      	br      	0x8012556	// 8012556 <_ftoa+0x7e>
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
 8012760:	eb4d0020 	cmpnei      	r13, 32
 8012764:	0c27      	bf      	0x80127b2	// 80127b2 <_ftoa+0x2da>
      buf[len++] = (char)(48U + (frac % 10U));
 8012766:	300a      	movi      	r0, 10
 8012768:	c4128023 	divu      	r3, r18, r0
 801276c:	c4038421 	mult      	r1, r3, r0
 8012770:	c4320092 	subu      	r18, r18, r1
 8012774:	e652002f 	addi      	r18, r18, 48
      --count;
 8012778:	e5881000 	subi      	r12, r8, 1
      buf[len++] = (char)(48U + (frac % 10U));
 801277c:	e44d0000 	addi      	r2, r13, 1
 8012780:	d5b40032 	str.b      	r18, (r20, r13 << 0)
      if (!(frac /= 10U)) {
 8012784:	e90300c3 	bez      	r3, 0x801290a	// 801290a <_ftoa+0x432>
 8012788:	c454002d 	addu      	r13, r20, r2
 801278c:	0410      	br      	0x80127ac	// 80127ac <_ftoa+0x2d4>
      buf[len++] = (char)(48U + (frac % 10U));
 801278e:	c4038021 	divu      	r1, r3, r0
 8012792:	c4018432 	mult      	r18, r1, r0
 8012796:	c6430083 	subu      	r3, r3, r18
 801279a:	232f      	addi      	r3, 48
 801279c:	d40d8003 	stbi.b      	r3, (r13)
      --count;
 80127a0:	e58c1000 	subi      	r12, r12, 1
      buf[len++] = (char)(48U + (frac % 10U));
 80127a4:	2200      	addi      	r2, 1
      if (!(frac /= 10U)) {
 80127a6:	6cc7      	mov      	r3, r1
 80127a8:	e90100b1 	bez      	r1, 0x801290a	// 801290a <_ftoa+0x432>
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
 80127ac:	eb420020 	cmpnei      	r2, 32
 80127b0:	0bef      	bt      	0x801278e	// 801278e <_ftoa+0x2b6>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 80127b2:	9866      	ld.w      	r3, (r14, 0x18)
 80127b4:	e4632003 	andi      	r3, r3, 3
 80127b8:	3b41      	cmpnei      	r3, 1
 80127ba:	0c78      	bf      	0x80128aa	// 80128aa <_ftoa+0x3d2>
 80127bc:	3320      	movi      	r3, 32
  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 80127be:	9846      	ld.w      	r2, (r14, 0x18)
 80127c0:	b843      	st.w      	r2, (r14, 0xc)
 80127c2:	9845      	ld.w      	r2, (r14, 0x14)
 80127c4:	b842      	st.w      	r2, (r14, 0x8)
 80127c6:	b861      	st.w      	r3, (r14, 0x4)
 80127c8:	de8e2000 	st.w      	r20, (r14, 0x0)
 80127cc:	06c5      	br      	0x8012556	// 8012556 <_ftoa+0x7e>
  else if (diff < 0.5) {
 80127ce:	3200      	movi      	r2, 0
 80127d0:	ea233fe0 	movih      	r3, 16352
 80127d4:	c4104820 	lsli      	r0, r16, 0
 80127d8:	c4114821 	lsli      	r1, r17, 0
 80127dc:	de8e200a 	st.w      	r20, (r14, 0x28)
 80127e0:	de4e2009 	st.w      	r18, (r14, 0x24)
 80127e4:	ddae2007 	st.w      	r13, (r14, 0x1c)
 80127e8:	e3fff612 	bsr      	0x801140c	// 801140c <__ltdf2>
 80127ec:	d9ae2007 	ld.w      	r13, (r14, 0x1c)
 80127f0:	da4e2009 	ld.w      	r18, (r14, 0x24)
 80127f4:	da8e200a 	ld.w      	r20, (r14, 0x28)
 80127f8:	e980ff36 	blz      	r0, 0x8012664	// 8012664 <_ftoa+0x18c>
  else if ((frac == 0U) || (frac & 1U)) {
 80127fc:	e9120006 	bez      	r18, 0x8012808	// 8012808 <_ftoa+0x330>
 8012800:	e4722001 	andi      	r3, r18, 1
 8012804:	e903ff30 	bez      	r3, 0x8012664	// 8012664 <_ftoa+0x18c>
    ++frac;
 8012808:	e6520000 	addi      	r18, r18, 1
 801280c:	072c      	br      	0x8012664	// 8012664 <_ftoa+0x18c>
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 801280e:	6ce7      	mov      	r3, r9
 8012810:	3b09      	cmphsi      	r3, 10
 8012812:	0c9f      	bf      	0x8012950	// 8012950 <_ftoa+0x478>
    buf[len++] = '0';
 8012814:	e68e0033 	addi      	r20, r14, 52
 8012818:	3030      	movi      	r0, 48
 801281a:	dc140000 	st.b      	r0, (r20, 0x0)
    prec--;
 801281e:	e5091000 	subi      	r8, r9, 1
 8012822:	e44e0034 	addi      	r2, r14, 53
 8012826:	e4291008 	subi      	r1, r9, 9
 801282a:	ea0d0001 	movi      	r13, 1
    buf[len++] = '0';
 801282e:	331f      	movi      	r3, 31
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 8012830:	6476      	cmpne      	r13, r1
 8012832:	0c09      	bf      	0x8012844	// 8012844 <_ftoa+0x36c>
    buf[len++] = '0';
 8012834:	e5ad0000 	addi      	r13, r13, 1
 8012838:	d4028000 	stbi.b      	r0, (r2)
    prec--;
 801283c:	e5081000 	subi      	r8, r8, 1
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 8012840:	e823fff8 	bnezad      	r3, 0x8012830	// 8012830 <_ftoa+0x358>
 8012844:	104c      	lrw      	r2, 0x8013d34	// 8012874 <_ftoa+0x39c>
 8012846:	c4684823 	lsli      	r3, r8, 3
 801284a:	60c8      	addu      	r3, r2
 801284c:	9340      	ld.w      	r2, (r3, 0x0)
 801284e:	9361      	ld.w      	r3, (r3, 0x4)
 8012850:	b847      	st.w      	r2, (r14, 0x1c)
 8012852:	b868      	st.w      	r3, (r14, 0x20)
 8012854:	06b1      	br      	0x80125b6	// 80125b6 <_ftoa+0xde>
 8012856:	0000      	.short	0x0000
 8012858:	08013d24 	.long	0x08013d24
 801285c:	08013d1c 	.long	0x08013d1c
 8012860:	41cdcd65 	.long	0x41cdcd65
 8012864:	c1cdcd65 	.long	0xc1cdcd65
 8012868:	412e8480 	.long	0x412e8480
 801286c:	08013d28 	.long	0x08013d28
 8012870:	08013d2c 	.long	0x08013d2c
 8012874:	08013d34 	.long	0x08013d34
      buf[len++] = '-';
 8012878:	312d      	movi      	r1, 45
 801287a:	5a62      	addi      	r3, r2, 1
 801287c:	d4540021 	str.b      	r1, (r20, r2 << 0)
 8012880:	079f      	br      	0x80127be	// 80127be <_ftoa+0x2e6>
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 8012882:	6ca3      	mov      	r2, r8
 8012884:	ea233fe0 	movih      	r3, 16352
 8012888:	6c13      	mov      	r0, r4
 801288a:	6c57      	mov      	r1, r5
 801288c:	e3fff580 	bsr      	0x801138c	// 801138c <__gtdf2>
 8012890:	c410482d 	lsli      	r13, r16, 0
 8012894:	c4114834 	lsli      	r20, r17, 0
 8012898:	e960ff0a 	blsz      	r0, 0x80126ac	// 80126ac <_ftoa+0x1d4>
 801289c:	0700      	br      	0x801269c	// 801269c <_ftoa+0x1c4>
      ++whole;
 801289e:	6ce7      	mov      	r3, r9
 80128a0:	2300      	addi      	r3, 1
 80128a2:	6e4f      	mov      	r9, r3
      frac = 0;
 80128a4:	ea120000 	movi      	r18, 0
 80128a8:	06de      	br      	0x8012664	// 8012664 <_ftoa+0x18c>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 80128aa:	3220      	movi      	r2, 32
    if (width && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 80128ac:	9865      	ld.w      	r3, (r14, 0x14)
 80128ae:	e903ff26 	bez      	r3, 0x80126fa	// 80126fa <_ftoa+0x222>
 80128b2:	986c      	ld.w      	r3, (r14, 0x30)
 80128b4:	e9230007 	bnez      	r3, 0x80128c2	// 80128c2 <_ftoa+0x3ea>
 80128b8:	9866      	ld.w      	r3, (r14, 0x18)
 80128ba:	e463200c 	andi      	r3, r3, 12
 80128be:	e9030005 	bez      	r3, 0x80128c8	// 80128c8 <_ftoa+0x3f0>
      width--;
 80128c2:	9865      	ld.w      	r3, (r14, 0x14)
 80128c4:	2b00      	subi      	r3, 1
 80128c6:	b865      	st.w      	r3, (r14, 0x14)
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 80128c8:	9865      	ld.w      	r3, (r14, 0x14)
 80128ca:	64c8      	cmphs      	r2, r3
 80128cc:	0b17      	bt      	0x80126fa	// 80126fa <_ftoa+0x222>
 80128ce:	eb420020 	cmpnei      	r2, 32
 80128d2:	0c3d      	bf      	0x801294c	// 801294c <_ftoa+0x474>
 80128d4:	c4540021 	addu      	r1, r20, r2
 80128d8:	6ccb      	mov      	r3, r2
      buf[len++] = '0';
 80128da:	3230      	movi      	r2, 48
 80128dc:	0405      	br      	0x80128e6	// 80128e6 <_ftoa+0x40e>
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 80128de:	eb430020 	cmpnei      	r3, 32
 80128e2:	2100      	addi      	r1, 1
 80128e4:	0f6d      	bf      	0x80127be	// 80127be <_ftoa+0x2e6>
      buf[len++] = '0';
 80128e6:	2300      	addi      	r3, 1
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 80128e8:	9805      	ld.w      	r0, (r14, 0x14)
 80128ea:	640e      	cmpne      	r3, r0
      buf[len++] = '0';
 80128ec:	a140      	st.b      	r2, (r1, 0x0)
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 80128ee:	0bf8      	bt      	0x80128de	// 80128de <_ftoa+0x406>
      buf[len++] = '0';
 80128f0:	9845      	ld.w      	r2, (r14, 0x14)
 80128f2:	0704      	br      	0x80126fa	// 80126fa <_ftoa+0x222>
    value = 0 - value;
 80128f4:	6c93      	mov      	r2, r4
 80128f6:	9961      	ld.w      	r3, (r14, 0x84)
 80128f8:	3000      	movi      	r0, 0
 80128fa:	3100      	movi      	r1, 0
 80128fc:	e3fff382 	bsr      	0x8011000	// 8011000 <__subdf3>
    negative = true;
 8012900:	3301      	movi      	r3, 1
    value = 0 - value;
 8012902:	6d03      	mov      	r4, r0
 8012904:	6d47      	mov      	r5, r1
    negative = true;
 8012906:	b86c      	st.w      	r3, (r14, 0x30)
 8012908:	064a      	br      	0x801259c	// 801259c <_ftoa+0xc4>
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 801290a:	eb420020 	cmpnei      	r2, 32
 801290e:	0f52      	bf      	0x80127b2	// 80127b2 <_ftoa+0x2da>
 8012910:	e90c000e 	bez      	r12, 0x801292c	// 801292c <_ftoa+0x454>
 8012914:	c4540023 	addu      	r3, r20, r2
 8012918:	6308      	addu      	r12, r2
      buf[len++] = '0';
 801291a:	3130      	movi      	r1, 48
 801291c:	2200      	addi      	r2, 1
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 801291e:	eb420020 	cmpnei      	r2, 32
      buf[len++] = '0';
 8012922:	a320      	st.b      	r1, (r3, 0x0)
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 8012924:	0f47      	bf      	0x80127b2	// 80127b2 <_ftoa+0x2da>
 8012926:	670a      	cmpne      	r2, r12
 8012928:	2300      	addi      	r3, 1
 801292a:	0bf9      	bt      	0x801291c	// 801291c <_ftoa+0x444>
      buf[len++] = '.';
 801292c:	332e      	movi      	r3, 46
 801292e:	e5a20000 	addi      	r13, r2, 1
 8012932:	d4540023 	str.b      	r3, (r20, r2 << 0)
 8012936:	06bb      	br      	0x80126ac	// 80126ac <_ftoa+0x1d4>
    else if (flags & FLAGS_SPACE) {
 8012938:	9866      	ld.w      	r3, (r14, 0x18)
 801293a:	e4632008 	andi      	r3, r3, 8
 801293e:	e9030007 	bez      	r3, 0x801294c	// 801294c <_ftoa+0x474>
      buf[len++] = ' ';
 8012942:	3120      	movi      	r1, 32
 8012944:	5a62      	addi      	r3, r2, 1
 8012946:	d4540021 	str.b      	r1, (r20, r2 << 0)
 801294a:	073a      	br      	0x80127be	// 80127be <_ftoa+0x2e6>
    else if (flags & FLAGS_SPACE) {
 801294c:	6ccb      	mov      	r3, r2
 801294e:	0738      	br      	0x80127be	// 80127be <_ftoa+0x2e6>
 8012950:	1047      	lrw      	r2, 0x8013d34	// 801296c <_ftoa+0x494>
 8012952:	4363      	lsli      	r3, r3, 3
 8012954:	60c8      	addu      	r3, r2
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 8012956:	6e27      	mov      	r8, r9
 8012958:	9340      	ld.w      	r2, (r3, 0x0)
 801295a:	9361      	ld.w      	r3, (r3, 0x4)
 801295c:	b847      	st.w      	r2, (r14, 0x1c)
 801295e:	b868      	st.w      	r3, (r14, 0x20)
 8012960:	ea0d0000 	movi      	r13, 0
 8012964:	e68e0033 	addi      	r20, r14, 52
 8012968:	0627      	br      	0x80125b6	// 80125b6 <_ftoa+0xde>
 801296a:	0000      	.short	0x0000
 801296c:	08013d34 	.long	0x08013d34

08012970 <_etoa>:


#if defined(PRINTF_SUPPORT_EXPONENTIAL)
// internal ftoa variant for exponential floating-point type, contributed by Martijn Jasperse <m.jasperse@gmail.com>
static size_t _etoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
 8012970:	ebe00058 	push      	r4-r11, r15, r16-r17
 8012974:	1434      	subi      	r14, r14, 80
 8012976:	6e0f      	mov      	r8, r3
 8012978:	9961      	ld.w      	r3, (r14, 0x84)
 801297a:	b867      	st.w      	r3, (r14, 0x1c)
 801297c:	9962      	ld.w      	r3, (r14, 0x88)
 801297e:	98bf      	ld.w      	r5, (r14, 0x7c)
 8012980:	9980      	ld.w      	r4, (r14, 0x80)
 8012982:	b868      	st.w      	r3, (r14, 0x20)
 8012984:	9963      	ld.w      	r3, (r14, 0x8c)
 8012986:	b866      	st.w      	r3, (r14, 0x18)
 8012988:	6d83      	mov      	r6, r0
 801298a:	6dc7      	mov      	r7, r1
 801298c:	6ecb      	mov      	r11, r2
  // check for NaN and special values
  if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
 801298e:	6cd3      	mov      	r3, r4
 8012990:	6c97      	mov      	r2, r5
 8012992:	6c17      	mov      	r0, r5
 8012994:	6c53      	mov      	r1, r4
 8012996:	e3fff4df 	bsr      	0x8011354	// 8011354 <__nedf2>
 801299a:	6e43      	mov      	r9, r0
 801299c:	e92001d7 	bnez      	r0, 0x8012d4a	// 8012d4a <_etoa+0x3da>
 80129a0:	3200      	movi      	r2, 0
 80129a2:	ea237ff0 	movih      	r3, 32752
 80129a6:	2a00      	subi      	r2, 1
 80129a8:	2b00      	subi      	r3, 1
 80129aa:	6c17      	mov      	r0, r5
 80129ac:	6c53      	mov      	r1, r4
 80129ae:	e3fff4ef 	bsr      	0x801138c	// 801138c <__gtdf2>
 80129b2:	e94001cc 	bhz      	r0, 0x8012d4a	// 8012d4a <_etoa+0x3da>
 80129b6:	3200      	movi      	r2, 0
 80129b8:	ea23fff0 	movih      	r3, 65520
 80129bc:	2a00      	subi      	r2, 1
 80129be:	2b00      	subi      	r3, 1
 80129c0:	6c17      	mov      	r0, r5
 80129c2:	6c53      	mov      	r1, r4
 80129c4:	e3fff524 	bsr      	0x801140c	// 801140c <__ltdf2>
 80129c8:	e98001c1 	blz      	r0, 0x8012d4a	// 8012d4a <_etoa+0x3da>
    return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
  }

  // determine the sign
  const bool negative = value < 0;
  if (negative) {
 80129cc:	6ca7      	mov      	r2, r9
 80129ce:	6ce7      	mov      	r3, r9
 80129d0:	6c17      	mov      	r0, r5
 80129d2:	6c53      	mov      	r1, r4
 80129d4:	e3fff51c 	bsr      	0x801140c	// 801140c <__ltdf2>
    value = -value;
 80129d8:	6e97      	mov      	r10, r5
  if (negative) {
 80129da:	e9800208 	blz      	r0, 0x8012dea	// 8012dea <_etoa+0x47a>
 80129de:	6e53      	mov      	r9, r4
  }

  // default precision
  if (!(flags & FLAGS_PRECISION)) {
 80129e0:	9866      	ld.w      	r3, (r14, 0x18)
 80129e2:	e4632400 	andi      	r3, r3, 1024
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 80129e6:	3b40      	cmpnei      	r3, 0
 80129e8:	9847      	ld.w      	r2, (r14, 0x1c)
  if (!(flags & FLAGS_PRECISION)) {
 80129ea:	b873      	st.w      	r3, (r14, 0x4c)
    uint64_t U;
    double   F;
  } conv;

  conv.F = value;
  int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023;           // effectively log2
 80129ec:	c68957c0 	zext      	r0, r9, 30, 20
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 80129f0:	3306      	movi      	r3, 6
 80129f2:	c4430c20 	incf      	r2, r3, 0
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
  // now approximate log10 from the log2 integer part and an expansion of ln around 1.5
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 80129f6:	e40013fe 	subi      	r0, r0, 1023
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 80129fa:	b847      	st.w      	r2, (r14, 0x1c)
  int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023;           // effectively log2
 80129fc:	dd4e200a 	st.w      	r10, (r14, 0x28)
 8012a00:	dd2e2009 	st.w      	r9, (r14, 0x24)
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8012a04:	e3fff520 	bsr      	0x8011444	// 8011444 <__floatsidf>
 8012a08:	0145      	lrw      	r2, 0x509f79fb	// 8012d70 <_etoa+0x400>
 8012a0a:	0164      	lrw      	r3, 0x3fd34413	// 8012d74 <_etoa+0x404>
 8012a0c:	e3fff318 	bsr      	0x801103c	// 801103c <__muldf3>
 8012a10:	0145      	lrw      	r2, 0x8b60c8b3	// 8012d78 <_etoa+0x408>
 8012a12:	0164      	lrw      	r3, 0x3fc68a28	// 8012d7c <_etoa+0x40c>
 8012a14:	e3fff2de 	bsr      	0x8010fd0	// 8010fd0 <__adddf3>
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
 8012a18:	d98e200a 	ld.w      	r12, (r14, 0x28)
 8012a1c:	da6e2009 	ld.w      	r19, (r14, 0x24)
 8012a20:	c40c4836 	lsli      	r22, r12, 0
 8012a24:	c4135677 	zext      	r23, r19, 19, 0
 8012a28:	ea140000 	movi      	r20, 0
 8012a2c:	ea353ff0 	movih      	r21, 16368
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8012a30:	c4004831 	lsli      	r17, r0, 0
 8012a34:	c4014830 	lsli      	r16, r1, 0
 8012a38:	3200      	movi      	r2, 0
 8012a3a:	c6962420 	or      	r0, r22, r20
 8012a3e:	c6b72421 	or      	r1, r23, r21
 8012a42:	ea233ff8 	movih      	r3, 16376
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
 8012a46:	dd8e2012 	st.w      	r12, (r14, 0x48)
 8012a4a:	de6e2011 	st.w      	r19, (r14, 0x44)
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8012a4e:	de8e200f 	st.w      	r20, (r14, 0x3c)
 8012a52:	deae2010 	st.w      	r21, (r14, 0x40)
 8012a56:	e3fff2d5 	bsr      	0x8011000	// 8011000 <__subdf3>
 8012a5a:	0155      	lrw      	r2, 0x636f4361	// 8012d80 <_etoa+0x410>
 8012a5c:	0175      	lrw      	r3, 0x3fd287a7	// 8012d84 <_etoa+0x414>
 8012a5e:	e3fff2ef 	bsr      	0x801103c	// 801103c <__muldf3>
 8012a62:	6c83      	mov      	r2, r0
 8012a64:	6cc7      	mov      	r3, r1
 8012a66:	c4114820 	lsli      	r0, r17, 0
 8012a6a:	c4104821 	lsli      	r1, r16, 0
 8012a6e:	e3fff2b1 	bsr      	0x8010fd0	// 8010fd0 <__adddf3>
 8012a72:	e3fff51d 	bsr      	0x80114ac	// 80114ac <__fixdfsi>
 8012a76:	b809      	st.w      	r0, (r14, 0x24)
  // now we want to compute 10^expval but we want to be sure it won't overflow
  exp2 = (int)(expval * 3.321928094887362 + 0.5);
 8012a78:	e3fff4e6 	bsr      	0x8011444	// 8011444 <__floatsidf>
 8012a7c:	015c      	lrw      	r2, 0x979a371	// 8012d88 <_etoa+0x418>
 8012a7e:	017b      	lrw      	r3, 0x400a934f	// 8012d8c <_etoa+0x41c>
 8012a80:	c4004831 	lsli      	r17, r0, 0
 8012a84:	c4014830 	lsli      	r16, r1, 0
 8012a88:	e3fff2da 	bsr      	0x801103c	// 801103c <__muldf3>
 8012a8c:	3200      	movi      	r2, 0
 8012a8e:	ea233fe0 	movih      	r3, 16352
 8012a92:	e3fff29f 	bsr      	0x8010fd0	// 8010fd0 <__adddf3>
 8012a96:	e3fff50b 	bsr      	0x80114ac	// 80114ac <__fixdfsi>
 8012a9a:	b80a      	st.w      	r0, (r14, 0x28)
  const double z  = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
 8012a9c:	0242      	lrw      	r2, 0xbbb55516	// 8012d90 <_etoa+0x420>
 8012a9e:	0261      	lrw      	r3, 0x40026bb1	// 8012d94 <_etoa+0x424>
 8012aa0:	c4114820 	lsli      	r0, r17, 0
 8012aa4:	c4104821 	lsli      	r1, r16, 0
 8012aa8:	e3fff2ca 	bsr      	0x801103c	// 801103c <__muldf3>
 8012aac:	c4004831 	lsli      	r17, r0, 0
 8012ab0:	980a      	ld.w      	r0, (r14, 0x28)
 8012ab2:	c4014830 	lsli      	r16, r1, 0
 8012ab6:	e3fff4c7 	bsr      	0x8011444	// 8011444 <__floatsidf>
 8012aba:	0247      	lrw      	r2, 0xfefa39ef	// 8012d98 <_etoa+0x428>
 8012abc:	0267      	lrw      	r3, 0x3fe62e42	// 8012d9c <_etoa+0x42c>
 8012abe:	e3fff2bf 	bsr      	0x801103c	// 801103c <__muldf3>
 8012ac2:	6c83      	mov      	r2, r0
 8012ac4:	6cc7      	mov      	r3, r1
 8012ac6:	c4114820 	lsli      	r0, r17, 0
 8012aca:	c4104821 	lsli      	r1, r16, 0
 8012ace:	e3fff299 	bsr      	0x8011000	// 8011000 <__subdf3>
  const double z2 = z * z;
 8012ad2:	6c83      	mov      	r2, r0
 8012ad4:	6cc7      	mov      	r3, r1
 8012ad6:	b80c      	st.w      	r0, (r14, 0x30)
 8012ad8:	b82b      	st.w      	r1, (r14, 0x2c)
 8012ada:	e3fff2b1 	bsr      	0x801103c	// 801103c <__muldf3>
  conv.U = (uint64_t)(exp2 + 1023) << 52U;
  // compute exp(z) using continued fractions, see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8012ade:	da4e200c 	ld.w      	r18, (r14, 0x30)
 8012ae2:	d9ae200b 	ld.w      	r13, (r14, 0x2c)
 8012ae6:	c4124822 	lsli      	r2, r18, 0
 8012aea:	6cf7      	mov      	r3, r13
  const double z2 = z * z;
 8012aec:	c4004831 	lsli      	r17, r0, 0
 8012af0:	c4014830 	lsli      	r16, r1, 0
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8012af4:	c4124820 	lsli      	r0, r18, 0
 8012af8:	6c77      	mov      	r1, r13
 8012afa:	de4e200e 	st.w      	r18, (r14, 0x38)
 8012afe:	ddae200d 	st.w      	r13, (r14, 0x34)
 8012b02:	e3fff267 	bsr      	0x8010fd0	// 8010fd0 <__adddf3>
 8012b06:	b80c      	st.w      	r0, (r14, 0x30)
 8012b08:	b82b      	st.w      	r1, (r14, 0x2c)
 8012b0a:	3200      	movi      	r2, 0
 8012b0c:	ea23402c 	movih      	r3, 16428
 8012b10:	c4114820 	lsli      	r0, r17, 0
 8012b14:	c4104821 	lsli      	r1, r16, 0
 8012b18:	e3fff392 	bsr      	0x801123c	// 801123c <__divdf3>
 8012b1c:	3200      	movi      	r2, 0
 8012b1e:	ea234024 	movih      	r3, 16420
 8012b22:	e3fff257 	bsr      	0x8010fd0	// 8010fd0 <__adddf3>
 8012b26:	6c83      	mov      	r2, r0
 8012b28:	6cc7      	mov      	r3, r1
 8012b2a:	c4114820 	lsli      	r0, r17, 0
 8012b2e:	c4104821 	lsli      	r1, r16, 0
 8012b32:	e3fff385 	bsr      	0x801123c	// 801123c <__divdf3>
 8012b36:	3200      	movi      	r2, 0
 8012b38:	ea234018 	movih      	r3, 16408
 8012b3c:	e3fff24a 	bsr      	0x8010fd0	// 8010fd0 <__adddf3>
 8012b40:	6c83      	mov      	r2, r0
 8012b42:	6cc7      	mov      	r3, r1
 8012b44:	c4114820 	lsli      	r0, r17, 0
 8012b48:	c4104821 	lsli      	r1, r16, 0
 8012b4c:	e3fff378 	bsr      	0x801123c	// 801123c <__divdf3>
 8012b50:	da4e200e 	ld.w      	r18, (r14, 0x38)
 8012b54:	d9ae200d 	ld.w      	r13, (r14, 0x34)
 8012b58:	c4124822 	lsli      	r2, r18, 0
 8012b5c:	6cf7      	mov      	r3, r13
 8012b5e:	c4004831 	lsli      	r17, r0, 0
 8012b62:	c4014830 	lsli      	r16, r1, 0
 8012b66:	3000      	movi      	r0, 0
 8012b68:	ea214000 	movih      	r1, 16384
 8012b6c:	e3fff24a 	bsr      	0x8011000	// 8011000 <__subdf3>
 8012b70:	6c83      	mov      	r2, r0
 8012b72:	6cc7      	mov      	r3, r1
 8012b74:	c4114820 	lsli      	r0, r17, 0
 8012b78:	c4104821 	lsli      	r1, r16, 0
 8012b7c:	e3fff22a 	bsr      	0x8010fd0	// 8010fd0 <__adddf3>
 8012b80:	daee200c 	ld.w      	r23, (r14, 0x30)
 8012b84:	dace200b 	ld.w      	r22, (r14, 0x2c)
 8012b88:	6c83      	mov      	r2, r0
 8012b8a:	6cc7      	mov      	r3, r1
 8012b8c:	c4174820 	lsli      	r0, r23, 0
 8012b90:	c4164821 	lsli      	r1, r22, 0
 8012b94:	e3fff354 	bsr      	0x801123c	// 801123c <__divdf3>
 8012b98:	da8e200f 	ld.w      	r20, (r14, 0x3c)
 8012b9c:	daae2010 	ld.w      	r21, (r14, 0x40)
 8012ba0:	c4144822 	lsli      	r2, r20, 0
 8012ba4:	c4154823 	lsli      	r3, r21, 0
 8012ba8:	e3fff214 	bsr      	0x8010fd0	// 8010fd0 <__adddf3>
  conv.U = (uint64_t)(exp2 + 1023) << 52U;
 8012bac:	984a      	ld.w      	r2, (r14, 0x28)
 8012bae:	e46203fe 	addi      	r3, r2, 1023
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8012bb2:	4374      	lsli      	r3, r3, 20
 8012bb4:	3200      	movi      	r2, 0
 8012bb6:	e3fff243 	bsr      	0x801103c	// 801103c <__muldf3>
  // correct for rounding errors
  if (value < conv.F) {
 8012bba:	d98e2012 	ld.w      	r12, (r14, 0x48)
 8012bbe:	da6e2011 	ld.w      	r19, (r14, 0x44)
 8012bc2:	6c83      	mov      	r2, r0
 8012bc4:	c4004830 	lsli      	r16, r0, 0
 8012bc8:	6cc7      	mov      	r3, r1
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8012bca:	c4014831 	lsli      	r17, r1, 0
  if (value < conv.F) {
 8012bce:	6c33      	mov      	r0, r12
 8012bd0:	c4134821 	lsli      	r1, r19, 0
 8012bd4:	e3fff41c 	bsr      	0x801140c	// 801140c <__ltdf2>
 8012bd8:	c4104832 	lsli      	r18, r16, 0
 8012bdc:	e9a00012 	bhsz      	r0, 0x8012c00	// 8012c00 <_etoa+0x290>
    expval--;
 8012be0:	9869      	ld.w      	r3, (r14, 0x24)
 8012be2:	2b00      	subi      	r3, 1
 8012be4:	b869      	st.w      	r3, (r14, 0x24)
    conv.F /= 10;
 8012be6:	c4114821 	lsli      	r1, r17, 0
 8012bea:	3200      	movi      	r2, 0
 8012bec:	ea234024 	movih      	r3, 16420
 8012bf0:	c4104820 	lsli      	r0, r16, 0
 8012bf4:	e3fff324 	bsr      	0x801123c	// 801123c <__divdf3>
 8012bf8:	c4004832 	lsli      	r18, r0, 0
 8012bfc:	c4014831 	lsli      	r17, r1, 0
  }

  // the exponent format is "%+03d" and largest value is "307", so set aside 4-5 characters
  unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
 8012c00:	9849      	ld.w      	r2, (r14, 0x24)
 8012c02:	e4620062 	addi      	r3, r2, 99
 8012c06:	eb0300c6 	cmphsi      	r3, 199

  // in "%g" mode, "prec" is the number of *significant figures* not decimals
  if (flags & FLAGS_ADAPT_EXP) {
 8012c0a:	9866      	ld.w      	r3, (r14, 0x18)
 8012c0c:	e4632800 	andi      	r3, r3, 2048
  unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
 8012c10:	c4000510 	mvc      	r16
 8012c14:	e6100003 	addi      	r16, r16, 4
  if (flags & FLAGS_ADAPT_EXP) {
 8012c18:	e9030027 	bez      	r3, 0x8012c66	// 8012c66 <_etoa+0x2f6>
    // do we want to fall-back to "%f" mode?
    if ((value >= 1e-4) && (value < 1e6)) {
 8012c1c:	1341      	lrw      	r2, 0xeb1c432d	// 8012da0 <_etoa+0x430>
 8012c1e:	1362      	lrw      	r3, 0x3f1a36e2	// 8012da4 <_etoa+0x434>
 8012c20:	6c2b      	mov      	r0, r10
 8012c22:	6c67      	mov      	r1, r9
 8012c24:	de4e200a 	st.w      	r18, (r14, 0x28)
 8012c28:	e3fff3d2 	bsr      	0x80113cc	// 80113cc <__gedf2>
 8012c2c:	da4e200a 	ld.w      	r18, (r14, 0x28)
 8012c30:	e98000cd 	blz      	r0, 0x8012dca	// 8012dca <_etoa+0x45a>
 8012c34:	3200      	movi      	r2, 0
 8012c36:	127d      	lrw      	r3, 0x412e8480	// 8012da8 <_etoa+0x438>
 8012c38:	6c2b      	mov      	r0, r10
 8012c3a:	6c67      	mov      	r1, r9
 8012c3c:	e3fff3e8 	bsr      	0x801140c	// 801140c <__ltdf2>
 8012c40:	da4e200a 	ld.w      	r18, (r14, 0x28)
 8012c44:	e9a000c3 	bhsz      	r0, 0x8012dca	// 8012dca <_etoa+0x45a>
      if ((int)prec > expval) {
 8012c48:	9849      	ld.w      	r2, (r14, 0x24)
 8012c4a:	9867      	ld.w      	r3, (r14, 0x1c)
 8012c4c:	64c9      	cmplt      	r2, r3
 8012c4e:	0cd4      	bf      	0x8012df6	// 8012df6 <_etoa+0x486>
        prec = (unsigned)((int)prec - expval - 1);
 8012c50:	60ca      	subu      	r3, r2
 8012c52:	2b00      	subi      	r3, 1
 8012c54:	b867      	st.w      	r3, (r14, 0x1c)
      }
      else {
        prec = 0;
      }
      flags |= FLAGS_PRECISION;   // make sure _ftoa respects precision
 8012c56:	9866      	ld.w      	r3, (r14, 0x18)
 8012c58:	ec630400 	ori      	r3, r3, 1024
      // no characters in exponent
      minwidth = 0U;
 8012c5c:	ea100000 	movi      	r16, 0
      flags |= FLAGS_PRECISION;   // make sure _ftoa respects precision
 8012c60:	b866      	st.w      	r3, (r14, 0x18)
      expval   = 0;
 8012c62:	de0e2009 	st.w      	r16, (r14, 0x24)

  // will everything fit?
  unsigned int fwidth = width;
  if (width > minwidth) {
    // we didn't fall-back so subtract the characters required for the exponent
    fwidth -= minwidth;
 8012c66:	9848      	ld.w      	r2, (r14, 0x20)
 8012c68:	c602008c 	subu      	r12, r2, r16
 8012c6c:	c4500420 	cmphs      	r16, r2
  } else {
    // not enough characters, so go back to default sizing
    fwidth = 0U;
  }
  if ((flags & FLAGS_LEFT) && minwidth) {
 8012c70:	9846      	ld.w      	r2, (r14, 0x18)
 8012c72:	e4422002 	andi      	r2, r2, 2
    fwidth -= minwidth;
 8012c76:	3300      	movi      	r3, 0
 8012c78:	c5830c40 	inct      	r12, r3, 0
  if ((flags & FLAGS_LEFT) && minwidth) {
 8012c7c:	b84a      	st.w      	r2, (r14, 0x28)
 8012c7e:	e9020006 	bez      	r2, 0x8012c8a	// 8012c8a <_etoa+0x31a>
    // if we're padding on the right, DON'T pad the floating part
    fwidth = 0U;
 8012c82:	eb500000 	cmpnei      	r16, 0
 8012c86:	c5830c40 	inct      	r12, r3, 0
  }

  // rescale the float value
  if (expval) {
 8012c8a:	9869      	ld.w      	r3, (r14, 0x24)
 8012c8c:	e9230090 	bnez      	r3, 0x8012dac	// 8012dac <_etoa+0x43c>
    value /= conv.F;
  }

  // output the floating part
  const size_t start_idx = idx;
  idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
 8012c90:	3200      	movi      	r2, 0
 8012c92:	6ccb      	mov      	r3, r2
 8012c94:	6c17      	mov      	r0, r5
 8012c96:	6c53      	mov      	r1, r4
 8012c98:	c40c4831 	lsli      	r17, r12, 0
 8012c9c:	e3fff3b8 	bsr      	0x801140c	// 801140c <__ltdf2>
 8012ca0:	c411482c 	lsli      	r12, r17, 0
 8012ca4:	e980009e 	blz      	r0, 0x8012de0	// 8012de0 <_etoa+0x470>
 8012ca8:	da2e2006 	ld.w      	r17, (r14, 0x18)
 8012cac:	98a7      	ld.w      	r5, (r14, 0x1c)
 8012cae:	c5712823 	bclri      	r3, r17, 11
 8012cb2:	b864      	st.w      	r3, (r14, 0x10)
 8012cb4:	dd2e2001 	st.w      	r9, (r14, 0x4)
 8012cb8:	dd8e2003 	st.w      	r12, (r14, 0xc)
 8012cbc:	b8a2      	st.w      	r5, (r14, 0x8)
 8012cbe:	dd4e2000 	st.w      	r10, (r14, 0x0)
 8012cc2:	6ce3      	mov      	r3, r8
 8012cc4:	6caf      	mov      	r2, r11
 8012cc6:	6c5f      	mov      	r1, r7
 8012cc8:	6c1b      	mov      	r0, r6
 8012cca:	e3fffc07 	bsr      	0x80124d8	// 80124d8 <_ftoa>
 8012cce:	6d03      	mov      	r4, r0

  // output the exponent part
  if (!prec && minwidth) {
 8012cd0:	6e57      	mov      	r9, r5
 8012cd2:	e925004b 	bnez      	r5, 0x8012d68	// 8012d68 <_etoa+0x3f8>
 8012cd6:	e9100049 	bez      	r16, 0x8012d68	// 8012d68 <_etoa+0x3f8>
    // output the exponential symbol
    out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
 8012cda:	e4712020 	andi      	r3, r17, 32
 8012cde:	3b40      	cmpnei      	r3, 0
 8012ce0:	6c83      	mov      	r2, r0
 8012ce2:	ea0c0065 	movi      	r12, 101
 8012ce6:	58a2      	addi      	r5, r0, 1
 8012ce8:	3045      	movi      	r0, 69
 8012cea:	c40c0c20 	incf      	r0, r12, 0
 8012cee:	6ce3      	mov      	r3, r8
 8012cf0:	6c5f      	mov      	r1, r7
 8012cf2:	7bd9      	jsr      	r6
    // output the exponent value
    idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth-1, FLAGS_ZEROPAD | FLAGS_PLUS);
 8012cf4:	3305      	movi      	r3, 5
 8012cf6:	9849      	ld.w      	r2, (r14, 0x24)
 8012cf8:	b865      	st.w      	r3, (r14, 0x14)
 8012cfa:	330a      	movi      	r3, 10
 8012cfc:	b862      	st.w      	r3, (r14, 0x8)
 8012cfe:	4a7f      	lsri      	r3, r2, 31
 8012d00:	b861      	st.w      	r3, (r14, 0x4)
 8012d02:	e6101000 	subi      	r16, r16, 1
 8012d06:	c4020203 	abs      	r3, r2
 8012d0a:	b860      	st.w      	r3, (r14, 0x0)
 8012d0c:	de0e2004 	st.w      	r16, (r14, 0x10)
 8012d10:	6ce3      	mov      	r3, r8
 8012d12:	dd2e2003 	st.w      	r9, (r14, 0xc)
 8012d16:	6c97      	mov      	r2, r5
 8012d18:	6c5f      	mov      	r1, r7
 8012d1a:	6c1b      	mov      	r0, r6
 8012d1c:	e3fffb12 	bsr      	0x8012340	// 8012340 <_ntoa_long>
    // might need to right-pad spaces
    if (flags & FLAGS_LEFT) {
 8012d20:	986a      	ld.w      	r3, (r14, 0x28)
    idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth-1, FLAGS_ZEROPAD | FLAGS_PLUS);
 8012d22:	6d03      	mov      	r4, r0
    if (flags & FLAGS_LEFT) {
 8012d24:	e9030022 	bez      	r3, 0x8012d68	// 8012d68 <_etoa+0x3f8>
      while (idx - start_idx < width) out(' ', buffer, idx++, maxlen);
 8012d28:	c5600083 	subu      	r3, r0, r11
 8012d2c:	98a8      	ld.w      	r5, (r14, 0x20)
 8012d2e:	654c      	cmphs      	r3, r5
 8012d30:	081c      	bt      	0x8012d68	// 8012d68 <_etoa+0x3f8>
 8012d32:	6c83      	mov      	r2, r0
 8012d34:	2400      	addi      	r4, 1
 8012d36:	6ce3      	mov      	r3, r8
 8012d38:	6c5f      	mov      	r1, r7
 8012d3a:	3020      	movi      	r0, 32
 8012d3c:	7bd9      	jsr      	r6
 8012d3e:	c5640083 	subu      	r3, r4, r11
 8012d42:	654c      	cmphs      	r3, r5
 8012d44:	6c93      	mov      	r2, r4
 8012d46:	0ff7      	bf      	0x8012d34	// 8012d34 <_etoa+0x3c4>
 8012d48:	0410      	br      	0x8012d68	// 8012d68 <_etoa+0x3f8>
    return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
 8012d4a:	9866      	ld.w      	r3, (r14, 0x18)
 8012d4c:	b864      	st.w      	r3, (r14, 0x10)
 8012d4e:	9868      	ld.w      	r3, (r14, 0x20)
 8012d50:	b863      	st.w      	r3, (r14, 0xc)
 8012d52:	9867      	ld.w      	r3, (r14, 0x1c)
 8012d54:	b862      	st.w      	r3, (r14, 0x8)
 8012d56:	b881      	st.w      	r4, (r14, 0x4)
 8012d58:	b8a0      	st.w      	r5, (r14, 0x0)
 8012d5a:	6ce3      	mov      	r3, r8
 8012d5c:	6caf      	mov      	r2, r11
 8012d5e:	6c5f      	mov      	r1, r7
 8012d60:	6c1b      	mov      	r0, r6
 8012d62:	e3fffbbb 	bsr      	0x80124d8	// 80124d8 <_ftoa>
 8012d66:	6d03      	mov      	r4, r0
    }
  }
  return idx;
}
 8012d68:	6c13      	mov      	r0, r4
 8012d6a:	1414      	addi      	r14, r14, 80
 8012d6c:	ebc00058 	pop      	r4-r11, r15, r16-r17
 8012d70:	509f79fb 	.long	0x509f79fb
 8012d74:	3fd34413 	.long	0x3fd34413
 8012d78:	8b60c8b3 	.long	0x8b60c8b3
 8012d7c:	3fc68a28 	.long	0x3fc68a28
 8012d80:	636f4361 	.long	0x636f4361
 8012d84:	3fd287a7 	.long	0x3fd287a7
 8012d88:	0979a371 	.long	0x0979a371
 8012d8c:	400a934f 	.long	0x400a934f
 8012d90:	bbb55516 	.long	0xbbb55516
 8012d94:	40026bb1 	.long	0x40026bb1
 8012d98:	fefa39ef 	.long	0xfefa39ef
 8012d9c:	3fe62e42 	.long	0x3fe62e42
 8012da0:	eb1c432d 	.long	0xeb1c432d
 8012da4:	3f1a36e2 	.long	0x3f1a36e2
 8012da8:	412e8480 	.long	0x412e8480
    value /= conv.F;
 8012dac:	6c2b      	mov      	r0, r10
 8012dae:	6c67      	mov      	r1, r9
 8012db0:	c4124822 	lsli      	r2, r18, 0
 8012db4:	c4114823 	lsli      	r3, r17, 0
 8012db8:	dd8e200b 	st.w      	r12, (r14, 0x2c)
 8012dbc:	e3fff240 	bsr      	0x801123c	// 801123c <__divdf3>
 8012dc0:	6e83      	mov      	r10, r0
 8012dc2:	6e47      	mov      	r9, r1
 8012dc4:	d98e200b 	ld.w      	r12, (r14, 0x2c)
 8012dc8:	0764      	br      	0x8012c90	// 8012c90 <_etoa+0x320>
      if ((prec > 0) && (flags & FLAGS_PRECISION)) {
 8012dca:	9847      	ld.w      	r2, (r14, 0x1c)
 8012dcc:	e902ff4d 	bez      	r2, 0x8012c66	// 8012c66 <_etoa+0x2f6>
        --prec;
 8012dd0:	9873      	ld.w      	r3, (r14, 0x4c)
 8012dd2:	3b40      	cmpnei      	r3, 0
 8012dd4:	c4620c20 	incf      	r3, r2, 0
 8012dd8:	c4620d01 	dect      	r3, r2, 1
 8012ddc:	b867      	st.w      	r3, (r14, 0x1c)
 8012dde:	0744      	br      	0x8012c66	// 8012c66 <_etoa+0x2f6>
  idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
 8012de0:	ea238000 	movih      	r3, 32768
 8012de4:	60e4      	addu      	r3, r9
 8012de6:	6e4f      	mov      	r9, r3
 8012de8:	0760      	br      	0x8012ca8	// 8012ca8 <_etoa+0x338>
    value = -value;
 8012dea:	ea238000 	movih      	r3, 32768
 8012dee:	c4640029 	addu      	r9, r4, r3
 8012df2:	e800fdf7 	br      	0x80129e0	// 80129e0 <_etoa+0x70>
      if ((int)prec > expval) {
 8012df6:	3300      	movi      	r3, 0
 8012df8:	072e      	br      	0x8012c54	// 8012c54 <_etoa+0x2e4>
	...

08012dfc <_vsnprintf>:
#endif  // PRINTF_SUPPORT_FLOAT


// internal vsnprintf
static int _vsnprintf(out_fct_type out, char* buffer, const size_t maxlen, const char* format, va_list va)
{
 8012dfc:	ebe00058 	push      	r4-r11, r15, r16-r17
 8012e00:	1436      	subi      	r14, r14, 88
  unsigned int flags, width, precision, n;
  size_t idx = 0U;

  if (!buffer) {
    // use null output function
    out = _out_null;
 8012e02:	3940      	cmpnei      	r1, 0
 8012e04:	10cf      	lrw      	r6, 0x80120b8	// 8012e40 <_vsnprintf+0x44>
{
 8012e06:	6e07      	mov      	r8, r1
 8012e08:	6dcb      	mov      	r7, r2
 8012e0a:	6d4f      	mov      	r5, r3
 8012e0c:	9981      	ld.w      	r4, (r14, 0x84)
    out = _out_null;
 8012e0e:	c4c00c40 	inct      	r6, r0, 0
        format++;
        break;
      }

      case '%' :
        out('%', buffer, idx++, maxlen);
 8012e12:	ea0b0000 	movi      	r11, 0
      switch (*format) {
 8012e16:	ea89000c 	lrw      	r9, 0x8013b3c	// 8012e44 <_vsnprintf+0x48>
  while (*format)
 8012e1a:	8500      	ld.b      	r0, (r5, 0x0)
 8012e1c:	e900006f 	bez      	r0, 0x8012efa	// 8012efa <_vsnprintf+0xfe>
    if (*format != '%') {
 8012e20:	eb400025 	cmpnei      	r0, 37
 8012e24:	0860      	bt      	0x8012ee4	// 8012ee4 <_vsnprintf+0xe8>
      format++;
 8012e26:	5d42      	addi      	r2, r5, 1
    flags = 0U;
 8012e28:	3100      	movi      	r1, 0
      switch (*format) {
 8012e2a:	8200      	ld.b      	r0, (r2, 0x0)
 8012e2c:	e460101f 	subi      	r3, r0, 32
 8012e30:	74cc      	zextb      	r3, r3
 8012e32:	3b10      	cmphsi      	r3, 17
 8012e34:	6d4b      	mov      	r5, r2
 8012e36:	081d      	bt      	0x8012e70	// 8012e70 <_vsnprintf+0x74>
 8012e38:	d0690883 	ldr.w      	r3, (r9, r3 << 2)
 8012e3c:	780c      	jmp      	r3
 8012e3e:	0000      	.short	0x0000
 8012e40:	080120b8 	.long	0x080120b8
 8012e44:	08013b3c 	.long	0x08013b3c
        case '0': flags |= FLAGS_ZEROPAD; format++; n = 1U; break;
 8012e48:	ec210001 	ori      	r1, r1, 1
 8012e4c:	2200      	addi      	r2, 1
 8012e4e:	07ee      	br      	0x8012e2a	// 8012e2a <_vsnprintf+0x2e>
        case ' ': flags |= FLAGS_SPACE;   format++; n = 1U; break;
 8012e50:	ec210008 	ori      	r1, r1, 8
 8012e54:	2200      	addi      	r2, 1
 8012e56:	07ea      	br      	0x8012e2a	// 8012e2a <_vsnprintf+0x2e>
        case '#': flags |= FLAGS_HASH;    format++; n = 1U; break;
 8012e58:	ec210010 	ori      	r1, r1, 16
 8012e5c:	2200      	addi      	r2, 1
 8012e5e:	07e6      	br      	0x8012e2a	// 8012e2a <_vsnprintf+0x2e>
        case '+': flags |= FLAGS_PLUS;    format++; n = 1U; break;
 8012e60:	ec210004 	ori      	r1, r1, 4
 8012e64:	2200      	addi      	r2, 1
 8012e66:	07e2      	br      	0x8012e2a	// 8012e2a <_vsnprintf+0x2e>
        case '-': flags |= FLAGS_LEFT;    format++; n = 1U; break;
 8012e68:	ec210002 	ori      	r1, r1, 2
 8012e6c:	2200      	addi      	r2, 1
 8012e6e:	07de      	br      	0x8012e2a	// 8012e2a <_vsnprintf+0x2e>
  return (ch >= '0') && (ch <= '9');
 8012e70:	e460102f 	subi      	r3, r0, 48
    if (_is_digit(*format)) {
 8012e74:	74cc      	zextb      	r3, r3
 8012e76:	3b09      	cmphsi      	r3, 10
 8012e78:	0c5b      	bf      	0x8012f2e	// 8012f2e <_vsnprintf+0x132>
    else if (*format == '*') {
 8012e7a:	eb40002a 	cmpnei      	r0, 42
 8012e7e:	e84003c3 	bf      	0x8013604	// 8013604 <_vsnprintf+0x808>
    width = 0U;
 8012e82:	ea110000 	movi      	r17, 0
    if (*format == '.') {
 8012e86:	eb40002e 	cmpnei      	r0, 46
 8012e8a:	0c65      	bf      	0x8012f54	// 8012f54 <_vsnprintf+0x158>
    precision = 0U;
 8012e8c:	ea0a0000 	movi      	r10, 0
    switch (*format) {
 8012e90:	e4601067 	subi      	r3, r0, 104
 8012e94:	74cc      	zextb      	r3, r3
 8012e96:	3b12      	cmphsi      	r3, 19
 8012e98:	080c      	bt      	0x8012eb0	// 8012eb0 <_vsnprintf+0xb4>
 8012e9a:	1043      	lrw      	r2, 0x8013b80	// 8012ea4 <_vsnprintf+0xa8>
 8012e9c:	d0620883 	ldr.w      	r3, (r2, r3 << 2)
 8012ea0:	780c      	jmp      	r3
 8012ea2:	0000      	.short	0x0000
 8012ea4:	08013b80 	.long	0x08013b80
 8012ea8:	8501      	ld.b      	r0, (r5, 0x1)
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
 8012eaa:	ec210100 	ori      	r1, r1, 256
        format++;
 8012eae:	2500      	addi      	r5, 1
    switch (*format) {
 8012eb0:	e4601024 	subi      	r3, r0, 37
 8012eb4:	74cc      	zextb      	r3, r3
 8012eb6:	eb030053 	cmphsi      	r3, 84
 8012eba:	0815      	bt      	0x8012ee4	// 8012ee4 <_vsnprintf+0xe8>
 8012ebc:	1042      	lrw      	r2, 0x8013bcc	// 8012ec4 <_vsnprintf+0xc8>
 8012ebe:	d0620883 	ldr.w      	r3, (r2, r3 << 2)
 8012ec2:	780c      	jmp      	r3
 8012ec4:	08013bcc 	.long	0x08013bcc
        if (*format == 'l') {
 8012ec8:	8501      	ld.b      	r0, (r5, 0x1)
 8012eca:	eb40006c 	cmpnei      	r0, 108
 8012ece:	e84003ac 	bf      	0x8013626	// 8013626 <_vsnprintf+0x82a>
    switch (*format) {
 8012ed2:	e4601024 	subi      	r3, r0, 37
 8012ed6:	74cc      	zextb      	r3, r3
 8012ed8:	eb030053 	cmphsi      	r3, 84
        flags |= FLAGS_LONG;
 8012edc:	ec210100 	ori      	r1, r1, 256
        format++;
 8012ee0:	2500      	addi      	r5, 1
    switch (*format) {
 8012ee2:	0fed      	bf      	0x8012ebc	// 8012ebc <_vsnprintf+0xc0>
        format++;
        break;

      default :
        out(*format, buffer, idx++, maxlen);
        format++;
 8012ee4:	2500      	addi      	r5, 1
        out(*format, buffer, idx++, maxlen);
 8012ee6:	6caf      	mov      	r2, r11
 8012ee8:	6cdf      	mov      	r3, r7
 8012eea:	6c63      	mov      	r1, r8
 8012eec:	7bd9      	jsr      	r6
  while (*format)
 8012eee:	8500      	ld.b      	r0, (r5, 0x0)
        out(*format, buffer, idx++, maxlen);
 8012ef0:	e54b0000 	addi      	r10, r11, 1
 8012ef4:	6eeb      	mov      	r11, r10
  while (*format)
 8012ef6:	e920ff95 	bnez      	r0, 0x8012e20	// 8012e20 <_vsnprintf+0x24>
        break;
    }
  }

  // termination
  out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);
 8012efa:	65ec      	cmphs      	r11, r7
 8012efc:	e8400381 	bf      	0x80135fe	// 80135fe <_vsnprintf+0x802>
 8012f00:	5f43      	subi      	r2, r7, 1
 8012f02:	6cdf      	mov      	r3, r7
 8012f04:	6c63      	mov      	r1, r8
 8012f06:	3000      	movi      	r0, 0
 8012f08:	7bd9      	jsr      	r6

  // return written chars without terminating \0
  return (int)idx;
}
 8012f0a:	6c2f      	mov      	r0, r11
 8012f0c:	1416      	addi      	r14, r14, 88
 8012f0e:	ebc00058 	pop      	r4-r11, r15, r16-r17
        if (*format == 'h') {
 8012f12:	8501      	ld.b      	r0, (r5, 0x1)
 8012f14:	eb400068 	cmpnei      	r0, 104
 8012f18:	e8400381 	bf      	0x801361a	// 801361a <_vsnprintf+0x81e>
        flags |= FLAGS_SHORT;
 8012f1c:	ec210080 	ori      	r1, r1, 128
        format++;
 8012f20:	2500      	addi      	r5, 1
 8012f22:	07c7      	br      	0x8012eb0	// 8012eb0 <_vsnprintf+0xb4>
 8012f24:	8501      	ld.b      	r0, (r5, 0x1)
        flags |= (sizeof(intmax_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
 8012f26:	ec210200 	ori      	r1, r1, 512
        format++;
 8012f2a:	2500      	addi      	r5, 1
        break;
 8012f2c:	07c2      	br      	0x8012eb0	// 8012eb0 <_vsnprintf+0xb4>
 8012f2e:	ea110000 	movi      	r17, 0
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8012f32:	ea0d000a 	movi      	r13, 10
  while (_is_digit(**str)) {
 8012f36:	3209      	movi      	r2, 9
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8012f38:	2500      	addi      	r5, 1
 8012f3a:	f9b18440 	mula.32.l      	r0, r17, r13
 8012f3e:	e620102f 	subi      	r17, r0, 48
  while (_is_digit(**str)) {
 8012f42:	8500      	ld.b      	r0, (r5, 0x0)
  return (ch >= '0') && (ch <= '9');
 8012f44:	e460102f 	subi      	r3, r0, 48
  while (_is_digit(**str)) {
 8012f48:	74cc      	zextb      	r3, r3
 8012f4a:	64c8      	cmphs      	r2, r3
 8012f4c:	0bf6      	bt      	0x8012f38	// 8012f38 <_vsnprintf+0x13c>
    if (*format == '.') {
 8012f4e:	eb40002e 	cmpnei      	r0, 46
 8012f52:	0b9d      	bt      	0x8012e8c	// 8012e8c <_vsnprintf+0x90>
      if (_is_digit(*format)) {
 8012f54:	8501      	ld.b      	r0, (r5, 0x1)
  return (ch >= '0') && (ch <= '9');
 8012f56:	e460102f 	subi      	r3, r0, 48
      if (_is_digit(*format)) {
 8012f5a:	74cc      	zextb      	r3, r3
 8012f5c:	3b09      	cmphsi      	r3, 10
      flags |= FLAGS_PRECISION;
 8012f5e:	ec210400 	ori      	r1, r1, 1024
      format++;
 8012f62:	5d42      	addi      	r2, r5, 1
      if (_is_digit(*format)) {
 8012f64:	0813      	bt      	0x8012f8a	// 8012f8a <_vsnprintf+0x18e>
 8012f66:	6d4b      	mov      	r5, r2
 8012f68:	ea0a0000 	movi      	r10, 0
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8012f6c:	ea12000a 	movi      	r18, 10
  while (_is_digit(**str)) {
 8012f70:	3209      	movi      	r2, 9
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8012f72:	2500      	addi      	r5, 1
 8012f74:	fa4a8440 	mula.32.l      	r0, r10, r18
 8012f78:	e540102f 	subi      	r10, r0, 48
  while (_is_digit(**str)) {
 8012f7c:	8500      	ld.b      	r0, (r5, 0x0)
  return (ch >= '0') && (ch <= '9');
 8012f7e:	e460102f 	subi      	r3, r0, 48
  while (_is_digit(**str)) {
 8012f82:	74cc      	zextb      	r3, r3
 8012f84:	64c8      	cmphs      	r2, r3
 8012f86:	0bf6      	bt      	0x8012f72	// 8012f72 <_vsnprintf+0x176>
 8012f88:	0784      	br      	0x8012e90	// 8012e90 <_vsnprintf+0x94>
      else if (*format == '*') {
 8012f8a:	eb40002a 	cmpnei      	r0, 42
 8012f8e:	e84003e2 	bf      	0x8013752	// 8013752 <_vsnprintf+0x956>
      format++;
 8012f92:	6d4b      	mov      	r5, r2
 8012f94:	077c      	br      	0x8012e8c	// 8012e8c <_vsnprintf+0x90>
        uint32_t ipv4 = va_arg(va, uint32_t);
 8012f96:	5c6e      	addi      	r3, r4, 4
 8012f98:	3000      	movi      	r0, 0
 8012f9a:	dac42000 	ld.w      	r22, (r4, 0x0)
 8012f9e:	b869      	st.w      	r3, (r14, 0x24)
 8012fa0:	6d03      	mov      	r4, r0
            h = bit / 100;
 8012fa2:	ea140064 	movi      	r20, 100
            m = (bit % 100) / 10;
 8012fa6:	ea13000a 	movi      	r19, 10
                    outtxt[j++] = '0';
 8012faa:	ea170030 	movi      	r23, 48
            outtxt[j++] = '.';
 8012fae:	ea15002e 	movi      	r21, 46
 8012fb2:	ea120004 	movi      	r18, 4
            bit = (*inuint >> (8 * i)) & 0xff;
 8012fb6:	c4164043 	lsr      	r3, r22, r0
 8012fba:	74cc      	zextb      	r3, r3
            h = bit / 100;
 8012fbc:	c6838022 	divu      	r2, r3, r20
 8012fc0:	7748      	zextb      	r13, r2
            if (h)
 8012fc2:	e90d0306 	bez      	r13, 0x80135ce	// 80135ce <_vsnprintf+0x7d2>
            m = (bit % 100) / 10;
 8012fc6:	c6828422 	mult      	r2, r2, r20
 8012fca:	60ca      	subu      	r3, r2
 8012fcc:	74cc      	zextb      	r3, r3
                outtxt[j++] = '0' + h;
 8012fce:	e70e002f 	addi      	r24, r14, 48
            m = (bit % 100) / 10;
 8012fd2:	c6638022 	divu      	r2, r3, r19
                outtxt[j++] = '0' + h;
 8012fd6:	e5840000 	addi      	r12, r4, 1
 8012fda:	e5ad002f 	addi      	r13, r13, 48
 8012fde:	7730      	zextb      	r12, r12
 8012fe0:	d498002d 	str.b      	r13, (r24, r4 << 0)
            if (m)
 8012fe4:	e92202fe 	bnez      	r2, 0x80135e0	// 80135e0 <_vsnprintf+0x7e4>
                    outtxt[j++] = '0';
 8012fe8:	1a0c      	addi      	r2, r14, 48
 8012fea:	2401      	addi      	r4, 2
 8012fec:	7510      	zextb      	r4, r4
 8012fee:	d5820037 	str.b      	r23, (r2, r12 << 0)
            l = (bit % 100) % 10;
 8012ff2:	c6638022 	divu      	r2, r3, r19
 8012ff6:	c6628422 	mult      	r2, r2, r19
 8012ffa:	60ca      	subu      	r3, r2
            outtxt[j++] = '0' + l;
 8012ffc:	1a0c      	addi      	r2, r14, 48
 8012ffe:	e5840000 	addi      	r12, r4, 1
 8013002:	232f      	addi      	r3, 48
 8013004:	d4820023 	str.b      	r3, (r2, r4 << 0)
 8013008:	7730      	zextb      	r12, r12
            outtxt[j++] = '.';
 801300a:	2401      	addi      	r4, 2
 801300c:	7510      	zextb      	r4, r4
 801300e:	d5820035 	str.b      	r21, (r2, r12 << 0)
 8013012:	2007      	addi      	r0, 8
        for(i = 0; i < 4; i++)
 8013014:	e832ffd1 	bnezad      	r18, 0x8012fb6	// 8012fb6 <_vsnprintf+0x1ba>
    outtxt[j - 1] = 0;
 8013018:	e46e002e 	addi      	r3, r14, 47
 801301c:	3200      	movi      	r2, 0
 801301e:	d4830022 	str.b      	r2, (r3, r4 << 0)
    return j - 1;
 8013022:	5c63      	subi      	r3, r4, 1
        if (flags & FLAGS_PRECISION) {
 8013024:	e4412400 	andi      	r2, r1, 1024
    return j - 1;
 8013028:	6c0f      	mov      	r0, r3
          l = (l < precision ? l : precision);
 801302a:	3a40      	cmpnei      	r2, 0
 801302c:	f943cd23 	min.u32      	r3, r3, r10
        if (flags & FLAGS_PRECISION) {
 8013030:	b84a      	st.w      	r2, (r14, 0x28)
          l = (l < precision ? l : precision);
 8013032:	6c83      	mov      	r2, r0
 8013034:	c4430c40 	inct      	r2, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 8013038:	e4612002 	andi      	r3, r1, 2
          l = (l < precision ? l : precision);
 801303c:	b848      	st.w      	r2, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 801303e:	b86b      	st.w      	r3, (r14, 0x2c)
 8013040:	e9230333 	bnez      	r3, 0x80136a6	// 80136a6 <_vsnprintf+0x8aa>
          while (l++ < width) {
 8013044:	c6220420 	cmphs      	r2, r17
 8013048:	6ccb      	mov      	r3, r2
 801304a:	2300      	addi      	r3, 1
 801304c:	e86003ff 	bt      	0x801384a	// 801384a <_vsnprintf+0xa4e>
 8013050:	c5710023 	addu      	r3, r17, r11
 8013054:	5b89      	subu      	r4, r3, r2
 8013056:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8013058:	e56b0000 	addi      	r11, r11, 1
 801305c:	6cdf      	mov      	r3, r7
 801305e:	6c63      	mov      	r1, r8
 8013060:	3020      	movi      	r0, 32
 8013062:	7bd9      	jsr      	r6
          while (l++ < width) {
 8013064:	66d2      	cmpne      	r4, r11
 8013066:	6caf      	mov      	r2, r11
 8013068:	0bf8      	bt      	0x8013058	// 8013058 <_vsnprintf+0x25c>
 801306a:	e4710000 	addi      	r3, r17, 1
 801306e:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8013070:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8013074:	e9000030 	bez      	r0, 0x80130d4	// 80130d4 <_vsnprintf+0x2d8>
 8013078:	6caf      	mov      	r2, r11
 801307a:	e60e002f 	addi      	r16, r14, 48
 801307e:	d96e200a 	ld.w      	r11, (r14, 0x28)
 8013082:	0402      	br      	0x8013086	// 8013086 <_vsnprintf+0x28a>
          out(*(pstr++), buffer, idx++, maxlen);
 8013084:	6c93      	mov      	r2, r4
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8013086:	e90b0007 	bez      	r11, 0x8013094	// 8013094 <_vsnprintf+0x298>
 801308a:	e46a1000 	subi      	r3, r10, 1
 801308e:	e90a034a 	bez      	r10, 0x8013722	// 8013722 <_vsnprintf+0x926>
 8013092:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 8013094:	e6100000 	addi      	r16, r16, 1
 8013098:	6cdf      	mov      	r3, r7
 801309a:	6c63      	mov      	r1, r8
 801309c:	5a82      	addi      	r4, r2, 1
 801309e:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80130a0:	d8100000 	ld.b      	r0, (r16, 0x0)
 80130a4:	e920fff0 	bnez      	r0, 0x8013084	// 8013084 <_vsnprintf+0x288>
        if (flags & FLAGS_LEFT) {
 80130a8:	986b      	ld.w      	r3, (r14, 0x2c)
 80130aa:	e90302a5 	bez      	r3, 0x80135f4	// 80135f4 <_vsnprintf+0x7f8>
          while (l++ < width) {
 80130ae:	9868      	ld.w      	r3, (r14, 0x20)
 80130b0:	c6230420 	cmphs      	r3, r17
 80130b4:	e86002a0 	bt      	0x80135f4	// 80135f4 <_vsnprintf+0x7f8>
 80130b8:	c4910020 	addu      	r0, r17, r4
 80130bc:	c460008a 	subu      	r10, r0, r3
 80130c0:	6c93      	mov      	r2, r4
            out(' ', buffer, idx++, maxlen);
 80130c2:	e5620000 	addi      	r11, r2, 1
 80130c6:	6cdf      	mov      	r3, r7
 80130c8:	6c63      	mov      	r1, r8
 80130ca:	3020      	movi      	r0, 32
 80130cc:	7bd9      	jsr      	r6
          while (l++ < width) {
 80130ce:	66ea      	cmpne      	r10, r11
 80130d0:	6caf      	mov      	r2, r11
 80130d2:	0bf8      	bt      	0x80130c2	// 80130c2 <_vsnprintf+0x2c6>
        format++;
 80130d4:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 80130d6:	9889      	ld.w      	r4, (r14, 0x24)
 80130d8:	06a1      	br      	0x8012e1a	// 8012e1a <_vsnprintf+0x1e>
        const char* p = va_arg(va, char*);
 80130da:	da042000 	ld.w      	r16, (r4, 0x0)
 80130de:	5c6e      	addi      	r3, r4, 4
 80130e0:	b868      	st.w      	r3, (r14, 0x20)
  for (s = str; *s && maxsize--; ++s);
 80130e2:	d8100000 	ld.b      	r0, (r16, 0x0)
        unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
 80130e6:	3300      	movi      	r3, 0
 80130e8:	2b00      	subi      	r3, 1
 80130ea:	eb4a0000 	cmpnei      	r10, 0
 80130ee:	c46a0c40 	inct      	r3, r10, 0
  for (s = str; *s && maxsize--; ++s);
 80130f2:	c4104824 	lsli      	r4, r16, 0
 80130f6:	e9200006 	bnez      	r0, 0x8013102	// 8013102 <_vsnprintf+0x306>
 80130fa:	0408      	br      	0x801310a	// 801310a <_vsnprintf+0x30e>
 80130fc:	2b00      	subi      	r3, 1
 80130fe:	e9030006 	bez      	r3, 0x801310a	// 801310a <_vsnprintf+0x30e>
 8013102:	2400      	addi      	r4, 1
 8013104:	8440      	ld.b      	r2, (r4, 0x0)
 8013106:	e922fffb 	bnez      	r2, 0x80130fc	// 80130fc <_vsnprintf+0x300>
  return (unsigned int)(s - str);
 801310a:	c6040084 	subu      	r4, r4, r16
        if (flags & FLAGS_PRECISION) {
 801310e:	e4412400 	andi      	r2, r1, 1024
          l = (l < precision ? l : precision);
 8013112:	f944cd23 	min.u32      	r3, r4, r10
 8013116:	3a40      	cmpnei      	r2, 0
 8013118:	c4830c40 	inct      	r4, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 801311c:	e4612002 	andi      	r3, r1, 2
        if (flags & FLAGS_PRECISION) {
 8013120:	b849      	st.w      	r2, (r14, 0x24)
        if (!(flags & FLAGS_LEFT)) {
 8013122:	b86a      	st.w      	r3, (r14, 0x28)
 8013124:	e9230287 	bnez      	r3, 0x8013632	// 8013632 <_vsnprintf+0x836>
          while (l++ < width) {
 8013128:	c6240420 	cmphs      	r4, r17
 801312c:	5c62      	addi      	r3, r4, 1
 801312e:	e860039c 	bt      	0x8013866	// 8013866 <_vsnprintf+0xa6a>
 8013132:	c5710023 	addu      	r3, r17, r11
 8013136:	5b91      	subu      	r4, r3, r4
 8013138:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 801313a:	e5620000 	addi      	r11, r2, 1
 801313e:	6cdf      	mov      	r3, r7
 8013140:	6c63      	mov      	r1, r8
 8013142:	3020      	movi      	r0, 32
 8013144:	7bd9      	jsr      	r6
          while (l++ < width) {
 8013146:	66d2      	cmpne      	r4, r11
 8013148:	6caf      	mov      	r2, r11
 801314a:	0bf8      	bt      	0x801313a	// 801313a <_vsnprintf+0x33e>
 801314c:	c40b4832 	lsli      	r18, r11, 0
 8013150:	e4910000 	addi      	r4, r17, 1
 8013154:	d8100000 	ld.b      	r0, (r16, 0x0)
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8013158:	e9000391 	bez      	r0, 0x801387a	// 801387a <_vsnprintf+0xa7e>
 801315c:	b88b      	st.w      	r4, (r14, 0x2c)
 801315e:	c4124822 	lsli      	r2, r18, 0
 8013162:	d96e2009 	ld.w      	r11, (r14, 0x24)
 8013166:	0402      	br      	0x801316a	// 801316a <_vsnprintf+0x36e>
          out(*(p++), buffer, idx++, maxlen);
 8013168:	6c93      	mov      	r2, r4
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801316a:	e90b0007 	bez      	r11, 0x8013178	// 8013178 <_vsnprintf+0x37c>
 801316e:	e46a1000 	subi      	r3, r10, 1
 8013172:	e90a02d2 	bez      	r10, 0x8013716	// 8013716 <_vsnprintf+0x91a>
 8013176:	6e8f      	mov      	r10, r3
          out(*(p++), buffer, idx++, maxlen);
 8013178:	e6100000 	addi      	r16, r16, 1
 801317c:	6cdf      	mov      	r3, r7
 801317e:	6c63      	mov      	r1, r8
 8013180:	5a82      	addi      	r4, r2, 1
 8013182:	7bd9      	jsr      	r6
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8013184:	d8100000 	ld.b      	r0, (r16, 0x0)
 8013188:	e920fff0 	bnez      	r0, 0x8013168	// 8013168 <_vsnprintf+0x36c>
 801318c:	6ed3      	mov      	r11, r4
 801318e:	988b      	ld.w      	r4, (r14, 0x2c)
        if (flags & FLAGS_LEFT) {
 8013190:	986a      	ld.w      	r3, (r14, 0x28)
 8013192:	e9030012 	bez      	r3, 0x80131b6	// 80131b6 <_vsnprintf+0x3ba>
          while (l++ < width) {
 8013196:	c6240420 	cmphs      	r4, r17
 801319a:	080e      	bt      	0x80131b6	// 80131b6 <_vsnprintf+0x3ba>
 801319c:	c5710020 	addu      	r0, r17, r11
 80131a0:	5891      	subu      	r4, r0, r4
 80131a2:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 80131a4:	e56b0000 	addi      	r11, r11, 1
 80131a8:	6cdf      	mov      	r3, r7
 80131aa:	6c63      	mov      	r1, r8
 80131ac:	3020      	movi      	r0, 32
 80131ae:	7bd9      	jsr      	r6
          while (l++ < width) {
 80131b0:	66d2      	cmpne      	r4, r11
 80131b2:	6caf      	mov      	r2, r11
 80131b4:	0bf8      	bt      	0x80131a4	// 80131a4 <_vsnprintf+0x3a8>
        format++;
 80131b6:	2500      	addi      	r5, 1
        const char* p = va_arg(va, char*);
 80131b8:	9888      	ld.w      	r4, (r14, 0x20)
        break;
 80131ba:	0630      	br      	0x8012e1a	// 8012e1a <_vsnprintf+0x1e>
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 80131bc:	3308      	movi      	r3, 8
 80131be:	b864      	st.w      	r3, (r14, 0x10)
 80131c0:	3310      	movi      	r3, 16
 80131c2:	b862      	st.w      	r3, (r14, 0x8)
        flags |= FLAGS_ZEROPAD | FLAGS_UPPERCASE;
 80131c4:	ec210021 	ori      	r1, r1, 33
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 80131c8:	3300      	movi      	r3, 0
 80131ca:	b825      	st.w      	r1, (r14, 0x14)
 80131cc:	dd4e2003 	st.w      	r10, (r14, 0xc)
 80131d0:	b861      	st.w      	r3, (r14, 0x4)
 80131d2:	9460      	ld.w      	r3, (r4, 0x0)
 80131d4:	b860      	st.w      	r3, (r14, 0x0)
 80131d6:	6caf      	mov      	r2, r11
 80131d8:	6cdf      	mov      	r3, r7
 80131da:	6c63      	mov      	r1, r8
 80131dc:	6c1b      	mov      	r0, r6
 80131de:	e6040003 	addi      	r16, r4, 4
 80131e2:	e3fff8af 	bsr      	0x8012340	// 8012340 <_ntoa_long>
 80131e6:	6ec3      	mov      	r11, r0
        format++;
 80131e8:	2500      	addi      	r5, 1
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 80131ea:	c4104824 	lsli      	r4, r16, 0
        break;
 80131ee:	0616      	br      	0x8012e1a	// 8012e1a <_vsnprintf+0x1e>
        if (!(flags & FLAGS_LEFT)) {
 80131f0:	e4212002 	andi      	r1, r1, 2
 80131f4:	e9210227 	bnez      	r1, 0x8013642	// 8013642 <_vsnprintf+0x846>
          while (l++ < width) {
 80131f8:	3301      	movi      	r3, 1
 80131fa:	c6230420 	cmphs      	r3, r17
 80131fe:	e860032f 	bt      	0x801385c	// 801385c <_vsnprintf+0xa60>
 8013202:	e60b1000 	subi      	r16, r11, 1
 8013206:	c6300030 	addu      	r16, r16, r17
 801320a:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 801320c:	e5420000 	addi      	r10, r2, 1
 8013210:	6cdf      	mov      	r3, r7
 8013212:	6c63      	mov      	r1, r8
 8013214:	3020      	movi      	r0, 32
 8013216:	7bd9      	jsr      	r6
          while (l++ < width) {
 8013218:	c5500480 	cmpne      	r16, r10
 801321c:	6cab      	mov      	r2, r10
 801321e:	0bf7      	bt      	0x801320c	// 801320c <_vsnprintf+0x410>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8013220:	8400      	ld.b      	r0, (r4, 0x0)
 8013222:	e6040003 	addi      	r16, r4, 4
 8013226:	6cdf      	mov      	r3, r7
 8013228:	6cab      	mov      	r2, r10
 801322a:	6c63      	mov      	r1, r8
 801322c:	e56a0000 	addi      	r11, r10, 1
 8013230:	7bd9      	jsr      	r6
 8013232:	c4104824 	lsli      	r4, r16, 0
        format++;
 8013236:	2500      	addi      	r5, 1
        break;
 8013238:	e800fdf1 	br      	0x8012e1a	// 8012e1a <_vsnprintf+0x1e>
        if (*format == 'x' || *format == 'X') {
 801323c:	eb400078 	cmpnei      	r0, 120
 8013240:	e8400277 	bf      	0x801372e	// 801372e <_vsnprintf+0x932>
 8013244:	eb400058 	cmpnei      	r0, 88
 8013248:	e8400275 	bf      	0x8013732	// 8013732 <_vsnprintf+0x936>
        else if (*format == 'o') {
 801324c:	eb40006f 	cmpnei      	r0, 111
 8013250:	e8400232 	bf      	0x80136b4	// 80136b4 <_vsnprintf+0x8b8>
        else if (*format == 'b') {
 8013254:	eb400062 	cmpnei      	r0, 98
 8013258:	e84002d5 	bf      	0x8013802	// 8013802 <_vsnprintf+0xa06>
        if ((*format != 'i') && (*format != 'd')) {
 801325c:	eb400069 	cmpnei      	r0, 105
          flags &= ~FLAGS_HASH;   // no hash for dec format
 8013260:	c4812823 	bclri      	r3, r1, 4
        if ((*format != 'i') && (*format != 'd')) {
 8013264:	e8600232 	bt      	0x80136c8	// 80136c8 <_vsnprintf+0x8cc>
        if (flags & FLAGS_PRECISION) {
 8013268:	e4212400 	andi      	r1, r1, 1024
          base = 10U;
 801326c:	320a      	movi      	r2, 10
        if (flags & FLAGS_PRECISION) {
 801326e:	e9010236 	bez      	r1, 0x80136da	// 80136da <_vsnprintf+0x8de>
          flags &= ~FLAGS_ZEROPAD;
 8013272:	3b80      	bclri      	r3, 0
        if ((*format == 'i') || (*format == 'd')) {
 8013274:	eb400069 	cmpnei      	r0, 105
 8013278:	e8400231 	bf      	0x80136da	// 80136da <_vsnprintf+0x8de>
 801327c:	eb400064 	cmpnei      	r0, 100
 8013280:	e840022d 	bf      	0x80136da	// 80136da <_vsnprintf+0x8de>
          if (flags & FLAGS_LONG_LONG) {
 8013284:	e4232200 	andi      	r1, r3, 512
 8013288:	e9210276 	bnez      	r1, 0x8013774	// 8013774 <_vsnprintf+0x978>
          else if (flags & FLAGS_LONG) {
 801328c:	e4032100 	andi      	r0, r3, 256
 8013290:	e92002a2 	bnez      	r0, 0x80137d4	// 80137d4 <_vsnprintf+0x9d8>
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 8013294:	e4232040 	andi      	r1, r3, 64
 8013298:	e92102cf 	bnez      	r1, 0x8013836	// 8013836 <_vsnprintf+0xa3a>
 801329c:	e4232080 	andi      	r1, r3, 128
 80132a0:	e92102b3 	bnez      	r1, 0x8013806	// 8013806 <_vsnprintf+0xa0a>
 80132a4:	9420      	ld.w      	r1, (r4, 0x0)
 80132a6:	2403      	addi      	r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
 80132a8:	b865      	st.w      	r3, (r14, 0x14)
 80132aa:	3300      	movi      	r3, 0
 80132ac:	de2e2004 	st.w      	r17, (r14, 0x10)
 80132b0:	dd4e2003 	st.w      	r10, (r14, 0xc)
 80132b4:	b842      	st.w      	r2, (r14, 0x8)
 80132b6:	b861      	st.w      	r3, (r14, 0x4)
 80132b8:	b820      	st.w      	r1, (r14, 0x0)
 80132ba:	6caf      	mov      	r2, r11
 80132bc:	6cdf      	mov      	r3, r7
 80132be:	6c63      	mov      	r1, r8
 80132c0:	6c1b      	mov      	r0, r6
 80132c2:	e3fff83f 	bsr      	0x8012340	// 8012340 <_ntoa_long>
 80132c6:	6ec3      	mov      	r11, r0
        format++;
 80132c8:	2500      	addi      	r5, 1
 80132ca:	e800fda8 	br      	0x8012e1a	// 8012e1a <_vsnprintf+0x1e>
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
 80132ce:	eb400046 	cmpnei      	r0, 70
 80132d2:	e840023c 	bf      	0x801374a	// 801374a <_vsnprintf+0x94e>
        idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 80132d6:	b824      	st.w      	r1, (r14, 0x10)
 80132d8:	de2e2003 	st.w      	r17, (r14, 0xc)
 80132dc:	dd4e2002 	st.w      	r10, (r14, 0x8)
 80132e0:	e6040007 	addi      	r16, r4, 8
 80132e4:	9460      	ld.w      	r3, (r4, 0x0)
 80132e6:	9481      	ld.w      	r4, (r4, 0x4)
 80132e8:	b860      	st.w      	r3, (r14, 0x0)
 80132ea:	b881      	st.w      	r4, (r14, 0x4)
 80132ec:	6caf      	mov      	r2, r11
 80132ee:	6cdf      	mov      	r3, r7
 80132f0:	6c63      	mov      	r1, r8
 80132f2:	6c1b      	mov      	r0, r6
 80132f4:	e3fff8f2 	bsr      	0x80124d8	// 80124d8 <_ftoa>
 80132f8:	6ec3      	mov      	r11, r0
        format++;
 80132fa:	2500      	addi      	r5, 1
        idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 80132fc:	c4104824 	lsli      	r4, r16, 0
        break;
 8013300:	e800fd8d 	br      	0x8012e1a	// 8012e1a <_vsnprintf+0x1e>
        out('%', buffer, idx++, maxlen);
 8013304:	6caf      	mov      	r2, r11
 8013306:	e54b0000 	addi      	r10, r11, 1
 801330a:	6cdf      	mov      	r3, r7
 801330c:	6c63      	mov      	r1, r8
 801330e:	3025      	movi      	r0, 37
 8013310:	7bd9      	jsr      	r6
        format++;
 8013312:	2500      	addi      	r5, 1
        out('%', buffer, idx++, maxlen);
 8013314:	6eeb      	mov      	r11, r10
        break;
 8013316:	e800fd82 	br      	0x8012e1a	// 8012e1a <_vsnprintf+0x1e>
        char *ipv6 = va_arg(va, char*);
 801331a:	5c6e      	addi      	r3, r4, 4
 801331c:	dac42000 	ld.w      	r22, (r4, 0x0)
 8013320:	b869      	st.w      	r3, (r14, 0x24)
 8013322:	e716000f 	addi      	r24, r22, 16
 8013326:	3400      	movi      	r4, 0
                if (h > 9)
 8013328:	ea140009 	movi      	r20, 9
                    outtxt[j++] = ':';
 801332c:	ea17003a 	movi      	r23, 58
          while (l++ < width) {
 8013330:	ea0c0000 	movi      	r12, 0
 8013334:	da562000 	ld.w      	r18, (r22, 0x0)
 8013338:	6c33      	mov      	r0, r12
 801333a:	ea0d0004 	movi      	r13, 4
                m = (*inuint >> (8 * i)) & 0xff;
 801333e:	c5924043 	lsr      	r3, r18, r12
 8013342:	74cc      	zextb      	r3, r3
                h = m >> 4;
 8013344:	4b44      	lsri      	r2, r3, 4
                if (h > 9)
 8013346:	c4540420 	cmphs      	r20, r2
                    outtxt[j++] = 'A' + h - 10;
 801334a:	e6640000 	addi      	r19, r4, 1
                l = m & 0xf;
 801334e:	e463200f 	andi      	r3, r3, 15
                    outtxt[j++] = 'A' + h - 10;
 8013352:	c41354f3 	zext      	r19, r19, 7, 0
                if (h > 9)
 8013356:	092e      	bt      	0x80135b2	// 80135b2 <_vsnprintf+0x7b6>
                    outtxt[j++] = 'A' + h - 10;
 8013358:	e6ae002f 	addi      	r21, r14, 48
 801335c:	2236      	addi      	r2, 55
 801335e:	d4950022 	str.b      	r2, (r21, r4 << 0)
                if (l > 9)
 8013362:	c4740420 	cmphs      	r20, r3
                    outtxt[j++] = 'A' + l - 10;
 8013366:	e4930000 	addi      	r4, r19, 1
 801336a:	7510      	zextb      	r4, r4
                if (l > 9)
 801336c:	091e      	bt      	0x80135a8	// 80135a8 <_vsnprintf+0x7ac>
                    outtxt[j++] = 'A' + l - 10;
 801336e:	1a0c      	addi      	r2, r14, 48
 8013370:	2336      	addi      	r3, 55
 8013372:	d6620023 	str.b      	r3, (r2, r19 << 0)
                if (0 != (i % 2))
 8013376:	e4602001 	andi      	r3, r0, 1
 801337a:	e9030007 	bez      	r3, 0x8013388	// 8013388 <_vsnprintf+0x58c>
                    outtxt[j++] = ':';
 801337e:	1a0c      	addi      	r2, r14, 48
 8013380:	5c62      	addi      	r3, r4, 1
 8013382:	d4820037 	str.b      	r23, (r2, r4 << 0)
 8013386:	750c      	zextb      	r4, r3
            for(i = 0; i < 4; i++)
 8013388:	2000      	addi      	r0, 1
 801338a:	7400      	zextb      	r0, r0
 801338c:	e58c0007 	addi      	r12, r12, 8
 8013390:	e82dffd7 	bnezad      	r13, 0x801333e	// 801333e <_vsnprintf+0x542>
            inuint++;
 8013394:	e6d60003 	addi      	r22, r22, 4
        for (k = 0; k < 4; k++)
 8013398:	c6d80480 	cmpne      	r24, r22
 801339c:	0bca      	bt      	0x8013330	// 8013330 <_vsnprintf+0x534>
    outtxt[j - 1] = 0;
 801339e:	e46e002e 	addi      	r3, r14, 47
 80133a2:	3200      	movi      	r2, 0
 80133a4:	d4830022 	str.b      	r2, (r3, r4 << 0)
    return j - 1;
 80133a8:	5c63      	subi      	r3, r4, 1
        if (flags & FLAGS_PRECISION) {
 80133aa:	e4412400 	andi      	r2, r1, 1024
    return j - 1;
 80133ae:	6c0f      	mov      	r0, r3
          l = (l < precision ? l : precision);
 80133b0:	3a40      	cmpnei      	r2, 0
 80133b2:	f943cd23 	min.u32      	r3, r3, r10
        if (flags & FLAGS_PRECISION) {
 80133b6:	b84a      	st.w      	r2, (r14, 0x28)
          l = (l < precision ? l : precision);
 80133b8:	6c83      	mov      	r2, r0
 80133ba:	c4430c40 	inct      	r2, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 80133be:	e4612002 	andi      	r3, r1, 2
          l = (l < precision ? l : precision);
 80133c2:	b848      	st.w      	r2, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 80133c4:	b86b      	st.w      	r3, (r14, 0x2c)
 80133c6:	e923015a 	bnez      	r3, 0x801367a	// 801367a <_vsnprintf+0x87e>
          while (l++ < width) {
 80133ca:	c6220420 	cmphs      	r2, r17
 80133ce:	6ccb      	mov      	r3, r2
 80133d0:	2300      	addi      	r3, 1
 80133d2:	e8600239 	bt      	0x8013844	// 8013844 <_vsnprintf+0xa48>
 80133d6:	c5710023 	addu      	r3, r17, r11
 80133da:	5b89      	subu      	r4, r3, r2
 80133dc:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 80133de:	e56b0000 	addi      	r11, r11, 1
 80133e2:	6cdf      	mov      	r3, r7
 80133e4:	6c63      	mov      	r1, r8
 80133e6:	3020      	movi      	r0, 32
 80133e8:	7bd9      	jsr      	r6
          while (l++ < width) {
 80133ea:	66d2      	cmpne      	r4, r11
 80133ec:	6caf      	mov      	r2, r11
 80133ee:	0bf8      	bt      	0x80133de	// 80133de <_vsnprintf+0x5e2>
 80133f0:	e4710000 	addi      	r3, r17, 1
 80133f4:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80133f6:	d80e0030 	ld.b      	r0, (r14, 0x30)
 80133fa:	e900fe6d 	bez      	r0, 0x80130d4	// 80130d4 <_vsnprintf+0x2d8>
 80133fe:	6caf      	mov      	r2, r11
 8013400:	e60e002f 	addi      	r16, r14, 48
 8013404:	d96e200a 	ld.w      	r11, (r14, 0x28)
 8013408:	0402      	br      	0x801340c	// 801340c <_vsnprintf+0x610>
          out(*(pstr++), buffer, idx++, maxlen);
 801340a:	6c93      	mov      	r2, r4
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801340c:	e90b0007 	bez      	r11, 0x801341a	// 801341a <_vsnprintf+0x61e>
 8013410:	e46a1000 	subi      	r3, r10, 1
 8013414:	e90a0185 	bez      	r10, 0x801371e	// 801371e <_vsnprintf+0x922>
 8013418:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 801341a:	e6100000 	addi      	r16, r16, 1
 801341e:	6cdf      	mov      	r3, r7
 8013420:	6c63      	mov      	r1, r8
 8013422:	5a82      	addi      	r4, r2, 1
 8013424:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8013426:	d8100000 	ld.b      	r0, (r16, 0x0)
 801342a:	e920fff0 	bnez      	r0, 0x801340a	// 801340a <_vsnprintf+0x60e>
        if (flags & FLAGS_LEFT) {
 801342e:	986b      	ld.w      	r3, (r14, 0x2c)
 8013430:	e90300e2 	bez      	r3, 0x80135f4	// 80135f4 <_vsnprintf+0x7f8>
          while (l++ < width) {
 8013434:	9868      	ld.w      	r3, (r14, 0x20)
 8013436:	c6230420 	cmphs      	r3, r17
 801343a:	08dd      	bt      	0x80135f4	// 80135f4 <_vsnprintf+0x7f8>
 801343c:	c4910020 	addu      	r0, r17, r4
 8013440:	c460008a 	subu      	r10, r0, r3
 8013444:	6c93      	mov      	r2, r4
            out(' ', buffer, idx++, maxlen);
 8013446:	e5620000 	addi      	r11, r2, 1
 801344a:	6cdf      	mov      	r3, r7
 801344c:	6c63      	mov      	r1, r8
 801344e:	3020      	movi      	r0, 32
 8013450:	7bd9      	jsr      	r6
          while (l++ < width) {
 8013452:	66ea      	cmpne      	r10, r11
 8013454:	6caf      	mov      	r2, r11
 8013456:	0bf8      	bt      	0x8013446	// 8013446 <_vsnprintf+0x64a>
        format++;
 8013458:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 801345a:	9889      	ld.w      	r4, (r14, 0x24)
 801345c:	e800fcdf 	br      	0x8012e1a	// 8012e1a <_vsnprintf+0x1e>
        const char* p = va_arg(va, char*);
 8013460:	5c6e      	addi      	r3, r4, 4
 8013462:	b869      	st.w      	r3, (r14, 0x24)
 8013464:	da642000 	ld.w      	r19, (r4, 0x0)
 8013468:	1a0c      	addi      	r2, r14, 48
        if (hbit > 9)
 801346a:	ea140009 	movi      	r20, 9
        outtxt[3 * i + 2] = '-';
 801346e:	ea15002d 	movi      	r21, 45
 8013472:	ea120006 	movi      	r18, 6
        hbit = (*(inchar + i) & 0xf0) >> 4;
 8013476:	d8730000 	ld.b      	r3, (r19, 0x0)
 801347a:	4b04      	lsri      	r0, r3, 4
        if (hbit > 9)
 801347c:	c4140420 	cmphs      	r20, r0
        lbit = *(inchar + i ) & 0x0f;
 8013480:	e463200f 	andi      	r3, r3, 15
        if (hbit > 9)
 8013484:	089d      	bt      	0x80135be	// 80135be <_vsnprintf+0x7c2>
        if (lbit > 9)
 8013486:	c4740420 	cmphs      	r20, r3
            outtxt[3 * i] = 'A' + hbit - 10;
 801348a:	2036      	addi      	r0, 55
 801348c:	a200      	st.b      	r0, (r2, 0x0)
        if (lbit > 9)
 801348e:	089d      	bt      	0x80135c8	// 80135c8 <_vsnprintf+0x7cc>
            outtxt[3 * i + 1] = 'A' + lbit - 10;
 8013490:	2336      	addi      	r3, 55
 8013492:	a261      	st.b      	r3, (r2, 0x1)
        outtxt[3 * i + 2] = '-';
 8013494:	dea20002 	st.b      	r21, (r2, 0x2)
 8013498:	e6730000 	addi      	r19, r19, 1
 801349c:	2202      	addi      	r2, 3
    for(i = 0; i < 6; i++)/* mac length */
 801349e:	e832ffec 	bnezad      	r18, 0x8013476	// 8013476 <_vsnprintf+0x67a>
    outtxt[3 * (i - 1) + 2] = 0;
 80134a2:	3300      	movi      	r3, 0
 80134a4:	dc6e0041 	st.b      	r3, (r14, 0x41)
        if (flags & FLAGS_PRECISION) {
 80134a8:	e4612400 	andi      	r3, r1, 1024
 80134ac:	b86a      	st.w      	r3, (r14, 0x28)
 80134ae:	e90300f3 	bez      	r3, 0x8013694	// 8013694 <_vsnprintf+0x898>
          l = (l < precision ? l : precision);
 80134b2:	ea100011 	movi      	r16, 17
 80134b6:	fa0acd23 	min.u32      	r3, r10, r16
 80134ba:	b868      	st.w      	r3, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 80134bc:	e4612002 	andi      	r3, r1, 2
 80134c0:	b86b      	st.w      	r3, (r14, 0x2c)
 80134c2:	e92300e2 	bnez      	r3, 0x8013686	// 8013686 <_vsnprintf+0x88a>
          while (l++ < width) {
 80134c6:	9848      	ld.w      	r2, (r14, 0x20)
 80134c8:	c6220420 	cmphs      	r2, r17
 80134cc:	6ccb      	mov      	r3, r2
 80134ce:	2300      	addi      	r3, 1
 80134d0:	09c9      	bt      	0x8013862	// 8013862 <_vsnprintf+0xa66>
 80134d2:	c5710023 	addu      	r3, r17, r11
 80134d6:	c4430090 	subu      	r16, r3, r2
 80134da:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 80134dc:	e56b0000 	addi      	r11, r11, 1
 80134e0:	6cdf      	mov      	r3, r7
 80134e2:	6c63      	mov      	r1, r8
 80134e4:	3020      	movi      	r0, 32
 80134e6:	7bd9      	jsr      	r6
          while (l++ < width) {
 80134e8:	c60b0480 	cmpne      	r11, r16
 80134ec:	6caf      	mov      	r2, r11
 80134ee:	0bf7      	bt      	0x80134dc	// 80134dc <_vsnprintf+0x6e0>
 80134f0:	e4710000 	addi      	r3, r17, 1
 80134f4:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80134f6:	d80e0030 	ld.b      	r0, (r14, 0x30)
 80134fa:	e900fded 	bez      	r0, 0x80130d4	// 80130d4 <_vsnprintf+0x2d8>
 80134fe:	6caf      	mov      	r2, r11
 8013500:	1c0c      	addi      	r4, r14, 48
 8013502:	d96e200a 	ld.w      	r11, (r14, 0x28)
 8013506:	0403      	br      	0x801350c	// 801350c <_vsnprintf+0x710>
          out(*(pstr++), buffer, idx++, maxlen);
 8013508:	c4104822 	lsli      	r2, r16, 0
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801350c:	e90b0007 	bez      	r11, 0x801351a	// 801351a <_vsnprintf+0x71e>
 8013510:	e46a1000 	subi      	r3, r10, 1
 8013514:	e90a010a 	bez      	r10, 0x8013728	// 8013728 <_vsnprintf+0x92c>
 8013518:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 801351a:	2400      	addi      	r4, 1
 801351c:	6cdf      	mov      	r3, r7
 801351e:	6c63      	mov      	r1, r8
 8013520:	e6020000 	addi      	r16, r2, 1
 8013524:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8013526:	8400      	ld.b      	r0, (r4, 0x0)
 8013528:	e920fff0 	bnez      	r0, 0x8013508	// 8013508 <_vsnprintf+0x70c>
        if (flags & FLAGS_LEFT) {
 801352c:	986b      	ld.w      	r3, (r14, 0x2c)
 801352e:	e90300b6 	bez      	r3, 0x801369a	// 801369a <_vsnprintf+0x89e>
          while (l++ < width) {
 8013532:	9868      	ld.w      	r3, (r14, 0x20)
 8013534:	c6230420 	cmphs      	r3, r17
 8013538:	08b1      	bt      	0x801369a	// 801369a <_vsnprintf+0x89e>
 801353a:	c6110020 	addu      	r0, r17, r16
 801353e:	588d      	subu      	r4, r0, r3
 8013540:	c4104822 	lsli      	r2, r16, 0
            out(' ', buffer, idx++, maxlen);
 8013544:	e5620000 	addi      	r11, r2, 1
 8013548:	6cdf      	mov      	r3, r7
 801354a:	6c63      	mov      	r1, r8
 801354c:	3020      	movi      	r0, 32
 801354e:	7bd9      	jsr      	r6
          while (l++ < width) {
 8013550:	652e      	cmpne      	r11, r4
 8013552:	6caf      	mov      	r2, r11
 8013554:	0bf8      	bt      	0x8013544	// 8013544 <_vsnprintf+0x748>
        format++;
 8013556:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8013558:	9889      	ld.w      	r4, (r14, 0x24)
 801355a:	e800fc60 	br      	0x8012e1a	// 8012e1a <_vsnprintf+0x1e>
        if ((*format == 'g')||(*format == 'G')) flags |= FLAGS_ADAPT_EXP;
 801355e:	e46020df 	andi      	r3, r0, 223
 8013562:	eb430047 	cmpnei      	r3, 71
 8013566:	0805      	bt      	0x8013570	// 8013570 <_vsnprintf+0x774>
 8013568:	ec210800 	ori      	r1, r1, 2048
        if ((*format == 'E')||(*format == 'G')) flags |= FLAGS_UPPERCASE;
 801356c:	e40020fd 	andi      	r0, r0, 253
 8013570:	eb400045 	cmpnei      	r0, 69
 8013574:	0803      	bt      	0x801357a	// 801357a <_vsnprintf+0x77e>
 8013576:	ec210020 	ori      	r1, r1, 32
        idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 801357a:	b824      	st.w      	r1, (r14, 0x10)
 801357c:	de2e2003 	st.w      	r17, (r14, 0xc)
 8013580:	dd4e2002 	st.w      	r10, (r14, 0x8)
 8013584:	e6040007 	addi      	r16, r4, 8
 8013588:	9460      	ld.w      	r3, (r4, 0x0)
 801358a:	9481      	ld.w      	r4, (r4, 0x4)
 801358c:	b860      	st.w      	r3, (r14, 0x0)
 801358e:	b881      	st.w      	r4, (r14, 0x4)
 8013590:	6caf      	mov      	r2, r11
 8013592:	6cdf      	mov      	r3, r7
 8013594:	6c63      	mov      	r1, r8
 8013596:	6c1b      	mov      	r0, r6
 8013598:	e3fff9ec 	bsr      	0x8012970	// 8012970 <_etoa>
 801359c:	6ec3      	mov      	r11, r0
        format++;
 801359e:	2500      	addi      	r5, 1
        idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 80135a0:	c4104824 	lsli      	r4, r16, 0
        break;
 80135a4:	e800fc3b 	br      	0x8012e1a	// 8012e1a <_vsnprintf+0x1e>
                    outtxt[j++] = '0' + l;
 80135a8:	1a0c      	addi      	r2, r14, 48
 80135aa:	232f      	addi      	r3, 48
 80135ac:	d6620023 	str.b      	r3, (r2, r19 << 0)
 80135b0:	06e3      	br      	0x8013376	// 8013376 <_vsnprintf+0x57a>
                    outtxt[j++]= '0' + h;
 80135b2:	e6ae002f 	addi      	r21, r14, 48
 80135b6:	222f      	addi      	r2, 48
 80135b8:	d4950022 	str.b      	r2, (r21, r4 << 0)
 80135bc:	06d3      	br      	0x8013362	// 8013362 <_vsnprintf+0x566>
        if (lbit > 9)
 80135be:	c4740420 	cmphs      	r20, r3
            outtxt[3 * i]= '0' + hbit;
 80135c2:	202f      	addi      	r0, 48
 80135c4:	a200      	st.b      	r0, (r2, 0x0)
        if (lbit > 9)
 80135c6:	0f65      	bf      	0x8013490	// 8013490 <_vsnprintf+0x694>
            outtxt[3 * i + 1] = '0' + lbit;
 80135c8:	232f      	addi      	r3, 48
 80135ca:	a261      	st.b      	r3, (r2, 0x1)
 80135cc:	0764      	br      	0x8013494	// 8013494 <_vsnprintf+0x698>
            m = (bit % 100) / 10;
 80135ce:	c6828422 	mult      	r2, r2, r20
 80135d2:	60ca      	subu      	r3, r2
 80135d4:	74cc      	zextb      	r3, r3
 80135d6:	c6638022 	divu      	r2, r3, r19
            if (m)
 80135da:	e902fd0c 	bez      	r2, 0x8012ff2	// 8012ff2 <_vsnprintf+0x1f6>
 80135de:	6f13      	mov      	r12, r4
                outtxt[j++] = '0' + m;
 80135e0:	e5ae002f 	addi      	r13, r14, 48
 80135e4:	e48c0000 	addi      	r4, r12, 1
 80135e8:	222f      	addi      	r2, 48
 80135ea:	7510      	zextb      	r4, r4
 80135ec:	d58d0022 	str.b      	r2, (r13, r12 << 0)
 80135f0:	e800fd01 	br      	0x8012ff2	// 8012ff2 <_vsnprintf+0x1f6>
          while (l++ < width) {
 80135f4:	6ed3      	mov      	r11, r4
        format++;
 80135f6:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 80135f8:	9889      	ld.w      	r4, (r14, 0x24)
 80135fa:	e800fc10 	br      	0x8012e1a	// 8012e1a <_vsnprintf+0x1e>
 80135fe:	6caf      	mov      	r2, r11
 8013600:	e800fc81 	br      	0x8012f02	// 8012f02 <_vsnprintf+0x106>
      const int w = va_arg(va, int);
 8013604:	9400      	ld.w      	r0, (r4, 0x0)
 8013606:	5c6e      	addi      	r3, r4, 4
      if (w < 0) {
 8013608:	e98000af 	blz      	r0, 0x8013766	// 8013766 <_vsnprintf+0x96a>
        width = (unsigned int)w;
 801360c:	c4004831 	lsli      	r17, r0, 0
 8013610:	8201      	ld.b      	r0, (r2, 0x1)
      const int w = va_arg(va, int);
 8013612:	6d0f      	mov      	r4, r3
      format++;
 8013614:	5aa2      	addi      	r5, r2, 1
 8013616:	e800fc38 	br      	0x8012e86	// 8012e86 <_vsnprintf+0x8a>
 801361a:	8502      	ld.b      	r0, (r5, 0x2)
          flags |= FLAGS_CHAR;
 801361c:	ec2100c0 	ori      	r1, r1, 192
          format++;
 8013620:	2501      	addi      	r5, 2
 8013622:	e800fc47 	br      	0x8012eb0	// 8012eb0 <_vsnprintf+0xb4>
 8013626:	8502      	ld.b      	r0, (r5, 0x2)
          flags |= FLAGS_LONG_LONG;
 8013628:	ec210300 	ori      	r1, r1, 768
          format++;
 801362c:	2501      	addi      	r5, 2
 801362e:	e800fc41 	br      	0x8012eb0	// 8012eb0 <_vsnprintf+0xb4>
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8013632:	e900fdb2 	bez      	r0, 0x8013196	// 8013196 <_vsnprintf+0x39a>
 8013636:	6caf      	mov      	r2, r11
 8013638:	b88b      	st.w      	r4, (r14, 0x2c)
 801363a:	d96e2009 	ld.w      	r11, (r14, 0x24)
 801363e:	e800fd96 	br      	0x801316a	// 801316a <_vsnprintf+0x36e>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8013642:	6cdf      	mov      	r3, r7
 8013644:	6caf      	mov      	r2, r11
 8013646:	6c63      	mov      	r1, r8
 8013648:	8400      	ld.b      	r0, (r4, 0x0)
 801364a:	7bd9      	jsr      	r6
          while (l++ < width) {
 801364c:	eb110001 	cmphsi      	r17, 2
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8013650:	e6040003 	addi      	r16, r4, 4
 8013654:	e54b0000 	addi      	r10, r11, 1
          while (l++ < width) {
 8013658:	0cfc      	bf      	0x8013850	// 8013850 <_vsnprintf+0xa54>
 801365a:	c571002b 	addu      	r11, r17, r11
 801365e:	6cab      	mov      	r2, r10
            out(' ', buffer, idx++, maxlen);
 8013660:	5a82      	addi      	r4, r2, 1
 8013662:	6cdf      	mov      	r3, r7
 8013664:	6c63      	mov      	r1, r8
 8013666:	3020      	movi      	r0, 32
 8013668:	7bd9      	jsr      	r6
          while (l++ < width) {
 801366a:	652e      	cmpne      	r11, r4
 801366c:	6c93      	mov      	r2, r4
 801366e:	0bf9      	bt      	0x8013660	// 8013660 <_vsnprintf+0x864>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8013670:	c4104824 	lsli      	r4, r16, 0
        format++;
 8013674:	2500      	addi      	r5, 1
 8013676:	e800fbd2 	br      	0x8012e1a	// 8012e1a <_vsnprintf+0x1e>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801367a:	d80e0030 	ld.b      	r0, (r14, 0x30)
 801367e:	e920fec0 	bnez      	r0, 0x80133fe	// 80133fe <_vsnprintf+0x602>
 8013682:	6d2f      	mov      	r4, r11
 8013684:	06d8      	br      	0x8013434	// 8013434 <_vsnprintf+0x638>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8013686:	d80e0030 	ld.b      	r0, (r14, 0x30)
 801368a:	e920ff3a 	bnez      	r0, 0x80134fe	// 80134fe <_vsnprintf+0x702>
 801368e:	c40b4830 	lsli      	r16, r11, 0
 8013692:	0750      	br      	0x8013532	// 8013532 <_vsnprintf+0x736>
        unsigned int l = __mac2str((unsigned char *)p, store);
 8013694:	3311      	movi      	r3, 17
 8013696:	b868      	st.w      	r3, (r14, 0x20)
 8013698:	0712      	br      	0x80134bc	// 80134bc <_vsnprintf+0x6c0>
          while (l++ < width) {
 801369a:	c410482b 	lsli      	r11, r16, 0
        format++;
 801369e:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 80136a0:	9889      	ld.w      	r4, (r14, 0x24)
 80136a2:	e800fbbc 	br      	0x8012e1a	// 8012e1a <_vsnprintf+0x1e>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80136a6:	d80e0030 	ld.b      	r0, (r14, 0x30)
 80136aa:	e920fce7 	bnez      	r0, 0x8013078	// 8013078 <_vsnprintf+0x27c>
 80136ae:	6d2f      	mov      	r4, r11
 80136b0:	e800fcff 	br      	0x80130ae	// 80130ae <_vsnprintf+0x2b2>
          base =  8U;
 80136b4:	3208      	movi      	r2, 8
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
 80136b6:	c4412823 	bclri      	r3, r1, 2
 80136ba:	3b83      	bclri      	r3, 3
        if (flags & FLAGS_PRECISION) {
 80136bc:	e4212400 	andi      	r1, r1, 1024
 80136c0:	e901fdda 	bez      	r1, 0x8013274	// 8013274 <_vsnprintf+0x478>
 80136c4:	e800fdd7 	br      	0x8013272	// 8013272 <_vsnprintf+0x476>
        if ((*format != 'i') && (*format != 'd')) {
 80136c8:	eb400064 	cmpnei      	r0, 100
          flags &= ~FLAGS_HASH;   // no hash for dec format
 80136cc:	6c4f      	mov      	r1, r3
          base = 10U;
 80136ce:	320a      	movi      	r2, 10
        if ((*format != 'i') && (*format != 'd')) {
 80136d0:	0bf3      	bt      	0x80136b6	// 80136b6 <_vsnprintf+0x8ba>
        if (flags & FLAGS_PRECISION) {
 80136d2:	e4232400 	andi      	r1, r3, 1024
 80136d6:	e921fdce 	bnez      	r1, 0x8013272	// 8013272 <_vsnprintf+0x476>
          if (flags & FLAGS_LONG_LONG) {
 80136da:	e4232200 	andi      	r1, r3, 512
 80136de:	e9210066 	bnez      	r1, 0x80137aa	// 80137aa <_vsnprintf+0x9ae>
          else if (flags & FLAGS_LONG) {
 80136e2:	e4032100 	andi      	r0, r3, 256
 80136e6:	e9200099 	bnez      	r0, 0x8013818	// 8013818 <_vsnprintf+0xa1c>
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 80136ea:	e4232040 	andi      	r1, r3, 64
 80136ee:	e92100a8 	bnez      	r1, 0x801383e	// 801383e <_vsnprintf+0xa42>
 80136f2:	e4232080 	andi      	r1, r3, 128
 80136f6:	e921008c 	bnez      	r1, 0x801380e	// 801380e <_vsnprintf+0xa12>
 80136fa:	9420      	ld.w      	r1, (r4, 0x0)
 80136fc:	491f      	lsri      	r0, r1, 31
 80136fe:	2403      	addi      	r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8013700:	b865      	st.w      	r3, (r14, 0x14)
 8013702:	de2e2004 	st.w      	r17, (r14, 0x10)
 8013706:	dd4e2003 	st.w      	r10, (r14, 0xc)
 801370a:	b842      	st.w      	r2, (r14, 0x8)
 801370c:	b801      	st.w      	r0, (r14, 0x4)
 801370e:	c4010201 	abs      	r1, r1
 8013712:	e800fdd3 	br      	0x80132b8	// 80132b8 <_vsnprintf+0x4bc>
 8013716:	988b      	ld.w      	r4, (r14, 0x2c)
 8013718:	6ecb      	mov      	r11, r2
 801371a:	e800fd3b 	br      	0x8013190	// 8013190 <_vsnprintf+0x394>
 801371e:	6d0b      	mov      	r4, r2
 8013720:	0687      	br      	0x801342e	// 801342e <_vsnprintf+0x632>
 8013722:	6d0b      	mov      	r4, r2
 8013724:	e800fcc2 	br      	0x80130a8	// 80130a8 <_vsnprintf+0x2ac>
 8013728:	c4024830 	lsli      	r16, r2, 0
 801372c:	0700      	br      	0x801352c	// 801352c <_vsnprintf+0x730>
          base = 16U;
 801372e:	3210      	movi      	r2, 16
 8013730:	07c3      	br      	0x80136b6	// 80136b6 <_vsnprintf+0x8ba>
 8013732:	c4412823 	bclri      	r3, r1, 2
 8013736:	3b83      	bclri      	r3, 3
        if (flags & FLAGS_PRECISION) {
 8013738:	e4212400 	andi      	r1, r1, 1024
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
 801373c:	ec630020 	ori      	r3, r3, 32
          base = 16U;
 8013740:	3210      	movi      	r2, 16
        if (flags & FLAGS_PRECISION) {
 8013742:	e921fd98 	bnez      	r1, 0x8013272	// 8013272 <_vsnprintf+0x476>
 8013746:	e800fd9f 	br      	0x8013284	// 8013284 <_vsnprintf+0x488>
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
 801374a:	ec210020 	ori      	r1, r1, 32
 801374e:	e800fdc4 	br      	0x80132d6	// 80132d6 <_vsnprintf+0x4da>
        precision = prec > 0 ? (unsigned int)prec : 0U;
 8013752:	d9a42000 	ld.w      	r13, (r4, 0x0)
 8013756:	3300      	movi      	r3, 0
 8013758:	8502      	ld.b      	r0, (r5, 0x2)
 801375a:	f86dccaa 	max.s32      	r10, r13, r3
        const int prec = (int)va_arg(va, int);
 801375e:	2403      	addi      	r4, 4
        format++;
 8013760:	2501      	addi      	r5, 2
 8013762:	e800fb97 	br      	0x8012e90	// 8012e90 <_vsnprintf+0x94>
        width = (unsigned int)-w;
 8013766:	ea0c0000 	movi      	r12, 0
        flags |= FLAGS_LEFT;    // reverse padding
 801376a:	ec210002 	ori      	r1, r1, 2
        width = (unsigned int)-w;
 801376e:	c40c0091 	subu      	r17, r12, r0
 8013772:	074f      	br      	0x8013610	// 8013610 <_vsnprintf+0x814>
            idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
 8013774:	b867      	st.w      	r3, (r14, 0x1c)
 8013776:	3300      	movi      	r3, 0
 8013778:	de2e2006 	st.w      	r17, (r14, 0x18)
 801377c:	dd4e2005 	st.w      	r10, (r14, 0x14)
 8013780:	b843      	st.w      	r2, (r14, 0xc)
 8013782:	b864      	st.w      	r3, (r14, 0x10)
 8013784:	b862      	st.w      	r3, (r14, 0x8)
 8013786:	e6040007 	addi      	r16, r4, 8
 801378a:	9460      	ld.w      	r3, (r4, 0x0)
 801378c:	9481      	ld.w      	r4, (r4, 0x4)
 801378e:	b860      	st.w      	r3, (r14, 0x0)
 8013790:	b881      	st.w      	r4, (r14, 0x4)
 8013792:	6caf      	mov      	r2, r11
 8013794:	6cdf      	mov      	r3, r7
 8013796:	6c63      	mov      	r1, r8
 8013798:	6c1b      	mov      	r0, r6
 801379a:	e3fff633 	bsr      	0x8012400	// 8012400 <_ntoa_long_long>
 801379e:	6ec3      	mov      	r11, r0
 80137a0:	c4104824 	lsli      	r4, r16, 0
        format++;
 80137a4:	2500      	addi      	r5, 1
 80137a6:	e800fb3a 	br      	0x8012e1a	// 8012e1a <_vsnprintf+0x1e>
            const long long value = va_arg(va, long long);
 80137aa:	9421      	ld.w      	r1, (r4, 0x4)
 80137ac:	9400      	ld.w      	r0, (r4, 0x0)
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 80137ae:	b867      	st.w      	r3, (r14, 0x1c)
 80137b0:	3300      	movi      	r3, 0
 80137b2:	b864      	st.w      	r3, (r14, 0x10)
 80137b4:	497f      	lsri      	r3, r1, 31
 80137b6:	b843      	st.w      	r2, (r14, 0xc)
 80137b8:	b862      	st.w      	r3, (r14, 0x8)
            const long long value = va_arg(va, long long);
 80137ba:	e6040007 	addi      	r16, r4, 8
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 80137be:	de2e2006 	st.w      	r17, (r14, 0x18)
 80137c2:	dd4e2005 	st.w      	r10, (r14, 0x14)
 80137c6:	6c83      	mov      	r2, r0
 80137c8:	6cc7      	mov      	r3, r1
 80137ca:	e9810053 	blz      	r1, 0x8013870	// 8013870 <_vsnprintf+0xa74>
 80137ce:	b840      	st.w      	r2, (r14, 0x0)
 80137d0:	b861      	st.w      	r3, (r14, 0x4)
 80137d2:	07e0      	br      	0x8013792	// 8013792 <_vsnprintf+0x996>
            idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
 80137d4:	b865      	st.w      	r3, (r14, 0x14)
 80137d6:	de2e2004 	st.w      	r17, (r14, 0x10)
 80137da:	dd4e2003 	st.w      	r10, (r14, 0xc)
 80137de:	b842      	st.w      	r2, (r14, 0x8)
 80137e0:	b821      	st.w      	r1, (r14, 0x4)
 80137e2:	9460      	ld.w      	r3, (r4, 0x0)
 80137e4:	e6040003 	addi      	r16, r4, 4
 80137e8:	b860      	st.w      	r3, (r14, 0x0)
 80137ea:	6caf      	mov      	r2, r11
 80137ec:	6cdf      	mov      	r3, r7
 80137ee:	6c63      	mov      	r1, r8
 80137f0:	6c1b      	mov      	r0, r6
 80137f2:	e3fff5a7 	bsr      	0x8012340	// 8012340 <_ntoa_long>
 80137f6:	6ec3      	mov      	r11, r0
 80137f8:	c4104824 	lsli      	r4, r16, 0
        format++;
 80137fc:	2500      	addi      	r5, 1
 80137fe:	e800fb0e 	br      	0x8012e1a	// 8012e1a <_vsnprintf+0x1e>
          base =  2U;
 8013802:	3202      	movi      	r2, 2
 8013804:	0759      	br      	0x80136b6	// 80136b6 <_vsnprintf+0x8ba>
 8013806:	8c20      	ld.h      	r1, (r4, 0x0)
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 8013808:	2403      	addi      	r4, 4
 801380a:	e800fd4f 	br      	0x80132a8	// 80132a8 <_vsnprintf+0x4ac>
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 801380e:	d8245000 	ld.hs      	r1, (r4, 0x0)
 8013812:	491f      	lsri      	r0, r1, 31
 8013814:	2403      	addi      	r4, 4
 8013816:	0775      	br      	0x8013700	// 8013700 <_vsnprintf+0x904>
            const long value = va_arg(va, long);
 8013818:	9420      	ld.w      	r1, (r4, 0x0)
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 801381a:	b865      	st.w      	r3, (r14, 0x14)
 801381c:	497f      	lsri      	r3, r1, 31
 801381e:	c4010201 	abs      	r1, r1
            const long value = va_arg(va, long);
 8013822:	e6040003 	addi      	r16, r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8013826:	de2e2004 	st.w      	r17, (r14, 0x10)
 801382a:	dd4e2003 	st.w      	r10, (r14, 0xc)
 801382e:	b842      	st.w      	r2, (r14, 0x8)
 8013830:	b861      	st.w      	r3, (r14, 0x4)
 8013832:	b820      	st.w      	r1, (r14, 0x0)
 8013834:	07db      	br      	0x80137ea	// 80137ea <_vsnprintf+0x9ee>
 8013836:	8420      	ld.b      	r1, (r4, 0x0)
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 8013838:	2403      	addi      	r4, 4
 801383a:	e800fd37 	br      	0x80132a8	// 80132a8 <_vsnprintf+0x4ac>
 801383e:	8420      	ld.b      	r1, (r4, 0x0)
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 8013840:	2403      	addi      	r4, 4
 8013842:	075f      	br      	0x8013700	// 8013700 <_vsnprintf+0x904>
          while (l++ < width) {
 8013844:	b868      	st.w      	r3, (r14, 0x20)
 8013846:	e800fdd8 	br      	0x80133f6	// 80133f6 <_vsnprintf+0x5fa>
          while (l++ < width) {
 801384a:	b868      	st.w      	r3, (r14, 0x20)
 801384c:	e800fc12 	br      	0x8013070	// 8013070 <_vsnprintf+0x274>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8013850:	c4104824 	lsli      	r4, r16, 0
 8013854:	6eeb      	mov      	r11, r10
        format++;
 8013856:	2500      	addi      	r5, 1
 8013858:	e800fae1 	br      	0x8012e1a	// 8012e1a <_vsnprintf+0x1e>
          while (l++ < width) {
 801385c:	6eaf      	mov      	r10, r11
 801385e:	e800fce1 	br      	0x8013220	// 8013220 <_vsnprintf+0x424>
          while (l++ < width) {
 8013862:	b868      	st.w      	r3, (r14, 0x20)
 8013864:	0649      	br      	0x80134f6	// 80134f6 <_vsnprintf+0x6fa>
          while (l++ < width) {
 8013866:	6d0f      	mov      	r4, r3
 8013868:	c40b4832 	lsli      	r18, r11, 0
 801386c:	e800fc76 	br      	0x8013158	// 8013158 <_vsnprintf+0x35c>
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8013870:	3000      	movi      	r0, 0
 8013872:	3100      	movi      	r1, 0
 8013874:	f840c462 	sub.64      	r2, r0, r2
 8013878:	07ab      	br      	0x80137ce	// 80137ce <_vsnprintf+0x9d2>
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801387a:	c412482b 	lsli      	r11, r18, 0
 801387e:	e800fc9c 	br      	0x80131b6	// 80131b6 <_vsnprintf+0x3ba>
	...

08013884 <fputc>:
    while((READ_REG(UART0->FIFOS) & 0x3F) >= 32);
 8013884:	1046      	lrw      	r2, 0x40010600	// 801389c <fputc+0x18>
 8013886:	9267      	ld.w      	r3, (r2, 0x1c)
 8013888:	e463203f 	andi      	r3, r3, 63
 801388c:	3b1f      	cmphsi      	r3, 32
 801388e:	0bfc      	bt      	0x8013886	// 8013886 <fputc+0x2>
    WRITE_REG(UART0->TDW, (char)ch);
 8013890:	e40020ff 	andi      	r0, r0, 255
 8013894:	b208      	st.w      	r0, (r2, 0x20)
}
 8013896:	3000      	movi      	r0, 0
 8013898:	783c      	jmp      	r15
 801389a:	0000      	.short	0x0000
 801389c:	40010600 	.long	0x40010600

080138a0 <wm_printf>:
  return _vsnprintf(_out_buffer, buffer, count, format, va);
}


int wm_printf(const char *fmt,...)
{
 80138a0:	1424      	subi      	r14, r14, 16
 80138a2:	b863      	st.w      	r3, (r14, 0xc)
 80138a4:	b842      	st.w      	r2, (r14, 0x8)
 80138a6:	b821      	st.w      	r1, (r14, 0x4)
 80138a8:	b800      	st.w      	r0, (r14, 0x0)
 80138aa:	14d0      	push      	r15
 80138ac:	1421      	subi      	r14, r14, 4
 80138ae:	9862      	ld.w      	r3, (r14, 0x8)
 80138b0:	6c8f      	mov      	r2, r3
    va_list args;
    size_t length;

	va_start(args, fmt);
	length = _vsnprintf(_out_uart, (char*)fmt, (size_t) - 1, fmt, args);
 80138b2:	1b03      	addi      	r3, r14, 12
 80138b4:	b860      	st.w      	r3, (r14, 0x0)
 80138b6:	6ccb      	mov      	r3, r2
 80138b8:	3200      	movi      	r2, 0
 80138ba:	2a00      	subi      	r2, 1
 80138bc:	6c4f      	mov      	r1, r3
 80138be:	1005      	lrw      	r0, 0x80120a4	// 80138d0 <wm_printf+0x30>
 80138c0:	e3fffa9e 	bsr      	0x8012dfc	// 8012dfc <_vsnprintf>
	va_end(args);

	return length;
}
 80138c4:	1401      	addi      	r14, r14, 4
 80138c6:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 80138ca:	1405      	addi      	r14, r14, 20
 80138cc:	783c      	jmp      	r15
 80138ce:	0000      	.short	0x0000
 80138d0:	080120a4 	.long	0x080120a4

080138d4 <vTaskSwitchContext>:

#endif /* configUSE_APPLICATION_TASK_TAG */
/*-----------------------------------------------------------*/

void vTaskSwitchContext( void )
{
 80138d4:	14d0      	push      	r15
    if( uxSchedulerSuspended != ( UBaseType_t ) pdFALSE )
 80138d6:	1160      	lrw      	r3, 0x20001854	// 8013954 <vTaskSwitchContext+0x80>
 80138d8:	9360      	ld.w      	r3, (r3, 0x0)
 80138da:	e9230034 	bnez      	r3, 0x8013942	// 8013942 <vTaskSwitchContext+0x6e>
         * switch. */
        xYieldPending = pdTRUE;
    }
    else
    {
        xYieldPending = pdFALSE;
 80138de:	105f      	lrw      	r2, 0x2000185c	// 8013958 <vTaskSwitchContext+0x84>
            }
        #endif

        /* Select a new task to run using either the generic C or port
         * optimised asm code. */
        taskSELECT_HIGHEST_PRIORITY_TASK(); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
 80138e0:	ea8d001f 	lrw      	r13, 0x20001858	// 801395c <vTaskSwitchContext+0x88>
 80138e4:	3114      	movi      	r1, 20
        xYieldPending = pdFALSE;
 80138e6:	b260      	st.w      	r3, (r2, 0x0)
        taskSELECT_HIGHEST_PRIORITY_TASK(); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
 80138e8:	d86d2000 	ld.w      	r3, (r13, 0x0)
 80138ec:	c4238420 	mult      	r0, r3, r1
 80138f0:	105c      	lrw      	r2, 0x20001368	// 8013960 <vTaskSwitchContext+0x8c>
 80138f2:	d0020820 	ldr.w      	r0, (r2, r0 << 0)
 80138f6:	e900000a 	bez      	r0, 0x801390a	// 801390a <vTaskSwitchContext+0x36>
 80138fa:	0411      	br      	0x801391c	// 801391c <vTaskSwitchContext+0x48>
 80138fc:	2b00      	subi      	r3, 1
 80138fe:	c4238420 	mult      	r0, r3, r1
 8013902:	d0020820 	ldr.w      	r0, (r2, r0 << 0)
 8013906:	e920000b 	bnez      	r0, 0x801391c	// 801391c <vTaskSwitchContext+0x48>
 801390a:	e923fff9 	bnez      	r3, 0x80138fc	// 80138fc <vTaskSwitchContext+0x28>
 801390e:	ea020be7 	movi      	r2, 3047
 8013912:	1035      	lrw      	r1, 0x8013d84	// 8013964 <vTaskSwitchContext+0x90>
 8013914:	1015      	lrw      	r0, 0x8013dc0	// 8013968 <vTaskSwitchContext+0x94>
 8013916:	e3ffffc5 	bsr      	0x80138a0	// 80138a0 <wm_printf>
 801391a:	0400      	br      	0x801391a	// 801391a <vTaskSwitchContext+0x46>
 801391c:	3014      	movi      	r0, 20
 801391e:	7c0c      	mult      	r0, r3
 8013920:	c402002c 	addu      	r12, r2, r0
 8013924:	2007      	addi      	r0, 8
 8013926:	d82c2001 	ld.w      	r1, (r12, 0x4)
 801392a:	6080      	addu      	r2, r0
 801392c:	9121      	ld.w      	r1, (r1, 0x4)
 801392e:	6486      	cmpne      	r1, r2
 8013930:	dc2c2001 	st.w      	r1, (r12, 0x4)
 8013934:	0c0b      	bf      	0x801394a	// 801394a <vTaskSwitchContext+0x76>
 8013936:	104e      	lrw      	r2, 0x20001364	// 801396c <vTaskSwitchContext+0x98>
 8013938:	9123      	ld.w      	r1, (r1, 0xc)
 801393a:	b220      	st.w      	r1, (r2, 0x0)
 801393c:	dc6d2000 	st.w      	r3, (r13, 0x0)
                 * for additional information. */
                _impure_ptr = &( pxCurrentTCB->xNewLib_reent );
            }
        #endif /* configUSE_NEWLIB_REENTRANT */
    }
}
 8013940:	1490      	pop      	r15
        xYieldPending = pdTRUE;
 8013942:	1066      	lrw      	r3, 0x2000185c	// 8013958 <vTaskSwitchContext+0x84>
 8013944:	3201      	movi      	r2, 1
 8013946:	b340      	st.w      	r2, (r3, 0x0)
}
 8013948:	1490      	pop      	r15
        taskSELECT_HIGHEST_PRIORITY_TASK(); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
 801394a:	9121      	ld.w      	r1, (r1, 0x4)
 801394c:	dc2c2001 	st.w      	r1, (r12, 0x4)
 8013950:	07f3      	br      	0x8013936	// 8013936 <vTaskSwitchContext+0x62>
 8013952:	0000      	.short	0x0000
 8013954:	20001854 	.long	0x20001854
 8013958:	2000185c 	.long	0x2000185c
 801395c:	20001858 	.long	0x20001858
 8013960:	20001368 	.long	0x20001368
 8013964:	08013d84 	.long	0x08013d84
 8013968:	08013dc0 	.long	0x08013dc0
 801396c:	20001364 	.long	0x20001364
