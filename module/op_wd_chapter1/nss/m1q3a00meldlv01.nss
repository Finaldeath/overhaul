#include "NW_I0_PLOT"

void main()
{
    object oKey = GetItemPossessedBy(OBJECT_SELF,"M1Q3A00MELDKEY");
    RewardGP(500,GetPCSpeaker(),FALSE);
    SetLocalInt(OBJECT_SELF,"NW_L_RewardGiven",TRUE);
    SetLocalInt(OBJECT_SELF,"Generic_Surrender",3);
    if(GetIsObjectValid(oKey))
    {
        ActionGiveItem(oKey,GetPCSpeaker());
    }
}
