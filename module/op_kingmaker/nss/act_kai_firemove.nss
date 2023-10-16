//::///////////////////////////////////////////////
//:: act_kai_firemove
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The monster moves slowly toward Kaidala
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void main()
{
    object oKai = OBJECT_SELF;
    object oMonst = GetObjectByTag("q1_firemonster");
    AssignCommand(oMonst,ActionMoveToObject(oKai));
}
