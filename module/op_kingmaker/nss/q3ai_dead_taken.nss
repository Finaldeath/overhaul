//::///////////////////////////////////////////////
//:: q3ai_dead_taken
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    There are at least three henchmen who haven't been banished.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oModule = GetModule();

    iResult = (GetLocalInt(oModule, "Q3AI_NOT_CHOSEN") < 2);

    return iResult;
}
