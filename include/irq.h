//FILE: irq.h

#ifndef IRQ_H
#define IRQ_H

#include<common.h>

void irq_handler(u32int,u32int,registers_t);
void remap_irq();
void install_irq();

#endif
