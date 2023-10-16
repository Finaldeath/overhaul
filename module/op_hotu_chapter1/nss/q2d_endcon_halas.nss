//::///////////////////////////////////////////////
//:: Name q2d_endcon_halas
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    At the end of the PCs conversation with halaster
    we will jump the PC to module 2.
    Depending on what was chosen in the conversation,
    Nathyra and the chosen henchman will join the PC.
    If no choice was made in dialog - the henchman in
    the 2nd slot will be booted out to make room for
    Nathyra
    //UPDATE Oct 9 - Only Deekin, if he's in the party goes
    with the PC - other henchmen do not continue on
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 15/03
//:://////////////////////////////////////////////
#include "x0_i0_henchman"
void main()
{
    object oPC = GetPCSpeaker();
    //Fire any of the henchmen that is not Deekin.
    object oLinu = GetObjectByTag("x2_hen_linu");
    object oDaelan = GetObjectByTag("x2_hen_daelan");
    object oTomi = GetObjectByTag("x2_hen_tomi");
    object oSharwyn = GetObjectByTag("x2_hen_sharwyn");

    if (GetIsObjectValid(oLinu) == TRUE)
    {
        if (GetIsObjectValid(GetMaster(oLinu)) == TRUE)
        {
            FireHenchman(oPC, oLinu);
            SetLocalInt(GetModule(), "bLinuMetHalaster", 1);
        }
    }
    if (GetIsObjectValid(oDaelan) == TRUE)
    {
        if (GetIsObjectValid(GetMaster(oDaelan)) == TRUE)
        {
            FireHenchman(oPC, oDaelan);
            SetLocalInt(GetModule(), "bDaelanMetHalaster", 1);
        }
    }
    if (GetIsObjectValid(oTomi) == TRUE)
    {
        if (GetIsObjectValid(GetMaster(oTomi)) == TRUE)
        {
            FireHenchman(oPC, oTomi);
            SetLocalInt(GetModule(), "bTomiMetHalaster", 1);
        }
    }
    if (GetIsObjectValid(oSharwyn) == TRUE)
    {
        if (GetIsObjectValid(GetMaster(oSharwyn)) == TRUE)
        {
            FireHenchman(oPC, oSharwyn);
            SetLocalInt(GetModule(), "bSharwynMetHalaster", 1);
        }
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
