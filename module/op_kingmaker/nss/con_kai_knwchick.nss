//::///////////////////////////////////////////////
//:: con_kai_knwchick
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Kaidala knows the chicken form
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_KAI_CHICKEN")==10;
    return iResult;
}