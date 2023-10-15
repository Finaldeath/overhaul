void main()
{
    SetLocalInt(GetPCSpeaker(),"NW_L_TALK_GELDAR",GetLocalInt(GetPCSpeaker(),"NW_L_TALK_GELDAR") + 1);
    if(GetXP(GetPCSpeaker()) < 1000)
    {
        SetXP(GetPCSpeaker(),1000);
    }
}
