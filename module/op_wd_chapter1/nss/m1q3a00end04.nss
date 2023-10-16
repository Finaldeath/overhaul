#include "nw_i0_plot"

void main()
{
    object oKey=GetItemPossessedBy(GetPCSpeaker(),"M1Q3A00MELDKEY");
    object oTooth=GetItemPossessedBy(GetPCSpeaker(),"M1Q3A00TOOTH");
    object oReward=GetItemPossessedBy(OBJECT_SELF,"NW_IT_MNECK007");

    RewardGP(250,GetPCSpeaker(),FALSE);
    DestroyObject(GetItemPossessedBy(OBJECT_SELF,"NW_IT_GOLD001"));
    RewardXP("m1q3_Formosa",100,GetPCSpeaker());
    SetLocalInt(GetModule(),"NW_FORMOSA_JOB",2);
    ActionPauseConversation();
    ActionTakeItem(oTooth,GetPCSpeaker());
    ActionTakeItem(oKey,GetPCSpeaker());
    ActionGiveItem(oReward,GetPCSpeaker());
    ActionResumeConversation();
    SetLocalInt(OBJECT_SELF,"NW_L_M1Q3ItemsReceived",TRUE);
}
