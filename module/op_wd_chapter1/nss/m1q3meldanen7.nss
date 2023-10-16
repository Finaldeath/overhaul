void main()
{
    SetLocalInt(GetModule(),"NW_G_M1Q3MeldDead",TRUE);
    if(GetLocalInt(OBJECT_SELF,"NW_L_RewardGiven") == FALSE)
    {
        CreateItemOnObject("nw_it_gold001",OBJECT_SELF,500);
    }
}
