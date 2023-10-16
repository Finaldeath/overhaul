int StartingConditional()
{
    int bCondition = GetIsObjectValid(GetLocalObject(GetModule(),"NW_G_M1S4BarOwner")) &&
                     GetLocalObject(GetModule(),"NW_G_M1S4BarOwner") != GetPCSpeaker();;
    return bCondition;
}
