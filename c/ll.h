#ifndef LINKED_LIST_H
#define LINKED_LIST_H

typedef struct linked_list {
    int val;
    struct linked_list* next;
} ll;

void push_node(int val, ll* root);
int  pop_node(ll* root);
int  len_ll(ll* root);
int  insert(ll* root, int index, int val);

#endif