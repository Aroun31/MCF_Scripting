#define F(NAME,TARGET) class NAME { \
    allowedTargets = TARGET; \
};
#define JIP(NAME,TARGET) class NAME { \
    allowedTargets = TARGET; \
    jip = 1; \
};

#define ANYONE 0
#define CLIENT 1
#define SERVER 2
// #define HC HC_DA3F // On en est pas la.

class CfgRemoteExec {
        class Functions {
            mode = 1;
            jip = 0;
        };

    class Commands {
        mode = 1;
        jip = 0;

        F(call,ANYONE)
    };
};
