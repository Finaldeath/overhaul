//::///////////////////////////////////////////////
//:: PC has dagger
//:: con_gar_hasdaggr
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    PC has poisoned dagger
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////
#include "os_include"
int StartingConditional()
{
    int iResult;
    //if pc still has the poisoned dagger from the Hermit's hive

    iResult = os_CheckItem("q1_poisondagger");

    return iResult;
}
