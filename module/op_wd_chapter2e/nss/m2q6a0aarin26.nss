// marks Aarin as already having made the forged documents
// takes the seal from the player, destroys it, and creates the documents on the player
#include "nw_i0_plot"

void main()
{
    object oSeal = GetItemPossessedBy(GetPCSpeaker(),"M2Q6A0SEAL");
    SetLocalInt(OBJECT_SELF,"Chapter2_Aarin_Made_Forgery",1);
    ActionPauseConversation();
    ActionTakeItem(oSeal,GetPCSpeaker());
    RewardXP("M1Q1AarinXP",100, GetPCSpeaker());
    DestroyObject(oSeal);
    CreateItemOnObject("M2Q06IAARINPASS",GetPCSpeaker());
    ActionResumeConversation();
}
