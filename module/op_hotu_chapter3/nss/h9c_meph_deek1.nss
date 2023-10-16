//::///////////////////////////////////////////////
//:: Mephistopheles, Deekin Present (Condition Script)
//:: H9c_Meph_Deek1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Deekin is in the area.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oDeekin = GetNearestObjectByTag("x2_hen_deekin");
    if (oDeekin != OBJECT_INVALID)
    {
        //Flag them as having been present for the battle.
        SetLocalInt(GetModule(), "bDeekinEndBattle", TRUE);
        return TRUE;
    }
    return FALSE;
}
