#include "data.h"

// a limit of -1 is unlimited.
void parse_char_literal(u8 limit) {

}

void parse_data(u8 word) {
    // handles db and dw
    // data could be a literal, or a character string
    while(1) {
        consume_whitespace();
        switch(PEEK_CHAR) {
            case '\'':
                parse_char_literal(-1);
                break;
            case '#':
                if (word) {
                    write_word(readhex16());
                } else {
                    write_byte(readhex8());
                }
                break;
            case '\n':
            case ';':
                return;
            default:
        }
        consume_whitespace();
        if (PEEK_CHAR == ',') {
            POP_CHAR;
        } else {
            error("Unexpected character");
        }
    }
}