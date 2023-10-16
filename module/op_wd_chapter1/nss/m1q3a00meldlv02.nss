#include "NW_I0_PLOT"

void main()
{
    object oKey = GetItemPossessedBy(OBJECT_SELF,"M1Q3A00MELDKEY");
    SetLocalInt(OBJECT_SELF,"Generic_Surrender",3);
    if(GetIsObjectValid(oKey))
    {
        ActionPauseConversation();
        ActionGiveItem(oKey,GetPCSpeaker());
        ActionResumeConversation();
    }
}
