//::///////////////////////////////////////////////
//:: q6_Mirror10
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Checks if the player knows about the shattered mirror
   (Main plot set to 10)
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: September 3, 2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    int iResult;

    iResult =  GetLocalInt(GetModule(),"Mirror")>=10;
    return iResult;
}
