//::///////////////////////////////////////////////
//:: Name hx_ari_truename
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Aribeth's True name is known and she is a
     henchman.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oHench = GetNearestObjectByTag("H2_Aribeth", oPC);
    int iName = GetLocalInt(GetModule(), "bKnower_AribethNamed");
    int bDoOnce = GetLocalInt(GetModule(), "bAribethNameUsed");

    if (iName == TRUE &&
        bDoOnce == FALSE)
    {
        if(GetMaster(oHench) == oPC)
        {
            return TRUE;
        }
    }
    return FALSE;
}
