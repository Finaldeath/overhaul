//::///////////////////////////////////////////////
//:: con_UnderInfo3
//::
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Checks the state of the Undermountain_Info variable
   1 = Player knows Halaster has vanished
   2 = Durnan told Halaster has vanished
   3 = Player knows Halaster captured by Drow
   4 = Durnan told Halaster captured by Drow
   5 = Player knows of The Matron
   6 = Player told Halaster of The Matron
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),("Undermountain_Info"))==3;
    return iResult;
}
