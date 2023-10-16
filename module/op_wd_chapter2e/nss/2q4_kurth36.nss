#include "NW_I0_PLOT"

void main()
{
    int iReward = GetLocalInt(GetPCSpeaker(),"Kurth_Gold_Reward");
    SetLocalInt(GetPCSpeaker(),"Working_For_Kurth",4);
    RewardXP("m2q4_Main",75,GetPCSpeaker());
    CreateItemOnObject("nw_it_mneck027",GetPCSpeaker(),1);

    if (iReward == 0)
    {
        RewardGP(1000,GetPCSpeaker());
    }
    if (iReward == 1)
    {
        RewardGP(1250,GetPCSpeaker());
    }
    if (iReward == 2)
    {
        RewardGP(1500,GetPCSpeaker());
    }
    if (iReward == 3)
    {
        RewardGP(2000,GetPCSpeaker());
    }
    if (iReward == 4)
    {
        RewardGP(2500,GetPCSpeaker());
    }
    if (iReward == 5)
    {
        RewardGP(3000,GetPCSpeaker());
    }

    object oHead = GetItemPossessedBy(GetPCSpeaker(), "2Q4_BaramHead");
    if(GetIsObjectValid(oHead))
    {
        DestroyObject(oHead);
    }
}
