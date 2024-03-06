struct _coord {
    double x;
    double y;
};

# COORD_X_OFFSET = 0
# COORD_Y_OFFSET = 8


typedef struct _node Node;
struct _node {
    int value;
    Node *next;
};

# NODE_VALUE_OFFSET = 0
# NODE_NEXT_OFFSET = 4


struct _enrolment {
    int stu_id;         // e.g. 5012345         # 0
    char course[9]:     // e.g. "COMP1521"      # 4
    char term[5];       // e.g. "17s2"          # 13
    char grade[3];      // e.g. "HD"            # 18
    double mark;        // e.g. 87.3            # 24
};


struct _queue {
    int nitems;     // # items currently in queue
    int head;       // index of oldest item added
    int tail;       // index of most recent item added
    int maxitems;   // size of array
    Item *items;    // malloc'd array of Items
};