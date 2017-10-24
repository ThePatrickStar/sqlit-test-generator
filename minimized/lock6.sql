PRAGMA lock_proxy_file=":auto:";
PRAGMA lock_proxy_file;
PRAGMA lock_proxy_file=":auto:";
PRAGMA lock_proxy_file;
PRAGMA lock_proxy_file="notmine";
PRAGMA lock_proxy_file;
BEGIN;
SELECT * FROM sqlite_master;
PRAGMA lock_proxy_file="mine";
