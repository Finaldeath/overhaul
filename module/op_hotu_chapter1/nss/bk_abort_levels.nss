//::///////////////////////////////////////////////
//:: bk_abort_levels
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script runs when the player aborts
    out of the level up dialog.
    It will auto level them up unless they haven't read
    the part about resting yet - then it will just start
    the conversation over
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: July 16, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetXP(oPC, 105000);

    ExecuteScript("bk_auto_level", oPC);

}
