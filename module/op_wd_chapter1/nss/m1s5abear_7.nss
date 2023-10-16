void main()
{
    SetLocalInt(GetModule(),
                "NW_G_M1S5AnimalsKilled",
                GetLocalInt(GetModule(),"NW_G_M1S5AnimalsKilled") + 1);
}
