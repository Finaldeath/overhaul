//::///////////////////////////////////////////////
//:: Know Dwarf
//:: con_ali_knwdwarf
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC knows about the dwarf quest
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oGord = GetObjectByTag("q2_thegord");
    iResult = GetLocalInt(GetModule(), "OS_THEGORD_DWARF")>=20;
    return iResult;
}
