//::///////////////////////////////////////////////
//:: q2adurnwarn
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Checks if Durnan has given his "go get equipment" warning to players
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Durnan_Warning")==0;

    return iResult;
}
