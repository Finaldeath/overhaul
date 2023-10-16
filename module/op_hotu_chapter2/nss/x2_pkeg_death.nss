//::///////////////////////////////////////////////
//:: Name x2_pkeg_death
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Create a scorch mark when the powder keg is
    destroyed for 20 seconds
*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: June 12/03
//:://////////////////////////////////////////////

void main()
{
    object oScorch = CreateObject(OBJECT_TYPE_PLACEABLE, "x2_plc_scorch",GetLocation(OBJECT_SELF));
    AssignCommand(oScorch,DelayCommand(20.0f,DestroyObject(oScorch)));
}



