//::///////////////////////////////////////////////
//:: Mephistopheles, Valen Present (Condition Script)
//:: H9c_Meph_Valen1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Valen is in the area.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oValen = GetNearestObjectByTag("x2_hen_valen");
    if (oValen != OBJECT_INVALID)
    {
        //Flag them as having been present for the battle.
        SetLocalInt(GetModule(), "bValenEndBattle", TRUE);
        return TRUE;
    }
    return FALSE;
}
