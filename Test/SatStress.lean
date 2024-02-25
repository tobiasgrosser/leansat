import LeanSAT.Reflect.Tactics.CNFDecide

-- https://chat.openai.com/share/4ac95b29-aeff-4e67-98d2-ed16e3dc75a2
set_option trace.profiler true
-- All of these are ~subsecond
example (_ : x = true) (_ : x0 && x1 = x) : x0 = true := by cnf_decide
example (_ : x = true) (_ : x0 && x1 = x) (_ : x10 && x11 = x1) (_ : x00 && x01 = x0) : x00 = true := by cnf_decide
example (_ : x = true) (_ : x0 && x1 = x) (_ : x10 && x11 = x1) (_ : x110 && x111 = x11) (_ : x100 && x101 = x10) (_ : x00 && x01 = x0) (_ : x010 && x011 = x01) (_ : x000 && x001 = x00) : x000 = true := by cnf_decide
example (_ : x = true) (_ : x0 && x1 = x) (_ : x10 && x11 = x1) (_ : x110 && x111 = x11) (_ : x1110 && x1111 = x111) (_ : x1100 && x1101 = x110) (_ : x100 && x101 = x10) (_ : x1010 && x1011 = x101) (_ : x1000 && x1001 = x100) (_ : x00 && x01 = x0) (_ : x010 && x011 = x01) (_ : x0110 && x0111 = x011) (_ : x0100 && x0101 = x010) (_ : x000 && x001 = x00) (_ : x0010 && x0011 = x001) (_ : x0000 && x0001 = x000) : x0000 = true := by cnf_decide

/-!
# Binary `and` of 2^5 variables
2.5s on Henrik's machine, 1s on Scott's machine
-/
example (_ : x = true) (_ : x0 && x1 = x) (_ : x10 && x11 = x1) (_ : x110 && x111 = x11) (_ : x1110 && x1111 = x111) (_ : x11110 && x11111 = x1111) (_ : x11100 && x11101 = x1110) (_ : x1100 && x1101 = x110) (_ : x11010 && x11011 = x1101) (_ : x11000 && x11001 = x1100) (_ : x100 && x101 = x10) (_ : x1010 && x1011 = x101) (_ : x10110 && x10111 = x1011) (_ : x10100 && x10101 = x1010) (_ : x1000 && x1001 = x100) (_ : x10010 && x10011 = x1001) (_ : x10000 && x10001 = x1000) (_ : x00 && x01 = x0) (_ : x010 && x011 = x01) (_ : x0110 && x0111 = x011) (_ : x01110 && x01111 = x0111) (_ : x01100 && x01101 = x0110) (_ : x0100 && x0101 = x010) (_ : x01010 && x01011 = x0101) (_ : x01000 && x01001 = x0100) (_ : x000 && x001 = x00) (_ : x0010 && x0011 = x001) (_ : x00110 && x00111 = x0011) (_ : x00100 && x00101 = x0010) (_ : x0000 && x0001 = x000) (_ : x00010 && x00011 = x0001) (_ : x00000 && x00001 = x0000) : x00000 = true := by cnf_decide

