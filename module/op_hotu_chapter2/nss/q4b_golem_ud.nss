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

#include "x0_i0_corpses"

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

    } else if (nEvent == EVENT_SPELL_CAST_AT) {

    } else if (nEvent == 1007) {

       // golems leave bodies only if the scavenger is still alive.
       object oScavenger = GetObjectByTag("q4b_scavenger");
       if(oScavenger != OBJECT_INVALID)
       {
            SetObjectIsDestroyable(OBJECT_SELF, FALSE, TRUE);
            DoActualKilling(OBJECT_SELF);
       }

    }

}


