//::///////////////////////////////////////////////
//:: Name: act_cynn_01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Cynn will go over to Mother Salinka after this
    conversation with the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 21/03
//:://////////////////////////////////////////////

void main()
{
    AssignCommand(OBJECT_SELF, ActionMoveToObject(GetObjectByTag("MadameSalinka")));
}