/-!
# Binary `and` of 2^6 variables
10s on Henrik's machine, 3.2s on Scott's machine
-/
example (_ : x = true) (_ : x0 && x1 = x) (_ : x10 && x11 = x1) (_ : x110 && x111 = x11) (_ : x1110 && x1111 = x111) (_ : x11110 && x11111 = x1111) (_ : x111110 && x111111 = x11111) (_ : x111100 && x111101 = x11110) (_ : x11100 && x11101 = x1110) (_ : x111010 && x111011 = x11101) (_ : x111000 && x111001 = x11100) (_ : x1100 && x1101 = x110) (_ : x11010 && x11011 = x1101) (_ : x110110 && x110111 = x11011) (_ : x110100 && x110101 = x11010) (_ : x11000 && x11001 = x1100) (_ : x110010 && x110011 = x11001) (_ : x110000 && x110001 = x11000) (_ : x100 && x101 = x10) (_ : x1010 && x1011 = x101) (_ : x10110 && x10111 = x1011) (_ : x101110 && x101111 = x10111) (_ : x101100 && x101101 = x10110) (_ : x10100 && x10101 = x1010) (_ : x101010 && x101011 = x10101) (_ : x101000 && x101001 = x10100) (_ : x1000 && x1001 = x100) (_ : x10010 && x10011 = x1001) (_ : x100110 && x100111 = x10011) (_ : x100100 && x100101 = x10010) (_ : x10000 && x10001 = x1000) (_ : x100010 && x100011 = x10001) (_ : x100000 && x100001 = x10000) (_ : x00 && x01 = x0) (_ : x010 && x011 = x01) (_ : x0110 && x0111 = x011) (_ : x01110 && x01111 = x0111) (_ : x011110 && x011111 = x01111) (_ : x011100 && x011101 = x01110) (_ : x01100 && x01101 = x0110) (_ : x011010 && x011011 = x01101) (_ : x011000 && x011001 = x01100) (_ : x0100 && x0101 = x010) (_ : x01010 && x01011 = x0101) (_ : x010110 && x010111 = x01011) (_ : x010100 && x010101 = x01010) (_ : x01000 && x01001 = x0100) (_ : x010010 && x010011 = x01001) (_ : x010000 && x010001 = x01000) (_ : x000 && x001 = x00) (_ : x0010 && x0011 = x001) (_ : x00110 && x00111 = x0011) (_ : x001110 && x001111 = x00111) (_ : x001100 && x001101 = x00110) (_ : x00100 && x00101 = x0010) (_ : x001010 && x001011 = x00101) (_ : x001000 && x001001 = x00100) (_ : x0000 && x0001 = x000) (_ : x00010 && x00011 = x0001) (_ : x000110 && x000111 = x00011) (_ : x000100 && x000101 = x00010) (_ : x00000 && x00001 = x0000) (_ : x000010 && x000011 = x00001) (_ : x000000 && x000001 = x00000) : x000000 = true := by cnf_decide

-- From this point on we need to increase `maxRecDepth`:

