// PRE_TAMSILLIKE
//
// Sets a module global to true if Tamsil doesn't like the PC
// this affects her reaction to the PC if he/she talks to her later

void main()
{
    SetLocalInt(GetModule(), "NW_TAMSIL_DISLIKE", 1);
}
