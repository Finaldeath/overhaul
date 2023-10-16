//::///////////////////////////////////////////////
//:: act_ali_illithid
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Alias takes PC to the illithid.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    object oWay = GetObjectByTag("q1_map_illithid");
    object oPC = GetFirstPC();
    object oIllithid = GetObjectByTag("q1ab_at_q3ak2");
    SetLocked(oIllithid,FALSE);
    SetLocalInt(OBJECT_SELF,"OS_ALIAS_ATDEST",1);
    SetLocalInt(OBJECT_SELF,"OS_ALIAS_DESTINATION",70);
    os_MoveParty(oWay,oPC);
    DelayCommand(0.5,ActionJumpToObject(oWay));
}
