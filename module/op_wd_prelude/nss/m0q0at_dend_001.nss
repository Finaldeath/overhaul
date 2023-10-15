void main()
{
    SetLocalInt(GetModule(),"NW_G_M1Q0BMelee",TRUE);
    if(GetLocalInt(GetModule(),"NW_G_M1Q0BRanged"))
    {
        SetLocalInt(GetModule(),"NW_G_M0Q01_FIGHTER_TEST",2);
    }

}
