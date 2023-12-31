//::///////////////////////////////////////////////
//:: Generic Combat Conversation Check
//:: NW_D2_boss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see whether the NPC has an initialized
    NPC is using SetSpecialCombatConversationStart
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 7, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

int StartingConditional()
{
    if(GetSpawnInCondition(NW_FLAG_SPECIAL_COMBAT_CONVERSATION))
    {
        if(!GetIsObjectValid(GetPCSpeaker()))
        {
            ActionPauseConversation();
            ClearAllActions();
            ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT);
            //ActionWait(1.0);
            ActionDoCommand(DetermineCombatRound());
            ActionResumeConversation();
            return TRUE;
        }
    }
    return FALSE;
}


