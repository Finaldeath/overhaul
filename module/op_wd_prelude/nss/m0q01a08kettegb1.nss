#include "NW_I0_Plot"

void main()
{
  SetLocalInt(GetModule(),"NW_G_M0Q01_ROGUE_TEST",2);
  object oPC = GetPCSpeaker();
  object oItem = GetFirstItemInInventory(oPC);
  ActionPauseConversation();
  while(GetIsObjectValid(oItem))
  {
    if(GetTag(oItem) == "NW_ROGUE_ITEM")
    {
        ActionTakeItem(oItem, oPC);
    }
    oItem = GetNextItemInInventory(oPC);
  }
  ActionResumeConversation();
}

