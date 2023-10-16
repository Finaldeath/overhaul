//::///////////////////////////////////////////////
//:: act_jointemp_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Set that the PC is on the quest to join the temple.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: July 22, 2003
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetFirstPC();
    if(GetLocalInt(oPC,"os_jointemple_pc")<20)
    {
        SetLocalInt(oPC,"os_jointemple_pc",20);
        CreateItemOnObject("q2c_itm_fish",oPC);
        CreateItemOnObject("q2c_itm_fish",oPC);
        CreateItemOnObject("q2c_itm_fish",oPC);
    }
}

