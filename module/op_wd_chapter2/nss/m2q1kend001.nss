#include "m2_i0_plot"
#include "NW_I0_PLOT"

void main()
{
    object oStirgeEar = GetPartyItem(GetPCSpeaker(),"M2Q03ISTIRGEEAR");
    object oDelilahEar = GetPartyItem(GetPCSpeaker(),"M2Q04IDELILAHEAR");
    object oZorEar = GetPartyItem(GetPCSpeaker(),"M2Q05IZOREAR");
    object oWyvernEar = GetPartyItem(GetPCSpeaker(),"M2Q02IWYVERNEAR");

    ActionPauseConversation();
    if (GetIsObjectValid(oStirgeEar))
    {
        DestroyObject(oStirgeEar);
        RewardGP(300, GetPCSpeaker());
        RewardXP("m2q1_Bounty",25, GetPCSpeaker());
    }
    if (GetIsObjectValid(oDelilahEar))
    {
        DestroyObject(oDelilahEar);
        RewardGP(300, GetPCSpeaker());
        RewardXP("m2q1_Bounty",25, GetPCSpeaker());
    }
    if (GetIsObjectValid(oZorEar))
    {
        DestroyObject(oZorEar);
        RewardGP(300, GetPCSpeaker());
        RewardXP("m2q1_Bounty",25, GetPCSpeaker());
    }
    if (GetIsObjectValid(oWyvernEar))
    {
        DestroyObject(oWyvernEar);
        RewardGP(300, GetPCSpeaker());
        RewardXP("m2q1_Bounty",25, GetPCSpeaker());
    }
    ActionResumeConversation();

    SetLocalInt(GetModule(),"STIRGE_PLOT_DONE",1);
    SetLocalInt(GetModule(),"DELILAH_PLOT_DONE",1);
    SetLocalInt(GetModule(),"ZOR_PLOT_DONE",1);
    SetLocalInt(GetModule(),"WYVERN_PLOT_DONE",1);
    SetLocalInt(OBJECT_SELF,"Num_Ears_Collected",GetLocalInt(OBJECT_SELF,"Num_Ears_Collected") + 4);

}
