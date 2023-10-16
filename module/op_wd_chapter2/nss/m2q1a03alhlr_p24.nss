#include "m2_i0_plot"

void main()
{
    SetPartyLocalInt(GetPCSpeaker(), "NW_L_M2Q1A02NEURIK_PLOT", 30);
    ActionPauseConversation();
    ActionTakeItem(GetItemPossessedBy(GetPCSpeaker(), "M2Q1ITRING03"), GetPCSpeaker());
    ActionResumeConversation();
}
