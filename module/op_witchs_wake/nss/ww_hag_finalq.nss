//::///////////////////////////////////////////////
//:: Witchwork: The PC's Final Question to the Night Hag
//:: WW_Hag_FinalQ.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the player as having asked his final
     question of the Night Hag
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 13, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "bFinalQ", TRUE);
}
