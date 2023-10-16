//::///////////////////////////////////////////////
//:: Name  act_q1bnora_end
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    have Adam and Nora jump to their post-plot
    positions
    UPDATE Mar 19/03  Nora jumps to her post plot
    position - Destroy adam's body - create headstone
    for Adam behind the house..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 26/03
//:://////////////////////////////////////////////

void main()
{
    object oTargetAdam = GetWaypointByTag("wp_q1h_grave_adam");
    object oTargetNora = GetWaypointByTag("wp_q1h_post_nora");
    object oNora = GetObjectByTag("q1bnora");
    object oAdam = GetObjectByTag("q1hblake");
    object oDoor = GetObjectByTag("q1b_ext_blake");

    if (oAdam != OBJECT_INVALID)
    {
        AssignCommand(oAdam, SetIsDestroyable(TRUE));
        object oCorpse = GetObjectByTag("q1blakecorpse");
        DestroyObject(oCorpse);
        DestroyObject(oAdam);
    }
    AssignCommand(oNora, ActionMoveToObject(oDoor, TRUE,2.0));
    SetCommandable(FALSE, oNora);
    DestroyObject(oNora, 1.0);
    CreateObject(OBJECT_TYPE_CREATURE, "q1bnora", GetLocation(oTargetNora));
    //object oAdam1 = CreateObject(OBJECT_TYPE_CREATURE, "q1hblake", GetLocation(oTargetAdam));
    //SetLocalInt(oAdam1, "nHealed", 1);
    CreateObject(OBJECT_TYPE_PLACEABLE, "q1badamhstone", GetLocation(oTargetAdam));
}
