//:://////////////////////////////////////////////
/*
    Checks to see if someone has alread been "evil"
    to the NPC, so gold cannot be extorted twice, etc.
*/
//:://////////////////////////////////////////////
//:: Created By: Lukas Kristjanson
//:: Created On: Mar 01, 2002
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult =  GetLocalInt(OBJECT_SELF,"Evil") ==1;
    return iResult;
}

