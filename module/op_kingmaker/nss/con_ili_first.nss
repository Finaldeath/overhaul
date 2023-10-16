//::///////////////////////////////////////////////
//:: con_ili_first
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has not yet spoken with the Illithid
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oIllithid = GetObjectByTag("q3_illithid");
    iResult = GetLocalInt(oIllithid,"OS_ILLITHID")==0;
    return iResult;
}
