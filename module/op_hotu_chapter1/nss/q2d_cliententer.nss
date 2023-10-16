//::///////////////////////////////////////////////
//:: Name q2d_cliententer
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    if the PC is talking to Halaster and does a
    save and load - just jump them to chapter 2
    (same as aborting halaster's conversation)

    At the end of the PCs conversation with halaster
    we will jump the PC to module 2.
    Depending on what was chosen in the conversation,
    Nathyra and the chosen henchman will join the PC.
    If no choice was made in dialog - the henchman in
    the 2nd slot will be booted out to make room for
    Nathyra
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Sept 15/03
//:://////////////////////////////////////////////
#include "x0_i0_henchman"
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;



    if (GetLocalInt(oPC, "X2_Q2HalCon_JumpToChapter2") == 0)
        return;


/*    //If the PC never picked which henchman to fire and they
    //have two henchmen - fire the one in the second slot.
    object oHench = GetHenchman(oPC, 2);
    if (GetIsObjectValid(oHench) == TRUE)
        FireHenchman(oPC, oHench);

        Brent (Oct 1) Removed this bit.

*/
    //Fire any of the henchmen that is not Deekin.
    object oLinu = GetObjectByTag("x2_hen_linu");
    object oDaelan = GetObjectByTag("x2_hen_daelan");
    object oTomi = GetObjectByTag("x2_hen_tomi");
    object oSharwyn = GetObjectByTag("x2_hen_sharwyn");

    if (GetIsObjectValid(oLinu) == TRUE)
    {
        FireHenchman(oPC, oLinu);
    }
    if (GetIsObjectValid(oDaelan) == TRUE)
    {
        FireHenchman(oPC, oDaelan);
    }
    if (GetIsObjectValid(oTomi) == TRUE)
    {
        FireHenchman(oPC, oTomi);
    }
    if (GetIsObjectValid(oSharwyn) == TRUE)
    {
        FireHenchman(oPC, oSharwyn);
    }
    //Make sure Nathyrra isn't hanging around
    object oNathyrra = GetObjectByTag("x2_hen_nathyrra");
    if (GetIsObjectValid(oNathyrra) == TRUE)
        FireHenchman(oPC, oNathyrra);

    Reward_2daXP(oPC, 15, TRUE); //10000 xp reward if PC is less than 15th level

    SetImmortal(oPC, FALSE);
    //Execute chapter ending script
    ExecuteScript("x2_c1_end", OBJECT_SELF);
    //Start Chapter 2
    DelayCommand(3.5, StartNewModule("XP2_Chapter2"));

}