/-!
# Binary `and` of 2^7 variables
11.8s on Scott's machine
-/
-- set_option maxRecDepth 700 in
-- example (_ : x = true) (_ : x0 && x1 = x) (_ : x10 && x11 = x1) (_ : x110 && x111 = x11) (_ : x1110 && x1111 = x111) (_ : x11110 && x11111 = x1111) (_ : x111110 && x111111 = x11111) (_ : x1111110 && x1111111 = x111111) (_ : x1111100 && x1111101 = x111110) (_ : x111100 && x111101 = x11110) (_ : x1111010 && x1111011 = x111101) (_ : x1111000 && x1111001 = x111100) (_ : x11100 && x11101 = x1110) (_ : x111010 && x111011 = x11101) (_ : x1110110 && x1110111 = x111011) (_ : x1110100 && x1110101 = x111010) (_ : x111000 && x111001 = x11100) (_ : x1110010 && x1110011 = x111001) (_ : x1110000 && x1110001 = x111000) (_ : x1100 && x1101 = x110) (_ : x11010 && x11011 = x1101) (_ : x110110 && x110111 = x11011) (_ : x1101110 && x1101111 = x110111) (_ : x1101100 && x1101101 = x110110) (_ : x110100 && x110101 = x11010) (_ : x1101010 && x1101011 = x110101) (_ : x1101000 && x1101001 = x110100) (_ : x11000 && x11001 = x1100) (_ : x110010 && x110011 = x11001) (_ : x1100110 && x1100111 = x110011) (_ : x1100100 && x1100101 = x110010) (_ : x110000 && x110001 = x11000) (_ : x1100010 && x1100011 = x110001) (_ : x1100000 && x1100001 = x110000) (_ : x100 && x101 = x10) (_ : x1010 && x1011 = x101) (_ : x10110 && x10111 = x1011) (_ : x101110 && x101111 = x10111) (_ : x1011110 && x1011111 = x101111) (_ : x1011100 && x1011101 = x101110) (_ : x101100 && x101101 = x10110) (_ : x1011010 && x1011011 = x101101) (_ : x1011000 && x1011001 = x101100) (_ : x10100 && x10101 = x1010) (_ : x101010 && x101011 = x10101) (_ : x1010110 && x1010111 = x101011) (_ : x1010100 && x1010101 = x101010) (_ : x101000 && x101001 = x10100) (_ : x1010010 && x1010011 = x101001) (_ : x1010000 && x1010001 = x101000) (_ : x1000 && x1001 = x100) (_ : x10010 && x10011 = x1001) (_ : x100110 && x100111 = x10011) (_ : x1001110 && x1001111 = x100111) (_ : x1001100 && x1001101 = x100110) (_ : x100100 && x100101 = x10010) (_ : x1001010 && x1001011 = x100101) (_ : x1001000 && x1001001 = x100100) (_ : x10000 && x10001 = x1000) (_ : x100010 && x100011 = x10001) (_ : x1000110 && x1000111 = x100011) (_ : x1000100 && x1000101 = x100010) (_ : x100000 && x100001 = x10000) (_ : x1000010 && x1000011 = x100001) (_ : x1000000 && x1000001 = x100000) (_ : x00 && x01 = x0) (_ : x010 && x011 = x01) (_ : x0110 && x0111 = x011) (_ : x01110 && x01111 = x0111) (_ : x011110 && x011111 = x01111) (_ : x0111110 && x0111111 = x011111) (_ : x0111100 && x0111101 = x011110) (_ : x011100 && x011101 = x01110) (_ : x0111010 && x0111011 = x011101) (_ : x0111000 && x0111001 = x011100) (_ : x01100 && x01101 = x0110) (_ : x011010 && x011011 = x01101) (_ : x0110110 && x0110111 = x011011) (_ : x0110100 && x0110101 = x011010) (_ : x011000 && x011001 = x01100) (_ : x0110010 && x0110011 = x011001) (_ : x0110000 && x0110001 = x011000) (_ : x0100 && x0101 = x010) (_ : x01010 && x01011 = x0101) (_ : x010110 && x010111 = x01011) (_ : x0101110 && x0101111 = x010111) (_ : x0101100 && x0101101 = x010110) (_ : x010100 && x010101 = x01010) (_ : x0101010 && x0101011 = x010101) (_ : x0101000 && x0101001 = x010100) (_ : x01000 && x01001 = x0100) (_ : x010010 && x010011 = x01001) (_ : x0100110 && x0100111 = x010011) (_ : x0100100 && x0100101 = x010010) (_ : x010000 && x010001 = x01000) (_ : x0100010 && x0100011 = x010001) (_ : x0100000 && x0100001 = x010000) (_ : x000 && x001 = x00) (_ : x0010 && x0011 = x001) (_ : x00110 && x00111 = x0011) (_ : x001110 && x001111 = x00111) (_ : x0011110 && x0011111 = x001111) (_ : x0011100 && x0011101 = x001110) (_ : x001100 && x001101 = x00110) (_ : x0011010 && x0011011 = x001101) (_ : x0011000 && x0011001 = x001100) (_ : x00100 && x00101 = x0010) (_ : x001010 && x001011 = x00101) (_ : x0010110 && x0010111 = x001011) (_ : x0010100 && x0010101 = x001010) (_ : x001000 && x001001 = x00100) (_ : x0010010 && x0010011 = x001001) (_ : x0010000 && x0010001 = x001000) (_ : x0000 && x0001 = x000) (_ : x00010 && x00011 = x0001) (_ : x000110 && x000111 = x00011) (_ : x0001110 && x0001111 = x000111) (_ : x0001100 && x0001101 = x000110) (_ : x000100 && x000101 = x00010) (_ : x0001010 && x0001011 = x000101) (_ : x0001000 && x0001001 = x000100) (_ : x00000 && x00001 = x0000) (_ : x000010 && x000011 = x00001) (_ : x0000110 && x0000111 = x000011) (_ : x0000100 && x0000101 = x000010) (_ : x000000 && x000001 = x00000) (_ : x0000010 && x0000011 = x000001) (_ : x0000000 && x0000001 = x000000) : x0000000 = true := by cnf_decide

