//::///////////////////////////////////////////////
//:: Perceived
//:: m2Init2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Start conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 20, 2001
//:://////////////////////////////////////////////

void main()
{
    if(GetLastPerceptionSeen() && GetIsPC(GetLastPerceived()))
    {
        ActionStartConversation(OBJECT_SELF);
    }
}
