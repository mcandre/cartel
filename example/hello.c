#include <stdio.h>
#include <stdlib.h>

int m(int out) {
    dprintf(out, "Hello World!\n");
    return EXIT_SUCCESS;
}

#ifdef __CloudABI__
    #include <argdata.h>
    #include <program.h>
    #include <string.h>

    void program_main(const argdata_t *ad) {
        int out;
        argdata_map_iterator_t ad_iter;
        const argdata_t *key_ad, *value_ad;
        const char *key;

        argdata_map_iterate(ad, &ad_iter);

        while (argdata_map_get(&ad_iter, &key_ad, &value_ad)) {
            if (argdata_get_str_c(key_ad, &key) == 0) {
                if (strcmp(key, "console") == 0) {
                    argdata_get_fd(value_ad, &out);
                }
            }

            argdata_map_next(&ad_iter);
        }
#else
    #include <unistd.h>

    void main() {
        int out = STDOUT_FILENO;
#endif
        exit(m(out));
    }
