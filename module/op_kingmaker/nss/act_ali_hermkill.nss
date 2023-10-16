//::///////////////////////////////////////////////
//:: Kill hermit
//:: act_ali_hermkill
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC gets Alias to kill the hermit
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
//Kill hermit, put smear of blood in his hovel, evil points,
//some xp, but less than complete mission, journal update.
    object oHermit = GetObjectByTag("q1_thehermit");
    object oPC = GetFirstPC();
    DestroyObject(oHermit);
    object oWay = GetObjectByTag("NW_HERMITHOME");
    location lWay = GetLocation(oWay);
    CreateObject(OBJECT_TYPE_PLACEABLE,"plc_bloodstain",lWay);
    AdjustAlignment(oPC,ALIGNMENT_EVIL,10);
    SetLocalInt(GetFirstPC(), "OS_HELPDRUID",50);
    if(os_GetXPReceived())
    {
        os_SetXPReceived();
        GiveXPToCreature(oPC,400);
    }
}
