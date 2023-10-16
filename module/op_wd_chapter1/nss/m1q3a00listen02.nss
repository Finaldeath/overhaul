int StartingConditional()
{
    int roll=d100();
    if (roll>75)
    {

            return !GetLocalInt(GetModule(),"NW_G_M1Q3AFormosa_Dead") &&
                   !GetLocalInt(GetModule(),"NW_G_M1Q3MeldDead");
    }
    return FALSE;
}