/-!
# Binary `and` of 2^8 variables
46s on Scott's machine
-/
-- set_option maxHeartbeats 800000 in
-- set_option maxRecDepth 1400 in
-- example (_ : x = true) (_ : x0 && x1 = x) (_ : x10 && x11 = x1) (_ : x110 && x111 = x11) (_ : x1110 && x1111 = x111) (_ : x11110 && x11111 = x1111) (_ : x111110 && x111111 = x11111) (_ : x1111110 && x1111111 = x111111) (_ : x11111110 && x11111111 = x1111111) (_ : x11111100 && x11111101 = x1111110) (_ : x1111100 && x1111101 = x111110) (_ : x11111010 && x11111011 = x1111101) (_ : x11111000 && x11111001 = x1111100) (_ : x111100 && x111101 = x11110) (_ : x1111010 && x1111011 = x111101) (_ : x11110110 && x11110111 = x1111011) (_ : x11110100 && x11110101 = x1111010) (_ : x1111000 && x1111001 = x111100) (_ : x11110010 && x11110011 = x1111001) (_ : x11110000 && x11110001 = x1111000) (_ : x11100 && x11101 = x1110) (_ : x111010 && x111011 = x11101) (_ : x1110110 && x1110111 = x111011) (_ : x11101110 && x11101111 = x1110111) (_ : x11101100 && x11101101 = x1110110) (_ : x1110100 && x1110101 = x111010) (_ : x11101010 && x11101011 = x1110101) (_ : x11101000 && x11101001 = x1110100) (_ : x111000 && x111001 = x11100) (_ : x1110010 && x1110011 = x111001) (_ : x11100110 && x11100111 = x1110011) (_ : x11100100 && x11100101 = x1110010) (_ : x1110000 && x1110001 = x111000) (_ : x11100010 && x11100011 = x1110001) (_ : x11100000 && x11100001 = x1110000) (_ : x1100 && x1101 = x110) (_ : x11010 && x11011 = x1101) (_ : x110110 && x110111 = x11011) (_ : x1101110 && x1101111 = x110111) (_ : x11011110 && x11011111 = x1101111) (_ : x11011100 && x11011101 = x1101110) (_ : x1101100 && x1101101 = x110110) (_ : x11011010 && x11011011 = x1101101) (_ : x11011000 && x11011001 = x1101100) (_ : x110100 && x110101 = x11010) (_ : x1101010 && x1101011 = x110101) (_ : x11010110 && x11010111 = x1101011) (_ : x11010100 && x11010101 = x1101010) (_ : x1101000 && x1101001 = x110100) (_ : x11010010 && x11010011 = x1101001) (_ : x11010000 && x11010001 = x1101000) (_ : x11000 && x11001 = x1100) (_ : x110010 && x110011 = x11001) (_ : x1100110 && x1100111 = x110011) (_ : x11001110 && x11001111 = x1100111) (_ : x11001100 && x11001101 = x1100110) (_ : x1100100 && x1100101 = x110010) (_ : x11001010 && x11001011 = x1100101) (_ : x11001000 && x11001001 = x1100100) (_ : x110000 && x110001 = x11000) (_ : x1100010 && x1100011 = x110001) (_ : x11000110 && x11000111 = x1100011) (_ : x11000100 && x11000101 = x1100010) (_ : x1100000 && x1100001 = x110000) (_ : x11000010 && x11000011 = x1100001) (_ : x11000000 && x11000001 = x1100000) (_ : x100 && x101 = x10) (_ : x1010 && x1011 = x101) (_ : x10110 && x10111 = x1011) (_ : x101110 && x101111 = x10111) (_ : x1011110 && x1011111 = x101111) (_ : x10111110 && x10111111 = x1011111) (_ : x10111100 && x10111101 = x1011110) (_ : x1011100 && x1011101 = x101110) (_ : x10111010 && x10111011 = x1011101) (_ : x10111000 && x10111001 = x1011100) (_ : x101100 && x101101 = x10110) (_ : x1011010 && x1011011 = x101101) (_ : x10110110 && x10110111 = x1011011) (_ : x10110100 && x10110101 = x1011010) (_ : x1011000 && x1011001 = x101100) (_ : x10110010 && x10110011 = x1011001) (_ : x10110000 && x10110001 = x1011000) (_ : x10100 && x10101 = x1010) (_ : x101010 && x101011 = x10101) (_ : x1010110 && x1010111 = x101011) (_ : x10101110 && x10101111 = x1010111) (_ : x10101100 && x10101101 = x1010110) (_ : x1010100 && x1010101 = x101010) (_ : x10101010 && x10101011 = x1010101) (_ : x10101000 && x10101001 = x1010100) (_ : x101000 && x101001 = x10100) (_ : x1010010 && x1010011 = x101001) (_ : x10100110 && x10100111 = x1010011) (_ : x10100100 && x10100101 = x1010010) (_ : x1010000 && x1010001 = x101000) (_ : x10100010 && x10100011 = x1010001) (_ : x10100000 && x10100001 = x1010000) (_ : x1000 && x1001 = x100) (_ : x10010 && x10011 = x1001) (_ : x100110 && x100111 = x10011) (_ : x1001110 && x1001111 = x100111) (_ : x10011110 && x10011111 = x1001111) (_ : x10011100 && x10011101 = x1001110) (_ : x1001100 && x1001101 = x100110) (_ : x10011010 && x10011011 = x1001101) (_ : x10011000 && x10011001 = x1001100) (_ : x100100 && x100101 = x10010) (_ : x1001010 && x1001011 = x100101) (_ : x10010110 && x10010111 = x1001011) (_ : x10010100 && x10010101 = x1001010) (_ : x1001000 && x1001001 = x100100) (_ : x10010010 && x10010011 = x1001001) (_ : x10010000 && x10010001 = x1001000) (_ : x10000 && x10001 = x1000) (_ : x100010 && x100011 = x10001) (_ : x1000110 && x1000111 = x100011) (_ : x10001110 && x10001111 = x1000111) (_ : x10001100 && x10001101 = x1000110) (_ : x1000100 && x1000101 = x100010) (_ : x10001010 && x10001011 = x1000101) (_ : x10001000 && x10001001 = x1000100) (_ : x100000 && x100001 = x10000) (_ : x1000010 && x1000011 = x100001) (_ : x10000110 && x10000111 = x1000011) (_ : x10000100 && x10000101 = x1000010) (_ : x1000000 && x1000001 = x100000) (_ : x10000010 && x10000011 = x1000001) (_ : x10000000 && x10000001 = x1000000) (_ : x00 && x01 = x0) (_ : x010 && x011 = x01) (_ : x0110 && x0111 = x011) (_ : x01110 && x01111 = x0111) (_ : x011110 && x011111 = x01111) (_ : x0111110 && x0111111 = x011111) (_ : x01111110 && x01111111 = x0111111) (_ : x01111100 && x01111101 = x0111110) (_ : x0111100 && x0111101 = x011110) (_ : x01111010 && x01111011 = x0111101) (_ : x01111000 && x01111001 = x0111100) (_ : x011100 && x011101 = x01110) (_ : x0111010 && x0111011 = x011101) (_ : x01110110 && x01110111 = x0111011) (_ : x01110100 && x01110101 = x0111010) (_ : x0111000 && x0111001 = x011100) (_ : x01110010 && x01110011 = x0111001) (_ : x01110000 && x01110001 = x0111000) (_ : x01100 && x01101 = x0110) (_ : x011010 && x011011 = x01101) (_ : x0110110 && x0110111 = x011011) (_ : x01101110 && x01101111 = x0110111) (_ : x01101100 && x01101101 = x0110110) (_ : x0110100 && x0110101 = x011010) (_ : x01101010 && x01101011 = x0110101) (_ : x01101000 && x01101001 = x0110100) (_ : x011000 && x011001 = x01100) (_ : x0110010 && x0110011 = x011001) (_ : x01100110 && x01100111 = x0110011) (_ : x01100100 && x01100101 = x0110010) (_ : x0110000 && x0110001 = x011000) (_ : x01100010 && x01100011 = x0110001) (_ : x01100000 && x01100001 = x0110000) (_ : x0100 && x0101 = x010) (_ : x01010 && x01011 = x0101) (_ : x010110 && x010111 = x01011) (_ : x0101110 && x0101111 = x010111) (_ : x01011110 && x01011111 = x0101111) (_ : x01011100 && x01011101 = x0101110) (_ : x0101100 && x0101101 = x010110) (_ : x01011010 && x01011011 = x0101101) (_ : x01011000 && x01011001 = x0101100) (_ : x010100 && x010101 = x01010) (_ : x0101010 && x0101011 = x010101) (_ : x01010110 && x01010111 = x0101011) (_ : x01010100 && x01010101 = x0101010) (_ : x0101000 && x0101001 = x010100) (_ : x01010010 && x01010011 = x0101001) (_ : x01010000 && x01010001 = x0101000) (_ : x01000 && x01001 = x0100) (_ : x010010 && x010011 = x01001) (_ : x0100110 && x0100111 = x010011) (_ : x01001110 && x01001111 = x0100111) (_ : x01001100 && x01001101 = x0100110) (_ : x0100100 && x0100101 = x010010) (_ : x01001010 && x01001011 = x0100101) (_ : x01001000 && x01001001 = x0100100) (_ : x010000 && x010001 = x01000) (_ : x0100010 && x0100011 = x010001) (_ : x01000110 && x01000111 = x0100011) (_ : x01000100 && x01000101 = x0100010) (_ : x0100000 && x0100001 = x010000) (_ : x01000010 && x01000011 = x0100001) (_ : x01000000 && x01000001 = x0100000) (_ : x000 && x001 = x00) (_ : x0010 && x0011 = x001) (_ : x00110 && x00111 = x0011) (_ : x001110 && x001111 = x00111) (_ : x0011110 && x0011111 = x001111) (_ : x00111110 && x00111111 = x0011111) (_ : x00111100 && x00111101 = x0011110) (_ : x0011100 && x0011101 = x001110) (_ : x00111010 && x00111011 = x0011101) (_ : x00111000 && x00111001 = x0011100) (_ : x001100 && x001101 = x00110) (_ : x0011010 && x0011011 = x001101) (_ : x00110110 && x00110111 = x0011011) (_ : x00110100 && x00110101 = x0011010) (_ : x0011000 && x0011001 = x001100) (_ : x00110010 && x00110011 = x0011001) (_ : x00110000 && x00110001 = x0011000) (_ : x00100 && x00101 = x0010) (_ : x001010 && x001011 = x00101) (_ : x0010110 && x0010111 = x001011) (_ : x00101110 && x00101111 = x0010111) (_ : x00101100 && x00101101 = x0010110) (_ : x0010100 && x0010101 = x001010) (_ : x00101010 && x00101011 = x0010101) (_ : x00101000 && x00101001 = x0010100) (_ : x001000 && x001001 = x00100) (_ : x0010010 && x0010011 = x001001) (_ : x00100110 && x00100111 = x0010011) (_ : x00100100 && x00100101 = x0010010) (_ : x0010000 && x0010001 = x001000) (_ : x00100010 && x00100011 = x0010001) (_ : x00100000 && x00100001 = x0010000) (_ : x0000 && x0001 = x000) (_ : x00010 && x00011 = x0001) (_ : x000110 && x000111 = x00011) (_ : x0001110 && x0001111 = x000111) (_ : x00011110 && x00011111 = x0001111) (_ : x00011100 && x00011101 = x0001110) (_ : x0001100 && x0001101 = x000110) (_ : x00011010 && x00011011 = x0001101) (_ : x00011000 && x00011001 = x0001100) (_ : x000100 && x000101 = x00010) (_ : x0001010 && x0001011 = x000101) (_ : x00010110 && x00010111 = x0001011) (_ : x00010100 && x00010101 = x0001010) (_ : x0001000 && x0001001 = x000100) (_ : x00010010 && x00010011 = x0001001) (_ : x00010000 && x00010001 = x0001000) (_ : x00000 && x00001 = x0000) (_ : x000010 && x000011 = x00001) (_ : x0000110 && x0000111 = x000011) (_ : x00001110 && x00001111 = x0000111) (_ : x00001100 && x00001101 = x0000110) (_ : x0000100 && x0000101 = x000010) (_ : x00001010 && x00001011 = x0000101) (_ : x00001000 && x00001001 = x0000100) (_ : x000000 && x000001 = x00000) (_ : x0000010 && x0000011 = x000001) (_ : x00000110 && x00000111 = x0000011) (_ : x00000100 && x00000101 = x0000010) (_ : x0000000 && x0000001 = x000000) (_ : x00000010 && x00000011 = x0000001) (_ : x00000000 && x00000001 = x0000000) : x00000000 = true := by cnf_decide
