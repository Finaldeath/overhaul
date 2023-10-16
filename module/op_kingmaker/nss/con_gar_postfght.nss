//::///////////////////////////////////////////////
//:: After Fight dialogue
//:: con_gar_postfight
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Garrot has finished the fight
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_GARROT_HELPED")==30;
    return iResult;
}
