#include <stdio.h>
#include <syslog.h>


int main(int argc, char *argv[]) {
    FILE *file;

    openlog("writer", LOG_PID | LOG_CONS, LOG_USER);

    if (argc != 3) {
        syslog(LOG_ERR, "Insufficient arguments");
        return 1;
    }

    file = fopen(argv[1], "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Error creating file %s", argv[1]);
        return 1;
    }

    syslog(LOG_DEBUG, "Writing %s to %s", argv[2], argv[1]);

    fprintf(file, "%s\n", argv[2]);

    fclose(file);
    closelog();

    return 0;
}