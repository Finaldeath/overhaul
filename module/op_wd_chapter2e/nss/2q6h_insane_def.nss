//::///////////////////////////////////////////////
//:: Prisoner Custom User Defined Event
//:: 2Q6H_INSANE_DEF
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Runs insane rants every couple of heartbeats
    randomly
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 1, 2002
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if(d10()> 1)
        {
            ActionStartConversation(OBJECT_SELF);
        }
    }
}

