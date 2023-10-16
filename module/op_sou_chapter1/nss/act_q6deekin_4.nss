//::///////////////////////////////////////////////
//:: Name act_q6deekin_4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 Deekin gives the statue to the PC
assign 100% of XP from journal entry "xphigh"
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 5/03
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "q6_All_Done", 1);
    SetLocalInt(OBJECT_SELF, "nDeekinFetchStatue", 2);
    object oPC = GetPCSpeaker();
    CreateItemOnObject("x1tower", oPC);
    //RewardXP("xphigh", 100, oPC);
}
