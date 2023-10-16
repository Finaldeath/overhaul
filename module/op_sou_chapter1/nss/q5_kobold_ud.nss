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

    } else if (nEvent == EVENT_PERCEIVE) {

    } else if (nEvent == EVENT_DIALOGUE) {

    } else if (nEvent == EVENT_DISTURBED) {

    } else if (nEvent == EVENT_ATTACKED) {

    } else if (nEvent == EVENT_DAMAGED) {

    } else if (nEvent == EVENT_END_COMBAT_ROUND) {

    } else if (nEvent == EVENT_SPELL_CAST_AT) {

    } else if (nEvent == 101) // go to guard room
    {
        object oWP = GetWaypointByTag("Q5_WP_KOBOLD_ENTRANCE3");
        SetLocalInt(OBJECT_SELF, "Q5_CANCEL_MOBILE_ANIMATION", 1);
        effect eSleep = GetFirstEffect(OBJECT_SELF);
        while(GetIsEffectValid(eSleep))
        {
            if(GetEffectCreator(eSleep) == OBJECT_SELF)
               RemoveEffect(OBJECT_SELF, eSleep);
            eSleep = GetNextEffect(OBJECT_SELF);
        }
        ClearAllActions();
        DelayCommand(2.0, ActionMoveToObject(oWP, TRUE));
    }

    return;
}


