#include <stdlib.h>

typedef struct linked_list {
    int val;
    struct linked_list* next;
} ll;

void push_node(int val, ll* root) {
    ll* cur = root->next;
    while (cur->next != NULL) {
        cur = cur->next;
    }

    ll* new_node = malloc(sizeof(ll));
    if (new_node == NULL) return;
    new_node->val = val;
    new_node->next = NULL;

    cur->next = new_node;
}

int pop_node(ll* root) {
    if (root->next == NULL) {
        return -1;
    }

    ll* prev = root;
    ll* cur = root->next;
    while (cur->next != NULL) {
        prev = cur;
        cur = cur->next;
    }

    prev->next = NULL;
    free(cur);
    return 0;

}

int len_ll(ll* root) {
    ll* cur = root;
    int len = 0;
    while (cur != NULL) {
        len++;
        cur = cur->next;
    }
    return len;
}

int insert(ll* root, int index, int val) {
    ll* cur = root;
    for (int i = 0; i < index; i++) {
        if (cur->next == NULL) {
            return -1;
        }
        cur = cur->next;
    }
    ll* new_node = malloc(sizeof(ll));
    if (new_node == NULL) return -1;
    new_node->val = val;
    new_node->next = cur->next;
    cur->next = new_node;
    return 0;
}