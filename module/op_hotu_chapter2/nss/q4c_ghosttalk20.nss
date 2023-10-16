//::///////////////////////////////////////////////
//:: q4c_ghostTalk20
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if the Talk Variable on the Ghost is 20
    (offer heard)
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: August 18, 2003

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"GhostTalk")==20;
    return iResult;
}
