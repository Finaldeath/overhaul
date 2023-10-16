//::///////////////////////////////////////////////
//:: Mephistopheles, Nathyrra Present (Condition Script)
//:: H9c_Meph_Nathy1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Nathyrra is in the area.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oNathyrra = GetNearestObjectByTag("x2_hen_nathyra");
    if (oNathyrra != OBJECT_INVALID)
    {
        //Flag them as having been present for the battle.
        SetLocalInt(GetModule(), "bNathyrraEndBattle", TRUE);
        return TRUE;
    }
    return FALSE;
}
