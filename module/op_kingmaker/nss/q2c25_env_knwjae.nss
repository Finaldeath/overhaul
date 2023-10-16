//::///////////////////////////////////////////////
//:: Jaess Known About
//:: q2c25_env_knwjae
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The player knows about Jaess
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_ENIVID_JAESS")==10;
    return iResult;
}
