//::///////////////////////////////////////////////
//:: Mephistopheles' Fate, Not Commanded by True Name (Action Script)
//:: H9a_Meph_Fate8.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Mephistopheles leaves defeated. He was not
     commanded by his True Name, however, so he's
     free to plot his revenge from the safety of
     Cania.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Edited By: Brad Prince
//:: Created On: September 10, 2003
//:://////////////////////////////////////////////
#include "hx_inc_meph"
void main()
{
    /*//Set M's Fate local
    SetLocalString(GetModule(), "sMephistophelesFate", "NotCommanded");

    //Have him disappear in a Gate VFX
    effect eGate = EffectVisualEffect(VFX_FNF_SUMMON_CELESTIAL);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eGate, OBJECT_SELF);

    //Destroy Mephistopheles
    PlayVoiceChat(VOICE_CHAT_LAUGH);
    DestroyObject(OBJECT_SELF, 3.0);

    //Add Journal entry
    object oPC = GetPCSpeaker();
    DelayCommand(3.5, AddJournalQuestEntry("XP2_Main", 110, oPC, TRUE, TRUE));
    DelayCommand(2.7, ExecuteScript("hx_sendpc_to_end", oPC));
    */

    //Destroy Mephistopheles
    DoMephEnd(OBJECT_SELF, GetPCSpeaker(), 8);
}
