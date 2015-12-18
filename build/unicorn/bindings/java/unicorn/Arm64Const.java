// For Unicorn Engine. AUTO-GENERATED FILE, DO NOT EDIT

package unicorn;

public interface Arm64Const {

// ARM64 registers

   public static final int UC_ARM64_REG_INVALID = 0;
   public static final int UC_ARM64_REG_X29 = 1;
   public static final int UC_ARM64_REG_X30 = 2;
   public static final int UC_ARM64_REG_NZCV = 3;
   public static final int UC_ARM64_REG_SP = 4;
   public static final int UC_ARM64_REG_WSP = 5;
   public static final int UC_ARM64_REG_WZR = 6;
   public static final int UC_ARM64_REG_XZR = 7;
   public static final int UC_ARM64_REG_B0 = 8;
   public static final int UC_ARM64_REG_B1 = 9;
   public static final int UC_ARM64_REG_B2 = 10;
   public static final int UC_ARM64_REG_B3 = 11;
   public static final int UC_ARM64_REG_B4 = 12;
   public static final int UC_ARM64_REG_B5 = 13;
   public static final int UC_ARM64_REG_B6 = 14;
   public static final int UC_ARM64_REG_B7 = 15;
   public static final int UC_ARM64_REG_B8 = 16;
   public static final int UC_ARM64_REG_B9 = 17;
   public static final int UC_ARM64_REG_B10 = 18;
   public static final int UC_ARM64_REG_B11 = 19;
   public static final int UC_ARM64_REG_B12 = 20;
   public static final int UC_ARM64_REG_B13 = 21;
   public static final int UC_ARM64_REG_B14 = 22;
   public static final int UC_ARM64_REG_B15 = 23;
   public static final int UC_ARM64_REG_B16 = 24;
   public static final int UC_ARM64_REG_B17 = 25;
   public static final int UC_ARM64_REG_B18 = 26;
   public static final int UC_ARM64_REG_B19 = 27;
   public static final int UC_ARM64_REG_B20 = 28;
   public static final int UC_ARM64_REG_B21 = 29;
   public static final int UC_ARM64_REG_B22 = 30;
   public static final int UC_ARM64_REG_B23 = 31;
   public static final int UC_ARM64_REG_B24 = 32;
   public static final int UC_ARM64_REG_B25 = 33;
   public static final int UC_ARM64_REG_B26 = 34;
   public static final int UC_ARM64_REG_B27 = 35;
   public static final int UC_ARM64_REG_B28 = 36;
   public static final int UC_ARM64_REG_B29 = 37;
   public static final int UC_ARM64_REG_B30 = 38;
   public static final int UC_ARM64_REG_B31 = 39;
   public static final int UC_ARM64_REG_D0 = 40;
   public static final int UC_ARM64_REG_D1 = 41;
   public static final int UC_ARM64_REG_D2 = 42;
   public static final int UC_ARM64_REG_D3 = 43;
   public static final int UC_ARM64_REG_D4 = 44;
   public static final int UC_ARM64_REG_D5 = 45;
   public static final int UC_ARM64_REG_D6 = 46;
   public static final int UC_ARM64_REG_D7 = 47;
   public static final int UC_ARM64_REG_D8 = 48;
   public static final int UC_ARM64_REG_D9 = 49;
   public static final int UC_ARM64_REG_D10 = 50;
   public static final int UC_ARM64_REG_D11 = 51;
   public static final int UC_ARM64_REG_D12 = 52;
   public static final int UC_ARM64_REG_D13 = 53;
   public static final int UC_ARM64_REG_D14 = 54;
   public static final int UC_ARM64_REG_D15 = 55;
   public static final int UC_ARM64_REG_D16 = 56;
   public static final int UC_ARM64_REG_D17 = 57;
   public static final int UC_ARM64_REG_D18 = 58;
   public static final int UC_ARM64_REG_D19 = 59;
   public static final int UC_ARM64_REG_D20 = 60;
   public static final int UC_ARM64_REG_D21 = 61;
   public static final int UC_ARM64_REG_D22 = 62;
   public static final int UC_ARM64_REG_D23 = 63;
   public static final int UC_ARM64_REG_D24 = 64;
   public static final int UC_ARM64_REG_D25 = 65;
   public static final int UC_ARM64_REG_D26 = 66;
   public static final int UC_ARM64_REG_D27 = 67;
   public static final int UC_ARM64_REG_D28 = 68;
   public static final int UC_ARM64_REG_D29 = 69;
   public static final int UC_ARM64_REG_D30 = 70;
   public static final int UC_ARM64_REG_D31 = 71;
   public static final int UC_ARM64_REG_H0 = 72;
   public static final int UC_ARM64_REG_H1 = 73;
   public static final int UC_ARM64_REG_H2 = 74;
   public static final int UC_ARM64_REG_H3 = 75;
   public static final int UC_ARM64_REG_H4 = 76;
   public static final int UC_ARM64_REG_H5 = 77;
   public static final int UC_ARM64_REG_H6 = 78;
   public static final int UC_ARM64_REG_H7 = 79;
   public static final int UC_ARM64_REG_H8 = 80;
   public static final int UC_ARM64_REG_H9 = 81;
   public static final int UC_ARM64_REG_H10 = 82;
   public static final int UC_ARM64_REG_H11 = 83;
   public static final int UC_ARM64_REG_H12 = 84;
   public static final int UC_ARM64_REG_H13 = 85;
   public static final int UC_ARM64_REG_H14 = 86;
   public static final int UC_ARM64_REG_H15 = 87;
   public static final int UC_ARM64_REG_H16 = 88;
   public static final int UC_ARM64_REG_H17 = 89;
   public static final int UC_ARM64_REG_H18 = 90;
   public static final int UC_ARM64_REG_H19 = 91;
   public static final int UC_ARM64_REG_H20 = 92;
   public static final int UC_ARM64_REG_H21 = 93;
   public static final int UC_ARM64_REG_H22 = 94;
   public static final int UC_ARM64_REG_H23 = 95;
   public static final int UC_ARM64_REG_H24 = 96;
   public static final int UC_ARM64_REG_H25 = 97;
   public static final int UC_ARM64_REG_H26 = 98;
   public static final int UC_ARM64_REG_H27 = 99;
   public static final int UC_ARM64_REG_H28 = 100;
   public static final int UC_ARM64_REG_H29 = 101;
   public static final int UC_ARM64_REG_H30 = 102;
   public static final int UC_ARM64_REG_H31 = 103;
   public static final int UC_ARM64_REG_Q0 = 104;
   public static final int UC_ARM64_REG_Q1 = 105;
   public static final int UC_ARM64_REG_Q2 = 106;
   public static final int UC_ARM64_REG_Q3 = 107;
   public static final int UC_ARM64_REG_Q4 = 108;
   public static final int UC_ARM64_REG_Q5 = 109;
   public static final int UC_ARM64_REG_Q6 = 110;
   public static final int UC_ARM64_REG_Q7 = 111;
   public static final int UC_ARM64_REG_Q8 = 112;
   public static final int UC_ARM64_REG_Q9 = 113;
   public static final int UC_ARM64_REG_Q10 = 114;
   public static final int UC_ARM64_REG_Q11 = 115;
   public static final int UC_ARM64_REG_Q12 = 116;
   public static final int UC_ARM64_REG_Q13 = 117;
   public static final int UC_ARM64_REG_Q14 = 118;
   public static final int UC_ARM64_REG_Q15 = 119;
   public static final int UC_ARM64_REG_Q16 = 120;
   public static final int UC_ARM64_REG_Q17 = 121;
   public static final int UC_ARM64_REG_Q18 = 122;
   public static final int UC_ARM64_REG_Q19 = 123;
   public static final int UC_ARM64_REG_Q20 = 124;
   public static final int UC_ARM64_REG_Q21 = 125;
   public static final int UC_ARM64_REG_Q22 = 126;
   public static final int UC_ARM64_REG_Q23 = 127;
   public static final int UC_ARM64_REG_Q24 = 128;
   public static final int UC_ARM64_REG_Q25 = 129;
   public static final int UC_ARM64_REG_Q26 = 130;
   public static final int UC_ARM64_REG_Q27 = 131;
   public static final int UC_ARM64_REG_Q28 = 132;
   public static final int UC_ARM64_REG_Q29 = 133;
   public static final int UC_ARM64_REG_Q30 = 134;
   public static final int UC_ARM64_REG_Q31 = 135;
   public static final int UC_ARM64_REG_S0 = 136;
   public static final int UC_ARM64_REG_S1 = 137;
   public static final int UC_ARM64_REG_S2 = 138;
   public static final int UC_ARM64_REG_S3 = 139;
   public static final int UC_ARM64_REG_S4 = 140;
   public static final int UC_ARM64_REG_S5 = 141;
   public static final int UC_ARM64_REG_S6 = 142;
   public static final int UC_ARM64_REG_S7 = 143;
   public static final int UC_ARM64_REG_S8 = 144;
   public static final int UC_ARM64_REG_S9 = 145;
   public static final int UC_ARM64_REG_S10 = 146;
   public static final int UC_ARM64_REG_S11 = 147;
   public static final int UC_ARM64_REG_S12 = 148;
   public static final int UC_ARM64_REG_S13 = 149;
   public static final int UC_ARM64_REG_S14 = 150;
   public static final int UC_ARM64_REG_S15 = 151;
   public static final int UC_ARM64_REG_S16 = 152;
   public static final int UC_ARM64_REG_S17 = 153;
   public static final int UC_ARM64_REG_S18 = 154;
   public static final int UC_ARM64_REG_S19 = 155;
   public static final int UC_ARM64_REG_S20 = 156;
   public static final int UC_ARM64_REG_S21 = 157;
   public static final int UC_ARM64_REG_S22 = 158;
   public static final int UC_ARM64_REG_S23 = 159;
   public static final int UC_ARM64_REG_S24 = 160;
   public static final int UC_ARM64_REG_S25 = 161;
   public static final int UC_ARM64_REG_S26 = 162;
   public static final int UC_ARM64_REG_S27 = 163;
   public static final int UC_ARM64_REG_S28 = 164;
   public static final int UC_ARM64_REG_S29 = 165;
   public static final int UC_ARM64_REG_S30 = 166;
   public static final int UC_ARM64_REG_S31 = 167;
   public static final int UC_ARM64_REG_W0 = 168;
   public static final int UC_ARM64_REG_W1 = 169;
   public static final int UC_ARM64_REG_W2 = 170;
   public static final int UC_ARM64_REG_W3 = 171;
   public static final int UC_ARM64_REG_W4 = 172;
   public static final int UC_ARM64_REG_W5 = 173;
   public static final int UC_ARM64_REG_W6 = 174;
   public static final int UC_ARM64_REG_W7 = 175;
   public static final int UC_ARM64_REG_W8 = 176;
   public static final int UC_ARM64_REG_W9 = 177;
   public static final int UC_ARM64_REG_W10 = 178;
   public static final int UC_ARM64_REG_W11 = 179;
   public static final int UC_ARM64_REG_W12 = 180;
   public static final int UC_ARM64_REG_W13 = 181;
   public static final int UC_ARM64_REG_W14 = 182;
   public static final int UC_ARM64_REG_W15 = 183;
   public static final int UC_ARM64_REG_W16 = 184;
   public static final int UC_ARM64_REG_W17 = 185;
   public static final int UC_ARM64_REG_W18 = 186;
   public static final int UC_ARM64_REG_W19 = 187;
   public static final int UC_ARM64_REG_W20 = 188;
   public static final int UC_ARM64_REG_W21 = 189;
   public static final int UC_ARM64_REG_W22 = 190;
   public static final int UC_ARM64_REG_W23 = 191;
   public static final int UC_ARM64_REG_W24 = 192;
   public static final int UC_ARM64_REG_W25 = 193;
   public static final int UC_ARM64_REG_W26 = 194;
   public static final int UC_ARM64_REG_W27 = 195;
   public static final int UC_ARM64_REG_W28 = 196;
   public static final int UC_ARM64_REG_W29 = 197;
   public static final int UC_ARM64_REG_W30 = 198;
   public static final int UC_ARM64_REG_X0 = 199;
   public static final int UC_ARM64_REG_X1 = 200;
   public static final int UC_ARM64_REG_X2 = 201;
   public static final int UC_ARM64_REG_X3 = 202;
   public static final int UC_ARM64_REG_X4 = 203;
   public static final int UC_ARM64_REG_X5 = 204;
   public static final int UC_ARM64_REG_X6 = 205;
   public static final int UC_ARM64_REG_X7 = 206;
   public static final int UC_ARM64_REG_X8 = 207;
   public static final int UC_ARM64_REG_X9 = 208;
   public static final int UC_ARM64_REG_X10 = 209;
   public static final int UC_ARM64_REG_X11 = 210;
   public static final int UC_ARM64_REG_X12 = 211;
   public static final int UC_ARM64_REG_X13 = 212;
   public static final int UC_ARM64_REG_X14 = 213;
   public static final int UC_ARM64_REG_X15 = 214;
   public static final int UC_ARM64_REG_X16 = 215;
   public static final int UC_ARM64_REG_X17 = 216;
   public static final int UC_ARM64_REG_X18 = 217;
   public static final int UC_ARM64_REG_X19 = 218;
   public static final int UC_ARM64_REG_X20 = 219;
   public static final int UC_ARM64_REG_X21 = 220;
   public static final int UC_ARM64_REG_X22 = 221;
   public static final int UC_ARM64_REG_X23 = 222;
   public static final int UC_ARM64_REG_X24 = 223;
   public static final int UC_ARM64_REG_X25 = 224;
   public static final int UC_ARM64_REG_X26 = 225;
   public static final int UC_ARM64_REG_X27 = 226;
   public static final int UC_ARM64_REG_X28 = 227;
   public static final int UC_ARM64_REG_V0 = 228;
   public static final int UC_ARM64_REG_V1 = 229;
   public static final int UC_ARM64_REG_V2 = 230;
   public static final int UC_ARM64_REG_V3 = 231;
   public static final int UC_ARM64_REG_V4 = 232;
   public static final int UC_ARM64_REG_V5 = 233;
   public static final int UC_ARM64_REG_V6 = 234;
   public static final int UC_ARM64_REG_V7 = 235;
   public static final int UC_ARM64_REG_V8 = 236;
   public static final int UC_ARM64_REG_V9 = 237;
   public static final int UC_ARM64_REG_V10 = 238;
   public static final int UC_ARM64_REG_V11 = 239;
   public static final int UC_ARM64_REG_V12 = 240;
   public static final int UC_ARM64_REG_V13 = 241;
   public static final int UC_ARM64_REG_V14 = 242;
   public static final int UC_ARM64_REG_V15 = 243;
   public static final int UC_ARM64_REG_V16 = 244;
   public static final int UC_ARM64_REG_V17 = 245;
   public static final int UC_ARM64_REG_V18 = 246;
   public static final int UC_ARM64_REG_V19 = 247;
   public static final int UC_ARM64_REG_V20 = 248;
   public static final int UC_ARM64_REG_V21 = 249;
   public static final int UC_ARM64_REG_V22 = 250;
   public static final int UC_ARM64_REG_V23 = 251;
   public static final int UC_ARM64_REG_V24 = 252;
   public static final int UC_ARM64_REG_V25 = 253;
   public static final int UC_ARM64_REG_V26 = 254;
   public static final int UC_ARM64_REG_V27 = 255;
   public static final int UC_ARM64_REG_V28 = 256;
   public static final int UC_ARM64_REG_V29 = 257;
   public static final int UC_ARM64_REG_V30 = 258;
   public static final int UC_ARM64_REG_V31 = 259;

// pseudo registers
   public static final int UC_ARM64_REG_PC = 260;
   public static final int UC_ARM64_REG_ENDING = 261;

// alias registers
   public static final int UC_ARM64_REG_IP1 = 215;
   public static final int UC_ARM64_REG_IP0 = 216;
   public static final int UC_ARM64_REG_FP = 1;
   public static final int UC_ARM64_REG_LR = 2;

}
