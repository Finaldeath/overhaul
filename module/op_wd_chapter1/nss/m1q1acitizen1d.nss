//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
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
        }
    }


}

