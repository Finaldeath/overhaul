//::///////////////////////////////////////////////
//:: FileName q2_at_urko_att
//:://////////////////////////////////////////////
/*
    Have all the kobolds attack the pc
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 12/2/2003
//:://////////////////////////////////////////////
#include "nw_i0_generic"

void main()
{

    // Set the faction to hate the player, then attack the player
    object oPC = GetPCSpeaker();
    AdjustReputation(oPC, OBJECT_SELF, -100);
    AdjustReputation(OBJECT_SELF, oPC, -100);
    object oYazka = GetNearestObjectByTag("q2_yazka");
    AdjustReputation(oPC, oYazka, -100);
    AdjustReputation(oYazka, oPC, -100);
    ClearAllActions();
    DetermineCombatRound(oPC);
    AssignCommand(oYazka, DetermineCombatRound(oPC));
    SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_SHOUT);
    SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_SHOUT);

    //Make all kobolds attack
    object oArea = GetArea(OBJECT_SELF);
    object oCreature = GetFirstObjectInArea(oArea);
    while (oCreature != OBJECT_INVALID)
    {
        if (GetTag(oCreature) == "q2_yazka" || GetTag(oCreature) == "q2_kipper" || GetTag(oCreature) == "NW_KOBOLD001" || GetTag(oCreature) == "NW_KOBOLD004" || GetTag(oCreature) == "FleeingKobold")
        {
            SetIsTemporaryEnemy(oPC, oCreature);
            AssignCommand(oCreature, DetermineCombatRound(oPC));
        }
        oCreature = GetNextObjectInArea(oArea);
    }
}
