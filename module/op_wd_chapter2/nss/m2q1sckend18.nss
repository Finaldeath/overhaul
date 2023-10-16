#include "NW_I0_PLOT"

void main()
{
    object oStirgeEar = GetItemPossessedBy(GetPCSpeaker(),"M2Q03ISTIRGEEAR");
    object oDelilahEar = GetItemPossessedBy(GetPCSpeaker(),"M2Q04IDELILAHEAR");
    object oZorEar = GetItemPossessedBy(GetPCSpeaker(),"M2Q05IZOREAR");
    object oWyvernEar = GetItemPossessedBy(GetPCSpeaker(),"M2Q02IWYVERNEAR");

    if (GetIsObjectValid(oStirgeEar))
    {
        RewardGP(100,GetPCSpeaker(),FALSE);
        RewardXP("M2Q1A08KEND_PLOT",25,GetPCSpeaker());
        SetLocalInt(GetModule(),"STIRGE_PLOT_DONE",1);
        SetLocalInt(OBJECT_SELF,"Num_Ears_Collected",GetLocalInt(OBJECT_SELF,"Num_Ears_Collected") + 1);
        ActionTakeItem(oStirgeEar,GetPCSpeaker());
    }
    if (GetIsObjectValid(oDelilahEar))
    {
        RewardGP(100,GetPCSpeaker(),FALSE);
        RewardXP("M2Q1A08KEND_PLOT",25,GetPCSpeaker());
        SetLocalInt(GetModule(),"DELILAH_PLOT_DONE",1);
        SetLocalInt(OBJECT_SELF,"Num_Ears_Collected",GetLocalInt(OBJECT_SELF,"Num_Ears_Collected") + 1);
        ActionTakeItem(oDelilahEar,GetPCSpeaker());
    }
    if (GetIsObjectValid(oZorEar))
    {
        RewardGP(100,GetPCSpeaker(),FALSE);
        RewardXP("M2Q1A08KEND_PLOT",25,GetPCSpeaker());
        SetLocalInt(GetModule(),"ZOR_PLOT_DONE",1);
        SetLocalInt(OBJECT_SELF,"Num_Ears_Collected",GetLocalInt(OBJECT_SELF,"Num_Ears_Collected") + 1);
        ActionTakeItem(oZorEar,GetPCSpeaker());
    }
    if (GetIsObjectValid(oWyvernEar))
    {
        RewardGP(100,GetPCSpeaker(),FALSE);
        RewardXP("M2Q1A08KEND_PLOT",25,GetPCSpeaker());
        SetLocalInt(GetModule(),"WYVERN_PLOT_DONE",1);
        SetLocalInt(OBJECT_SELF,"Num_Ears_Collected",GetLocalInt(OBJECT_SELF,"Num_Ears_Collected") + 1);
        ActionTakeItem(oWyvernEar,GetPCSpeaker());
    }
}
