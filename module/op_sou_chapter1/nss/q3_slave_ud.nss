//::///////////////////////////////////////////////
//:: Default: On User Defined
//:: NW_C2_DEFAULTD
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    on a user defined event.
*/
//:://////////////////////////////////////////////
//:: Created By: Don Moar
//:: Created On: April 28, 2002
//:://////////////////////////////////////////////
void main()
{
    // enter desired behaviour here
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == EVENT_HEARTBEAT)
    {
        if(GetLocalInt(GetModule(), "q3_Slave_Hate") == 1)
        {
            object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
            float fDistance = GetDistanceBetween(oPC, OBJECT_SELF);
            if(fDistance > 5.0)
                return;
            ClearAllActions();
            object oWP = GetNearestObjectByTag("Q3_WP_SLAVE_HATE", OBJECT_SELF, 2);
            ActionMoveToObject(oWP, TRUE);
            ActionDoCommand(SetFacingPoint(GetPosition(oPC)));
            ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 1.0, 3.0);
        }
    }
    return;

}
