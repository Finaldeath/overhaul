//::///////////////////////////////////////////////
//:: Name q1hblake_oncon
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Adam Blake's on Conversation Event
    If he hasn't been cured - keep him on the ground,
    injured, for the conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 25/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    int nMatch = GetListenPatternNumber();
    object oShouter = GetLastSpeaker();

    if (nMatch == -1)
    {
        if (GetLocalInt(OBJECT_SELF, "nCured") != 1)
        {
            SetCommandable(TRUE, OBJECT_SELF);
            // Not a match -- start an ordinary conversation
            if (GetCommandable(OBJECT_SELF))
            {
                ClearActions(CLEAR_NW_C2_DEFAULT4_29);
                //object oDialog = GetObjectByTag("q1a1_drogancon");
                //ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 0.8, 19999.0);
                //AssignCommand(oDialog, ActionStartConversation(oShouter));
                object oDialog = GetObjectByTag("q1hblakedialog");
                AssignCommand(oDialog, ActionStartConversation(oShouter));
                SetCommandable(FALSE, OBJECT_SELF);
            }
        }
        else
        {
            BeginConversation("q1hblake", oShouter);
        }
    }
}
