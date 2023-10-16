//::///////////////////////////////////////////////
//:: Heartbeat
//:: m2q3Odeel_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Odeel will walk up to the planted tree and
    start a conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 27, 2001
//:://////////////////////////////////////////////

void main()
{
    object oTree = GetNearestObjectByTag("M2Q2PLDRUIDTREE");

    if (GetIsObjectValid(oTree))
    {
        ClearAllActions();
        if (GetDistanceToObject(oTree) > 3.0)
        {
            ActionMoveToObject(oTree);
        }
        else
        {
            ActionStartConversation(OBJECT_SELF);
        }
    }
}
