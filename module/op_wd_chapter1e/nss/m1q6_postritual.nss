// returns true if the ritual has been performed
int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q6A01RitualComplete");
    return bCondition;
}
