//::///////////////////////////////////////////////
//:: M2Q2E_JAERTALK.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the player hasn't spoken to Jaer before.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: February 7, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult =  GetLocalInt(GetPCSpeaker(),"NW_M2Q2E_LJAERTALK") == 0;
    return iResult;

}
