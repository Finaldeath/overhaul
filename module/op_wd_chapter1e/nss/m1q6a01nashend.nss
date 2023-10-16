void main()
{
    if(GetLocalInt(GetModule(),"NW_G_M1Q6A01RitualComplete"))
    {
        SetLocalInt(GetModule(),"NW_G_M1Q6A01NasherPostRitual",TRUE);
    }
    else
    {
        SetLocalInt(GetModule(),"NW_G_M1Q6A01NasherPreRitual",TRUE);
    }
}
