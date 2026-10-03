struct ll {
    int val;
    ll* next;
};

void push_node(int val, ll* root) {
    ll* cur = root;
    while (cur->next != nullptr) {
        cur = cur->next;
    }
    cur->next = new ll{val, nullptr};
}

int pop_node(ll* root) {
    if (root->next == nullptr) {
        return -1;
    }

    ll* prev = root;
    ll* cur = root->next;
    while (cur->next != nullptr) {
        prev = cur;
        cur = cur->next;
    }

    prev->next = nullptr;
    delete cur;
    return 0;
}

int len_ll(const ll* root) {
    int len = 0;
    for (const ll* cur = root->next; cur != nullptr; cur = cur->next) {
        len++;
    }
    return len;
}

int insert(ll* root, int index, int val) {
    ll* cur = root;
    for (int i = 0; i < index; i++) {
        if (cur->next == nullptr) {
            return -1;
        }
        cur = cur->next;
    }
    cur->next = new ll{val, cur->next};
    return 0;
}