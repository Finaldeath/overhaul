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
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if(IsInConversation(OBJECT_SELF) == FALSE &&
           GetCurrentAction() == ACTION_INVALID)
        {
            ClearAllActions();
            ActionDoCommand(SetFacingPoint(GetPosition(GetNearestObjectByTag("WP_GroupFacing"))));
            ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL);
            ActionPlayAnimation(ANIMATION_LOOPING_LISTEN);
            ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL);
            if (Random(4) == 1)
                SpeakOneLinerConversation("q2atavern");
        }
    }


}
