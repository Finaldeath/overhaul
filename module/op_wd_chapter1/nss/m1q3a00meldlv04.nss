#include "NW_I0_PLOT"

void main()
{
    object oKey = GetItemPossessedBy(OBJECT_SELF,"M1Q3A00MELDKEY");
    SetLocalInt(OBJECT_SELF,"Generic_Surrender",3);
    RewardGP(500,GetPCSpeaker(),FALSE);
    SetLocalInt(OBJECT_SELF,"NW_L_RewardGiven",TRUE);
    if(GetIsObjectValid(oKey))
    {
        ActionGiveItem(oKey,GetPCSpeaker());
    }
}

