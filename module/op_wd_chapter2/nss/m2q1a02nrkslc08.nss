#include "m2_i0_plot"
#include "NW_I0_PLOT"

void main()
{
    ActionPauseConversation();
    ActionTakeItem(GetItemPossessedBy(GetPCSpeaker(), "M2Q1ITALHTOOTH"), GetPCSpeaker());
    SetLocalInt(GetModule(), "NW_L_M2Q1A02NEURIK_PLOT", 80);
    SetPartyLocalInt(GetPCSpeaker(), "NW_L_M2Q1A02NEURIK_PLOT", 80);
    RewardXP("m2q1_Lycanthropy",100, GetPCSpeaker());
    ActionResumeConversation();
}
