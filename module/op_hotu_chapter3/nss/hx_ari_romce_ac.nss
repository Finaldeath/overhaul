//::///////////////////////////////////////////////
//:: Name hx_ari_romce_ac
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Romance with Aribeth.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iRomance = GetLocalInt(GetModule(), "iAribethRomance");

    if(iRomance > 0)
    {
        return TRUE;
    }
    return FALSE;
}
