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
        object oAltar = GetNearestObjectByTag("Q1_ALTAR");
        if(oAltar != OBJECT_INVALID)
        {
            // Altar has not been destroyed yet - beg for help
            SpeakOneLinerConversation("q1_zidan_beg");
            ActionPlayAnimation(ANIMATION_LOOPING_TALK_PLEADING, 1.0, 2.0);
            return;
        }
        // altar has been destroyed - might follow pc
        object oFollow = GetLocalObject(OBJECT_SELF, "Q1_FOLLOW");
        if(oFollow != OBJECT_INVALID)
        {
            ClearAllActions();
            ActionForceMoveToObject(oFollow, TRUE, 1.0, 8.0);
        }
    }
    return;

}
