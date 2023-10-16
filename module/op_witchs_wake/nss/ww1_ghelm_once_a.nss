//::///////////////////////////////////////////////
//:: Witch's Wake 1: Item Conv, Gravehelm - Do Once (Action)
//:: WW1_GHelm_Once_A.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the Gravehelm's DoOnce on the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: May 26, 2004
//:://////////////////////////////////////////////

void main()
{
//    SetLocalInt(GetPCSpeaker(), "bGravehelmLowered", TRUE);
    object oHelm = GetItemPossessedBy(GetPCSpeaker(), "ww1_gravehelm");
    SetPlotFlag(oHelm, FALSE);
}
