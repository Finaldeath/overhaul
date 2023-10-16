//::///////////////////////////////////////////////
//:: q2aAgalispec
//:: //:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Player was told to ask about Argali's special item
    By Mother Salinka
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_ARGALIITEM")==10;
    return iResult;
}
