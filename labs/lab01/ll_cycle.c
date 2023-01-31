#include <stddef.h>
#include "ll_cycle.h"

int ll_has_cycle(node *head) {
    /* your code here */
    if (!head) return 0;
    node *hare = head->next;
    node *tortoise = head;
    while (hare && hare->next && tortoise != hare) {
        hare = hare->next->next;
        tortoise = tortoise->next;
    }
    return tortoise == hare;
}
