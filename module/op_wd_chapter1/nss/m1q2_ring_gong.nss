//::///////////////////////////////////////////////
//:: m1q2 Ring the Gong
//:: m1q2_Ring_Gong
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script takes some of the functionality
    of the generic m1q2_GongPatrolD script and
    moves it to the conversation file. After
    saying this line, the patroller will run to
    the gong and ring it.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Nov 26, 2001
//:://////////////////////////////////////////////

void main()
{
    object oGong = GetNearestObjectByTag("Alarm_Gong");

    SetLocalInt(OBJECT_SELF, "ConversationState", 0);
    SetLocalInt(OBJECT_SELF, "GongTask", TRUE);

    ClearAllActions();
    ActionMoveToObject(oGong, TRUE);
    ActionInteractObject(oGong);
}
