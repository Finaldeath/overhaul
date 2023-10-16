void main()
{
    if (GetTag(GetModuleItemAcquired()) == "M1Q04ILocket" &&
        GetLocalInt(GetModule(),"NW_G_M1Q4SilverSails") == 0)
    {
        SetLocalInt(GetModule(),"NW_G_M1Q4SilverSails",10);
    }
    else if (GetTag(GetModuleItemAcquired()) == "M1Q04ITavernKey" &&
        GetLocalInt(GetModule(),"NW_G_M1Q4Backdoor") == 0)
    {
        SetLocalInt(GetModule(),"NW_G_M1Q4Backdoor",10);
    }
}
