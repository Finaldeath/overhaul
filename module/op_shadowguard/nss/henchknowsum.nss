int StartingConditional()
{

    talent tSum = GetCreatureTalentBest(TALENT_CATEGORY_BENEFICIAL_OBTAIN_ALLIES, 20);;
    return GetIsTalentValid(tSum);
}
