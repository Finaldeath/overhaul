//::///////////////////////////////////////////////
//:: Sleeping Man, True Name: Believe Lie (Action Script)
//:: H3a_SMan_NameBel.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Adds the proper journal entry and does the
     True Name VFX.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
#include "x2_inc_toollib"
void main()
{
    //Journal Entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Name_SMan", 40, oPC, TRUE, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 190;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

    //effect eVFX = EffectVisualEffect(VFX_FNF_SUNBEAM);
    //ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, OBJECT_SELF);
    if(GetTag(GetArea(oPC)) == "Waterdeep")
    {
        MusicBackgroundStop(GetArea(oPC));
        MusicBackgroundChangeDay(GetArea(oPC), 40);
        MusicBackgroundChangeNight(GetArea(oPC), 40);
        DelayCommand(0.2, MusicBackgroundPlay(GetArea(oPC)));
        NightToDay(oPC, 2.0);
    }
    TLVFXPillar(VFX_FNF_PWSTUN, GetLocation(OBJECT_SELF), 4, 0.1, 6.0, -2.0);
}
