//::///////////////////////////////////////////////
//:: Sleeping Man, Happily Ever After (Action Script)
//:: H3a_SMan_Happy.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the Sleeping Man as living happily
     ever after (for end narration). Not
     required for Player romance.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 31, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "bSleepingManHappilyEverAfter", TRUE);

    //Flag the Sleeping Man as being un-spurned.
    SetLocalInt(GetModule(), "bSleepingManSpurned", FALSE);
}
