// Scavenger golem user-defined events

//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 Place in the OnUserDefinedEvent handler for
 the appropriate creature, then edit that
 creature's OnSpawn script to generate any of
 the desired events.
*/

#include "nw_i0_generic"

void Restore(object oGolem)
{
    // Using will saving throw of the parts object to determine which golem to create
    effect eVis = EffectVisualEffect(VFX_IMP_RAISE_DEAD);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oGolem);
    effect eRes = EffectResurrection();
    effect eHeal = EffectHeal(1000);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eRes, oGolem);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oGolem);
    //AssignCommand(oGolem, SetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS));
    // attack nearby enemy
    DelayCommand(3.0, AssignCommand(oGolem, DetermineCombatRound()));
}

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    if (nEvent == EVENT_HEARTBEAT) {
        int nRand = Random(6);
        if(nRand >= 2)
            SpeakOneLinerConversation("q4b_scavenger");
        // finding nearest dead construct
        object oGolem = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_CONSTRUCT, OBJECT_SELF, 1, CREATURE_TYPE_IS_ALIVE, FALSE);
        // Raise a golem only if nearby AND enough time has passed (the "RESTORING" var)
        if(GetDistanceBetween(OBJECT_SELF, oGolem) <= 10.0 &&
            GetLocalInt(OBJECT_SELF, "RESTORING") == 0)
        {
            SetLocalInt(OBJECT_SELF, "RESTORING", 1); // prevent from restoring again
            ClearAllActions();
            ActionMoveToObject(oGolem, TRUE);
            ActionCastFakeSpellAtObject(SPELL_RESURRECTION, oGolem);
            ActionDoCommand(Restore(oGolem));
            ActionDoCommand(WalkWayPoints(FALSE, 0.0));
            DelayCommand(18.0, SetLocalInt(OBJECT_SELF, "RESTORING", 0)); // alows restoring again after 3 rounds
        }
        else if(GetLocalInt(OBJECT_SELF, "RESTORING") == 0)
            WalkWayPoints(FALSE, 0.0);

    } else if (nEvent == EVENT_PERCEIVE) {

    } else if (nEvent == EVENT_DIALOGUE) {

    } else if (nEvent == EVENT_DISTURBED) {

    } else if (nEvent == EVENT_ATTACKED) {

    } else if (nEvent == EVENT_DAMAGED) {

    } else if (nEvent == EVENT_END_COMBAT_ROUND) {

    } else if (nEvent == EVENT_SPELL_CAST_AT) {

    }

}


