//::///////////////////////////////////////////////
//:: act_ili_first
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets that you've spoken with the illithid once
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    object oIllithid = GetObjectByTag("q3_illithid");
    SetLocalInt(oIllithid,"OS_ILLITHID",10);
}
