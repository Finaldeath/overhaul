//::///////////////////////////////////////////////
//:: act_eni_jump
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Becket and Mommaji jump to Enivid
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Dec 2003
//:://////////////////////////////////////////////

void main()
{
    object oEnivid = OBJECT_SELF;
    object oBecket = GetObjectByTag("q2_sirbecket");
    object oMomma = GetObjectByTag("q2_mommaji");
    AssignCommand(oBecket,ClearAllActions());
    AssignCommand(oMomma,ClearAllActions());
    AssignCommand(oBecket,ActionMoveToObject(oEnivid,TRUE));
    AssignCommand(oMomma,ActionMoveToObject(oEnivid,TRUE));
}
