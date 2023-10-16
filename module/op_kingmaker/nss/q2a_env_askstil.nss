//::///////////////////////////////////////////////
//:: Heard about Stiletto
//:: q2a_env_askstil
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the player has heard about stiletto
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_ENIVID_STILETTO")==10
        && GetLocalInt(GetModule(), "OS_ENIVID_ANGRY")!=99;
    return iResult;
}
