//::///////////////////////////////////////////////
//:: Name: q2b_conv_mirror
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Have placeable start its conversation file with
    whoever just used it.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 16/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;

    SetLocalInt(OBJECT_SELF, "nTriggered", 1);
    ActionStartConversation(GetLastUsedBy());
}
