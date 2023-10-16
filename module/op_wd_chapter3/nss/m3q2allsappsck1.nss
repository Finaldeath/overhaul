int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "NW_L_M3Q2TALKREWARDGIVEN") ==0 &&
               GetAbilityScore(GetLastSpeaker(),ABILITY_INTELLIGENCE) > 8
               && GetLocalInt(GetPCSpeaker(),"NW_G_M3Q2H_SAPPHREWARD")==0;
    return iResult;
}
