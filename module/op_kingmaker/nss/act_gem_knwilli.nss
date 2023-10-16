//::///////////////////////////////////////////////
//:: act_gem_knwilli
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC knows about the Illithid
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    location lPC = GetLocation(oPC);
    SetLocalInt(oPC,"OS_KNOW_ILLITHID",10);
//show a ghostly image in front of the PC of the illithid,
//use some of the new ghost effects
    CreateObject(OBJECT_TYPE_CREATURE,"q3_gem_illithid",lPC,TRUE);
}
