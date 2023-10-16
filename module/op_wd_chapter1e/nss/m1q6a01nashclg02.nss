// returns true if a player has spoken to Nasher
// and The ritual has not been performed
int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q6A01NasherPreRitual") &&
                     GetLocalInt(GetModule(),"NW_G_M1Q6A01RitualComplete") == FALSE;
    return bCondition;
}
