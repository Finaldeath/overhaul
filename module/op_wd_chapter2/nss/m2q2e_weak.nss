//::///////////////////////////////////////////////
//:: M2Q2E_WEAK
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the 'weak' local has been set
    i.e., the player has a ring but his/her level is too low to continue
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: February 7, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    if(GetLocalInt(GetPCSpeaker(),"NW_M2Q2E_LWEAK") == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
