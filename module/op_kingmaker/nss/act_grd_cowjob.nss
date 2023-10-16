//::///////////////////////////////////////////////
//:: act_grd_cowjob
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The PC has taken the Gord's cow job
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    object oMap = GetObjectByTag("q3_map_kobold");
    SetMapPinEnabled(oMap,1);

    CreateItemOnObject("key_koboldcows", GetFirstPC());
    SetLocalInt(OBJECT_SELF,"OS_THEGORD_JOB",10);
    SetLocalInt(GetModule(), "OS_THEGORD_COWS",20);
}
