//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Changes Yazka and Urko factions to attack mode
     and sets that PC allied with Yazka, for her
     conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron & Dan Whiteside
//:: Created On: Feb 6, 2003
//:://////////////////////////////////////////////
#include "dan_plot_locals"
#include "nw_i0_generic"
void main()
{
    object oUrko = OBJECT_SELF;
    object oYazka = GetNearestObjectByTag("q2_yazka");
    AdjustReputation(oUrko, oYazka, -100);
    AdjustReputation(oYazka, oUrko, -100);
    AdjustReputation(GetPCSpeaker(), oUrko, -100);
    AdjustReputation(oUrko, GetPCSpeaker(), -100);
    AssignCommand(oYazka, ActionAttack(oUrko));
    YazkaThinksSheIsLeader(GetModule());
    SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_SHOUT);
    SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_SHOUT);
    AssignCommand(oYazka, SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_SHOUT));
    AssignCommand(oYazka, SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_SHOUT));

    //Set PCs party to be yazka's ally
    object oSpeaker = GetPCSpeaker();
    SetLocalInt(oSpeaker, "X1_Q2YAZKA_ALLY", 1);
    object oPC = GetFirstFactionMember(oSpeaker);
    while (oPC != OBJECT_INVALID)
    {
        SetLocalInt(oPC, "X1_Q2YAZKA_ALLY", 1);
        oPC = GetNextFactionMember(oSpeaker);
    }

    //Make all kobolds attack
    object oArea = GetArea(OBJECT_SELF);
    object oCreature = GetFirstObjectInArea(oArea);
    while (oCreature != OBJECT_INVALID)
    {
        if (GetTag(oCreature) == "q2_kipper" || GetTag(oCreature) == "NW_KOBOLD001" || GetTag(oCreature) == "NW_KOBOLD004" || GetTag(oCreature) == "FleeingKobold")
        {
            SetIsTemporaryEnemy(oPC, oCreature);
            AssignCommand(oCreature, DetermineCombatRound(oPC));
        }
        oCreature = GetNextObjectInArea(oArea);
    }
}
