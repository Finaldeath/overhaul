//::///////////////////////////////////////////////
//:: PC Gives Honey
//:: act_sni_honeygiv
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC gives the honey to the kobolds
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
//Take honey from PC, PC now safe to enter kobold caves.
//Kobolds will lie or wander around and say honey pop ups (q3_khoney)
    object oPC = GetFirstPC();
    int iDoOnce = GetLocalInt(OBJECT_SELF, "act_sni_honeygiv");
    os_DestroyItem("q1_honey");

//  object oHoney = GetItemPossessedBy(oPC,"q1_honey");

    SetLocalInt(oPC,"OS_KOBOLD_HONEY",10);

    if (iDoOnce == FALSE)
    {
        SetLocalInt(OBJECT_SELF, "act_sni_honeygiv", TRUE);
        GiveXPToCreature(oPC, 300);
    }
    else
    {
        GiveXPToCreature(oPC, 100);
    }
}
