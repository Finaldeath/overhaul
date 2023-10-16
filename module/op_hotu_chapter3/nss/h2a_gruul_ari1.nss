//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, Aribeth Sold Into Slavery (Action Script)
//:: H2a_Gruul_Ari1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Aribeth is sold into slavery
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 7, 2003
//:://////////////////////////////////////////////
#include "x2_inc_toollib"
#include "nw_i0_plot"
void main()
{
    //Identify the Hench in question
    object oHench = GetObjectByTag("H2_Aribeth");

    //Apply True Name VFX
    object oPC = GetPCSpeaker();
    MusicBackgroundStop(GetArea(oPC));
    MusicBackgroundChangeDay(GetArea(oPC), 40);
    MusicBackgroundChangeNight(GetArea(oPC), 40);
    DelayCommand(0.2, MusicBackgroundPlay(GetArea(oPC)));
    NightToDay(oPC, 2.0);
    TLVFXPillar(VFX_FNF_PWSTUN, GetLocation(oHench), 4, 0.1, 6.0, -2.0);

    //Hench VO
    PlayVoiceChat(VOICE_CHAT_CUSS, oHench);

    //Remove Hench from party
    RemoveHenchman(oPC, oHench);

    //Destroy Hench
    AssignCommand(oHench, SetIsDestroyable(TRUE, FALSE, FALSE));
    DestroyObject(oHench, 2.0);

    //Give player the artifact
    CreateItemOnObject("h2_gruul_artifac", oPC);

    //Evil alignment hit
    AdjustAlignment(oPC, ALIGNMENT_EVIL, 10);

    //Journal entry
    AddJournalQuestEntry("XP2_Name_Aribeth", 80, oPC, TRUE, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 148;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
