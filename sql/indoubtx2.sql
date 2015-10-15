SELECT KTUXEUSN, KTUXESLT, KTUXESQN, /* Transaction ID */
    KTUXESTA Status,
    KTUXECFL Flags
    FROM x$ktuxe WHERE ktuxesta!='INACTIVE' AND ktuxeusn= &ilk
/
