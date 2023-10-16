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
        int nRand = Random(3);
        if(nRand == 0)
            ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT);
        else if(nRand == 1)
            ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT);

    }
    return;

}
