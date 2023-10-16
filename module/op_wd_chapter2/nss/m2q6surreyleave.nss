//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6SurreyLeave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Surrey escapes.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 14, 2001
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_Reward") == 10)
    {
        ActionMoveToObject(GetWaypointByTag("WP_SURREYEXIT"),TRUE);
        ActionDoCommand(DestroyObject(OBJECT_SELF));
        SetCommandable(FALSE);
    }
}
