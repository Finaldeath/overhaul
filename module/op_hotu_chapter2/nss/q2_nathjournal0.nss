///Check if Nathyrra has not given the players
///Initial Journal entries on beholder, illithid and undead

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"Nathyrra_Journal")==0;
    return iResult;
}
