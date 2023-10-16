int StartingConditional()
{
    object oRewardee = GetLocalObject(OBJECT_SELF,"NW_L_M1Q5BHarb_Reward");
    int bCondition = GetIsObjectValid(oRewardee)&&
                     GetPCSpeaker() == oRewardee;
    return bCondition;
}
