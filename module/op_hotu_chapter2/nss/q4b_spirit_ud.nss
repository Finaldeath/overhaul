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

#include "nw_i0_plot"

void Kill()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_KILL_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_KILL_ONCE", 1);

    effect eDeath = EffectDeath();
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, OBJECT_SELF);
    Reward_2daXP(GetFirstPC(), 29);
}

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    if (nEvent == EVENT_HEARTBEAT) {

    } else if (nEvent == EVENT_PERCEIVE) {

    } else if (nEvent == EVENT_DIALOGUE) {

    } else if (nEvent == EVENT_DISTURBED) {

    } else if (nEvent == EVENT_ATTACKED) {

    } else if (nEvent == EVENT_DAMAGED) {

    } else if (nEvent == EVENT_END_COMBAT_ROUND) {
        int nRound = GetLocalInt(OBJECT_SELF, "ROUNDS");
        nRound++;
        SetLocalInt(OBJECT_SELF, "ROUNDS", nRound);
        if(nRound == 12)
        {
            // Not more than 12 rounds for this spirit...
            Kill();
            return;
        }
        object oItemLeft = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, OBJECT_SELF);
        object oItemRight = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, OBJECT_SELF);
        if(oItemLeft == OBJECT_INVALID && oItemRight == OBJECT_INVALID)
        {
            // Has been disarmed - time to die
            Kill();
            return;
        }

    } else if (nEvent == EVENT_SPELL_CAST_AT) {

    } else if(nEvent == 1007) // death
    {
        object oDoor = GetObjectByTag("q4b_spirit_door");
        SetLocked(oDoor, FALSE);
        SetTrapDisabled(oDoor);
        AssignCommand(oDoor, ActionOpenDoor(oDoor));
        effect eVis = EffectVisualEffect(VFX_IMP_DEATH_L);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(OBJECT_SELF));
    }

}


