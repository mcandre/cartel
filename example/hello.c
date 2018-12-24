#include <stdio.h>
#include <stdlib.h>

int m(int stdout) {
    dprintf(stdout, "Hello World!\n");
    return EXIT_SUCCESS;
}

#ifdef __CloudABI__
    #include <argdata.h>
    #include <program.h>

    void program_main(const argdata_t *ad) {
        int stdout;
        argdata_get_fd(ad, &stdout);
#else
    #include <unistd.h>

    void main() {
        int stdout = STDOUT_FILENO;
#endif
        exit(m(stdout));
    }
