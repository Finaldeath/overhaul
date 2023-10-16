//::///////////////////////////////////////////////
//:: q2aArgaliInv
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Checks if the player has not yet been told about Argali's inventory
   And had the conversation about war being profitable
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: July 23, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Argali_Inventory")==0;
    return iResult;
}

