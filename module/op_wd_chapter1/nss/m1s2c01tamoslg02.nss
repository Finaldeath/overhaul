#include "NW_I0_Plot"
void main()
{
    object oPlayer = GetPCSpeaker();
    ActionPauseConversation();
    ActionTakeItem(GetItemPossessedBy(oPlayer,"M1S2Broach"),oPlayer);
    ActionResumeConversation();
    GiveXPToCreature(oPlayer,50);
    AutoAlignG(DC_EASY,oPlayer);
    SetLocalInt(GetModule(),"NW_G_M1S2BroachPlotDone",TRUE);
}
