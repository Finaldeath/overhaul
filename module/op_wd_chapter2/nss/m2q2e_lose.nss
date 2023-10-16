//::///////////////////////////////////////////////
//:: M2Q2E_LOSE.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if you lost the battle.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: February 7, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    if(GetLocalInt(GetPCSpeaker(),"NW_M2Q2E_LKILLED")==5)
    {
        return TRUE;
    }
        return FALSE;
}
