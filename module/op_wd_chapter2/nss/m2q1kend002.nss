#include "NW_I0_PLOT"

void main()
{
    object oStirgeEar = GetItemPossessedBy(GetPCSpeaker(),"M2Q03ISTIRGEEAR");
    object oDelilahEar = GetItemPossessedBy(GetPCSpeaker(),"M2Q04IDELILAHEAR");
    object oZorEar = GetItemPossessedBy(GetPCSpeaker(),"M2Q05IZOREAR");
    object oWyvernEar = GetItemPossessedBy(GetPCSpeaker(),"M2Q02IWYVERNEAR");

    ActionPauseConversation();
    ActionTakeItem(oStirgeEar,GetPCSpeaker());
    ActionTakeItem(oDelilahEar,GetPCSpeaker());
    ActionTakeItem(oZorEar,GetPCSpeaker());
    ActionTakeItem(oWyvernEar,GetPCSpeaker());
    ActionResumeConversation();

    RewardGP(900,GetPCSpeaker());
    RewardXP("m2q1_Bounty",75, GetPCSpeaker());

    SetLocalInt(GetModule(),"STIRGE_PLOT_DONE",1);
    SetLocalInt(GetModule(),"DELILAH_PLOT_DONE",1);
    SetLocalInt(GetModule(),"ZOR_PLOT_DONE",1);
    SetLocalInt(GetModule(),"WYVERN_PLOT_DONE",1);
    SetLocalInt(OBJECT_SELF,"Num_Ears_Collected",GetLocalInt(OBJECT_SELF,"Num_Ears_Collected") + 3);
}
