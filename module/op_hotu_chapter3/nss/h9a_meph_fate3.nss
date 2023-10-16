//::///////////////////////////////////////////////
//:: Mephistopheles' Fate, Banished to Cania (Action Script)
//:: H9a_Meph_Fate3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Mephistopheles is banished back to Cania.
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
    SetLocalString(GetModule(), "sMephistophelesFate", "Banished");

    //Have him disappear in a Gate VFX
    effect eGate = EffectVisualEffect(VFX_FNF_SUMMON_CELESTIAL);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eGate, OBJECT_SELF);

    //Destroy Mephistopheles
    PlayVoiceChat(VOICE_CHAT_DEATH);
    DestroyObject(OBJECT_SELF, 3.0);

    //Add Journal entry
    object oPC = GetPCSpeaker();
    DelayCommand(2.7, ExecuteScript("hx_sendpc_to_end", oPC));
    DelayCommand(3.5, AddJournalQuestEntry("XP2_Main", 110, oPC, TRUE, TRUE));
    */

    //Destroy Mephistopheles
    DoMephEnd(OBJECT_SELF, GetPCSpeaker(), 3);
}
