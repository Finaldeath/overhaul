//::///////////////////////////////////////////////
//:: act_grd_dwrfjob
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The PC has taken the Gord's dwarf job
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    object oWay = GetObjectByTag("q3_map_duergar");
    location lWay = GetLocation(oWay);
    object oDoor = GetObjectByTag("q1_gate_q3d2");
//    object oMap = GetObjectByTag("q3_map_manticore");
    SetMapPinEnabled(oWay,1);
    SetLocked(oDoor,FALSE);
    CreateObject(OBJECT_TYPE_CREATURE,"q3_dscout",lWay);
    SetLocalInt(OBJECT_SELF,"OS_THEGORD_JOB",10);
    SetLocalInt(GetModule(), "OS_THEGORD_DWARF",20);
}
