#include <stdio.h>
#include <stdlib.h>

int m(int console_out) {
    dprintf(console_out, "Hello World!\n");
    return EXIT_SUCCESS;
}

#ifdef __CloudABI__
    #include <argdata.h>
    #include <program.h>
    #include <string.h>

    void program_main(const argdata_t *ad) {
        int console_out;
        argdata_map_iterator_t ad_iter;
        const argdata_t *key_ad, *value_ad;
        const char *key;

        argdata_map_iterate(ad, &ad_iter);

        while (argdata_map_get(&ad_iter, &key_ad, &value_ad)) {
            if (argdata_get_str_c(key_ad, &key) == 0) {
                if (strcmp(key, "console_out") == 0) {
                    argdata_get_fd(value_ad, &console_out);
                }
            }

            argdata_map_next(&ad_iter);
        }

        exit(m(console_out));
    }
#else
    #include <unistd.h>

    int main() {
        return m(STDOUT_FILENO);
    }
#endif
