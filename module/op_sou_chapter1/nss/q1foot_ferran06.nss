// Ferran takes the horns
// reward the player with XP

#include "NW_I0_PLOT"

void main()
{
    object oHorns = GetItemPossessedBy(GetPCSpeaker(), "q1foot_horns");
    RewardXP("xpmid", 100, GetPCSpeaker());
    ActionPauseConversation();
    ActionTakeItem(oHorns, GetPCSpeaker());
    ActionResumeConversation();
}
