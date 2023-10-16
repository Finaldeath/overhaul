//::///////////////////////////////////////////////
//:: M2Q2E_WIN2.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the third circle battle was won.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: February 7, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    if(GetLocalInt(GetPCSpeaker(),"NW_M2Q2E_LKILLED") == 2)
    {
        return TRUE;
    }
    return FALSE;
}
