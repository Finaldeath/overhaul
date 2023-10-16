int StartingConditional()
{
    int roll=d100();
    if (roll>66)
    {
            return GetLocalInt(GetModule(),"NW_G_M1Q3MeldDead");
    }
    return FALSE;
}
