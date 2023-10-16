//::///////////////////////////////////////////////
//:: M2Q2E_WIN4.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the first circle battle was won.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: February 7, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    if(GetLocalInt(GetPCSpeaker(),"NW_M2Q2E_LKILLED") == 4)
    {
        return TRUE;
    }
    return FALSE;
}
