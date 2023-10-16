//::///////////////////////////////////////////////
//:: Name act_cut108_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Jump the PC outside and begin the next wave of
    Battle 2
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 11/03
//:://////////////////////////////////////////////
void WrapJump(object oHench);
void main()
{
    //Mark Maeviir battle as over
    SetLocalInt(GetModule(), "X2_Q2ABattle2_Maeviir", 2);
    //Variable for Seer Conversation
    // NOTICE: removed this line to set the var only AFTER jumping to the next area.
    // This way the starting condition would remain the same and the player would
    // have a chance to run through the dialog again.
    //SetLocalInt(GetModule(), "X2_Q2ABattle2Wave1", 3);

    //Set City Core ready to spawn next wave of battle.
    SetLocalInt(GetModule(), "X2_Q2AnBattle2Spawn", 0);
    object oPC = GetPCSpeaker();

     //Raise any dead henchmen in the area..
    object oDeekin = GetObjectByTag("x2_hen_deekin");
    if (GetIsObjectValid(oDeekin) == TRUE)
    {
        if (GetIsDead(oDeekin) == TRUE)
        {
            if (GetArea(oDeekin) == GetArea(oPC))
            {
                WrapJump(oDeekin);
            }
        }
    }
    object oValen = GetObjectByTag("x2_hen_valen");
    if (GetIsObjectValid(oValen) == TRUE)
    {
        if (GetIsDead(oValen) == TRUE)
        {
            if (GetArea(oValen) == GetArea(oPC))
            {
                WrapJump(oValen);
            }
        }
    }
    object oNathyrra = GetObjectByTag("x2_hen_nathyra");
    if (GetIsObjectValid(oNathyrra) == TRUE)
    {
        if (GetIsDead(oNathyrra) == TRUE)
        {
            if (GetArea(oNathyrra) == GetArea(oPC))
            {
                WrapJump(oNathyrra);
            }
        }
    }


    object oTarget = GetWaypointByTag("wp_q2abattle2_lossstart");
    AssignCommand(oPC, ActionJumpToObject(oTarget));

}


void WrapJump(object oHench)
{

    if (GetIsDead(oHench))
    {

        // * Resurrect and heal again, just in case
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectResurrection(), oHench);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectHeal(GetMaxHitPoints(oHench)), OBJECT_SELF);

        // * recursively call self until we are alive again
        DelayCommand(1.0f,WrapJump(oHench));
        return;
    }
    string sTarget = "wp_bat2_henchspawn";
    AssignCommand(oHench, JumpToObject(GetWaypointByTag(sTarget), FALSE));
}
