//::///////////////////////////////////////////////
//:: Sleeping Man, Spurned (Action Script)
//:: H2a_SMan_UnThink.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag the Sleeping Man as having been spurned
     by the woman he believes to be his love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 31, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "bSleepingManSpurned", TRUE);
    SetLocalInt(GetModule(), "bSleepingManHappilyEverAfter", FALSE);
}
