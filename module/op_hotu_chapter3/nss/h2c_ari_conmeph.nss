//::///////////////////////////////////////////////
//:: Aribeth, PC Knows She Confronted Mephistopheles (Condition Script)
//:: H2c_Ari_ConMeph.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player has learned that
     Aribeth confronted Mephistopheles.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 16, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bConfront = GetLocalInt(GetModule(), "bAribethConfrontedMephistopheles");
    if (bConfront == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
