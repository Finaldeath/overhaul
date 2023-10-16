//::///////////////////////////////////////////////
//:: q4c_ghostTalk10
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if the Talk Variable on the Ghost is 10
    (introduction done, offer not heard)
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: August 18, 2003

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"GhostTalk")==10;
    return iResult;
}
