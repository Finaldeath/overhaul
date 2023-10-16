//::///////////////////////////////////////////////
//:: q2aArgaliTalk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Checks if the player has asked Argali about
   refererring to herself in the third person
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: July 23, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Argali_3rdPerson")==0;
    return iResult;
}
