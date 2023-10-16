//::///////////////////////////////////////////////
//:: Name hx_ari_romance_1
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

    if(iRomance == 1)
    {
        return TRUE;
    }
    return FALSE;
}
