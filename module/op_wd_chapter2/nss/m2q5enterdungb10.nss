void main()
{
    if (GetIsPC(GetEnteringObject()) && GetLocalInt(GetModule(),"NW_G_M2Q5DungeonEntered") == 0)
    {
        SetLocalInt(GetModule(),"NW_G_M2Q5DungeonEntered",10);
    }
}
