//::///////////////////////////////////////////////
//:: q2bogre20
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if Ogre Mage status is at 20
    (OgreMageDead)
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: July 28, 2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"OgreMage")==20;
    return iResult;
}
