#include "NW_I0_Plot"
#include "NW_J_FETCH"
void main()
{
    SetLocalInt(Global(), "NW_J_FETCHPLOT", 99);

    if (PlayerHasFetchItem(GetPCSpeaker()) == TRUE)
    {
        ActionPauseConversation();
        TakeFetchItem(GetPCSpeaker());
        ActionResumeConversation();
    }
    object oGem = GetItemPossessedBy(OBJECT_SELF, "M2Q1ITGEMSETARA");
    if (GetIsObjectValid(oGem))
    {
        ActionPauseConversation();
        ActionGiveItem(oGem, GetPCSpeaker());
        ActionResumeConversation();
    }
    object oKey = GetItemPossessedBy(OBJECT_SELF, "M2Q2J7KEY");
    if (GetIsObjectValid(oKey))
    {
        ActionPauseConversation();
        ActionGiveItem(oKey, GetPCSpeaker());
        ActionResumeConversation();
    }
    RewardXP(GetPlotTag(),100,GetPCSpeaker());
}
