//::///////////////////////////////////////////////
//:: Name q2a_hb_worshiper
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default Worshipper Heartbeat
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

void main()
{
    if (GetAILevel() == AI_LEVEL_VERY_LOW)
        return;

    if (IsInConversation(OBJECT_SELF) == TRUE)
        return;

    if (GetLocalInt(OBJECT_SELF, "nWorshipping") == 1)
        return;

    SetLocalInt(OBJECT_SELF, "nWorshipping", 1);
    ActionDoCommand(SetFacingPoint(GetPosition(GetObjectByTag("q2aworshippoint"))));
    ActionDoCommand(ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0, 1000.0));
    DelayCommand(1000.0, SetLocalInt(OBJECT_SELF, "nWorshipping", 0));
}
