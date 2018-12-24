#include <stdio.h>
#include <stdlib.h>

int m(int out) {
    dprintf(out, "Hello World!\n");
    return EXIT_SUCCESS;
}

#ifdef __CloudABI__
    #include <argdata.h>
    #include <program.h>

    void program_main(const argdata_t *ad) {
        int out;
        argdata_get_fd(ad, &out);
#else
    #include <unistd.h>

    void main() {
        int out = STDOUT_FILENO;
#endif
        exit(m(out));
    }
