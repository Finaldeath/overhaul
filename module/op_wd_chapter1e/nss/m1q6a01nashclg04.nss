// returns true if a player has spoken to Nasher
// and The ritual has been performed
int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q6A01NasherPostRitual")&&
                     GetLocalInt(GetModule(),"NW_G_M1Q6A01RitualComplete");
    return bCondition;
}

