//::///////////////////////////////////////////////
//:: Conversation End
//:: M2Q5WITLESSEND
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Restart the witless fighter moving upstairs.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 12, 2002
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_Moving") == 10)
    {
        SignalEvent(OBJECT_SELF,EventUserDefined(500));
    }
}
