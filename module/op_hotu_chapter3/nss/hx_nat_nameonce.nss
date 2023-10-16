//::///////////////////////////////////////////////
//:: Name hx_nat_truename
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Nathyrra's True name is known and she is a
     henchman.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oHench = GetNearestObjectByTag("x2_hen_nathyra", oPC);
    int iName = GetLocalInt(GetModule(), "bKnower_NathyrraNamed");
    int bDoOnce = GetLocalInt(GetModule(), "bNathyrraNameUsed");

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
