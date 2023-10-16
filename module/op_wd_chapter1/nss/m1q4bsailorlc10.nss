void main()
{
    if (GetLocalInt(GetModule(),"NW_G_BloodSailors") == 0)
    {
        SetLocalInt(GetModule(),"NW_G_BloodSailors",10);
    }
}
