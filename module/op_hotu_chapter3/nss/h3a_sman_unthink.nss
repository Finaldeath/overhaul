//::///////////////////////////////////////////////
//:: Sleeping Man, Clear the Think Variable (Action Script)
//:: H3a_SMan_UnThink.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Clears the variable that tracks who the
     Sleeping Man thinks his one true love is.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 31, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalString(GetModule(), "sSleepingManThinksTrueLoveIs", "");
    SetLocalInt(GetModule(), "bSleepingManHappilyEverAfter", FALSE);
}
