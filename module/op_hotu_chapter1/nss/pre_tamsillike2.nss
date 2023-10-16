// PRE_TAMSILLIKE2
//
// Sets a module global to false if Tamsil likes the PC
// this affects her reaction to the PC if he/she talks to her later

void main()
{
    SetLocalInt(GetModule(), "NW_TAMSIL_DISLIKE", 0);
}
