//::///////////////////////////////////////////////
//:: Name con_q2asobrey_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
      Sobrey will initiate this the first time a
      PC views the battle cutscene..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith warner
//:: Created On: June 22/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "X2_SawUnivesityBattle") == 1)
        return TRUE;
    return FALSE;
}
