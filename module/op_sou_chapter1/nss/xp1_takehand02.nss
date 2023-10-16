// Ayala lets the PC keep the Mummified Hand

#include "NW_I0_PLOT"

void main()
{
    /* object oHand = GetItemPossessedBy(GetPCSpeaker(), "mummifiedhand");
    ActionPauseConversation();
    ActionDoCommand(ClearAllActions());
    ActionTakeItem(oHand, GetPCSpeaker());
    ActionResumeConversation();*/

    SetLocalInt(GetPCSpeaker(), "Hand_Quest", 1);
}
