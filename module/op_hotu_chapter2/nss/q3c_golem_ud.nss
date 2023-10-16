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


void main()
{
    int nEvent = GetUserDefinedEventNumber();

    if (nEvent == EVENT_HEARTBEAT) {
        if(GetLocalInt(OBJECT_SELF, "NO_FOLLOW") == 1)
            return;
        object oMaster = GetLocalObject(OBJECT_SELF, "MASTER");
        if(GetArea(oMaster) != GetArea(OBJECT_SELF))
            JumpToObject(oMaster);
        if(!GetIsInCombat(OBJECT_SELF))
            ActionForceMoveToObject(oMaster);

    } else if (nEvent == EVENT_PERCEIVE) {

    } else if (nEvent == EVENT_DIALOGUE) {

    } else if (nEvent == EVENT_DISTURBED) {

    } else if (nEvent == EVENT_ATTACKED) {

    } else if (nEvent == EVENT_DAMAGED) {

    } else if (nEvent == EVENT_END_COMBAT_ROUND) {

    } else if (nEvent == EVENT_SPELL_CAST_AT) {

    }

}


