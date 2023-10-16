//::///////////////////////////////////////////////
//:: Name con_tomi_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    if Tomi can see either Daelan or Sharwyn return TRUE
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 16/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oDaelan = GetObjectByTag("x2_hen_daelan");
    object oSharwyn = GetObjectByTag("x2_hen_sharwyn");

    if (GetObjectSeen(oDaelan) == TRUE || GetObjectSeen(oSharwyn) == TRUE)
        return TRUE;
    return FALSE;


}
