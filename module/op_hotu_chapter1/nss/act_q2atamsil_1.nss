//::///////////////////////////////////////////////
//:: Name act_q2atamsil_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Set a Variable that Tamsil has talked to the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 24/03
//:://////////////////////////////////////////////

void main()
{
    object oTrigger = GetObjectByTag("q2atamsiltrigger");
    SetLocalInt(oTrigger, "nTamsilTalked", 1);
}
